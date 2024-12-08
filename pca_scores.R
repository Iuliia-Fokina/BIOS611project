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
write_csv(pca_scores, "derived_data/pca_scores.csv")