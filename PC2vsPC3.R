library(tidyverse);
pca_plot_data <- read_csv("derived_data/pca_plot_data.csv")
plot3 <- ggplot(pca_plot_data, aes(x = PC2, y = PC3)) +
  geom_point(aes(color = Reading), size = 3) +
  labs(
    title = "PCA: PC2 vs PC3",
    x = "Principal Component 2",
    y = "Principal Component 3",
    color = "Reading"
  ) +
  theme_minimal()
ggsave("figures/PC2vsPC3.png", plot=plot3)