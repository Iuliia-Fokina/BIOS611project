library(tidyverse);
pca_result <- read_csv("derived_data/pca_result.csv")
plot0 <- biplot(pca_result, scale = 0)
ggsave("figures/biplot.png", plot=plot0)
