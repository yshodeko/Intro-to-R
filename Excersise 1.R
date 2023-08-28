exercise <- read.csv("GSE71562.CSV")
head(exercise)
View(exercise)
character_removal <- exercise[,-1]
#View(character_removal)
myxe <- numeric(length(character_removal[,1]))
#myxe
for(i in seq(myxe)){
  myxe[i] <- mean(as.numeric(character_removal[i,]))
}
myxe[1:8]
myxe
mygene <- c(exercise[,-2:-19], myxe)
View(mygene)

# Load required libraries
library(dplyr)

# Assuming your data is stored in a data frame named my_data

# Problem 1: Calculate average of 18 numeric variables and find the name of the highest average
averages <- exercise %>%
  summarise(across(where(is.numeric), mean, na.rm = TRUE))

max_avg <- which.max(averages)
name_of_max_avg <- names(averages)[max_avg]

# Print the result
cat("Problem 1:\n")
cat("Variable with the highest average:", name_of_max_avg, "\n")



# Problem 2: Print gene names and numbers that are 2 standard deviations above the averages
avg_values <- rowMeans(exercise %>%
                         select(-Gene),
                       na.rm = TRUE)
std_dev <- sd(avg_values, na.rm = TRUE)
threshold <- mean(avg_values, na.rm = TRUE) + 2 * std_dev

above_threshold <- which(avg_values > threshold)
genes_above_threshold <- exercise$Gene[above_threshold]

# Print the result
cat("\nProblem 2:\n")
cat("Genes with averages above 2 standard deviations:\n")
for (gene in genes_above_threshold) {
  cat("Gene name:", gene, "\tAverage:", avg_values[match(gene, exercise$Gene)], "\n")
}

