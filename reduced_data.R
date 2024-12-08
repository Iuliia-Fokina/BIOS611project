library(tidyverse);
cleaned_data <-read_csv("derived_data/cleaned_data.csv");
numeric_cols <- dplyr::select(cleaned_data, IA_First_Fixation_Time, FFdur, 
                              F2dur, FPNfix, GZD, regrdur, TTime, Skip)
numeric_cols_scaled <- scale(numeric_cols)
numeric_cols_scaled_clean <- numeric_cols_scaled[complete.cases(numeric_cols_scaled) & 
                                                   !apply(numeric_cols_scaled, 1, function(x) any(is.infinite(x))), ]
pca_result <- prcomp(numeric_cols_scaled_clean, center = TRUE, scale. = TRUE)
summary(pca_result)
pca_result$rotation
pca_scores <- pca_result$x
cleaned_data_aligned <- cleaned_data[complete.cases(numeric_cols_scaled) &
                                       !apply(numeric_cols_scaled, 1, function(x) any(is.infinite(x))), ]
pca_plot_data <- cbind(pca_scores, Reading = cleaned_data_aligned$Reading)
pca_plot_data <- as.data.frame(pca_plot_data)
reduced_data <- as.data.frame(pca_scores[, 1:2]) 
set.seed(123) 
# Apply k-means clustering with 3 clusters (adjust k based on your use case)
kmeans_result <- kmeans(reduced_data, centers = 3, nstart = 25)
# Add the cluster assignments to the data
reduced_data$Cluster <- as.factor(kmeans_result$cluster)
# View the cluster centers
kmeans_result$centers
write_csv(reduced_data, "derived_data/reduced_data.csv")
