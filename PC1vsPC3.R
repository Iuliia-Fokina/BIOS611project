library(tidyverse);
pca_plot_data <- read_csv("derived_data/pca_plot_data.csv")
plot2 <- ggplot(pca_plot_data, aes(x = PC1, y = PC3)) +
  geom_point(aes(color = Reading), size = 3) +
  labs(
    title = "PCA: PC1 vs PC3",
    x = "Principal Component 1",
    y = "Principal Component 3",
    color = "Reading"
  ) +
  theme_minimal()
ggsave("figures/PC1vsPC3.png", plot=plot2)