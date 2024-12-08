library(tidyverse);
pca_plot_data <- read_csv("derived_data/pca_plot_data.csv")
plot <- ggplot(pca_plot_data, aes(x = PC1, y = PC2)) +
  geom_point(aes(color = Reading), size = 3) +
  labs(
    title = "PCA: PC1 vs PC2",
    x = "Principal Component 1",
    y = "Principal Component 2",
    color = "Reading"
  ) +
  theme_minimal()
ggsave("figures/PC1vsPC2.png", plot=plot)
