library(tidyverse);
pca_scores <-read_csv("derived_data/pca_scores.csv");
reduced_data <- as.data.frame(pca_scores[, 1:2]) 
set.seed(123) 
# Apply k-means clustering with 3 clusters (adjust k based on your use case)
kmeans_result <- kmeans(reduced_data, centers = 3, nstart = 25)
# Add the cluster assignments to the data
reduced_data$Cluster <- as.factor(kmeans_result$cluster)
# View the cluster centers
kmeans_result$centers
write_csv(reduced_data, "derived_data/reduced_data.csv")
