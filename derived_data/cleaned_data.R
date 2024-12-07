library(tidyverse);
cleaned_data <-read_csv("./cleaned_data2.csv");
SentenceRelevance_labels <- c("0 Neutral", "1 Buyer", "2 Sitter")
SubjectPerspective_labels <- c("Started with Sitter", "Started with Buyer")
CongruencyLevels_labels <- c("Non-congruent", "Neutral", "Congruent")
cleaned_data$CongruencyLevels <- factor(cleaned_data$CongruencyLevels)
write_csv(cleaned_data, "derived_data/cleaned_data.csv")