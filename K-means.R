library(tidyverse);
reduced_data <- read_csv("derived_data/reduced_data.csv")
plot4 <- ggplot(reduced_data, aes(x = PC1, y = PC2, color = Cluster)) +
  geom_point(size = 3) +
  labs(
    title = "K-means Clustering on Principal Components",
    x = "Principal Component 1",
    y = "Principal Component 2",
    color = "Cluster"
  ) +
  theme_minimal()
ggsave("figures/K-means.png", plot=plot4)