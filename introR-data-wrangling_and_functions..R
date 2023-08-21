age <- c(15,22,45,52,73,81)
age[5]
age[-5]
age[c(-5,-1)]
exception <- c(-5,-1, -3)
age[exception]
age[-1:-4]
age[4:1]
age>50 # Prints out logical values in form of T&F which matches statement
age>50|age<18 # Prints out logical values in form of T&F which matches statement
age[age>50|age<18] #  Prints out values that fits the logical command
exception1 <- age>50|age<18
exception1
age[exception1]
# To get the index use which function, also only works for logical statements
which(age>50|age<18)
age[which(age>50|age<18)] #  Prints out values that fits the logical command

metadata <- read.csv("mouse_exp_design.csv")
metadata
data("iris")
View(iris)
mydf <- iris
mydf
myve <- numeric(length(mydf[,1]))
myve
# for loop iterate over elements of a looping vector
for(i in seq(myve)){
  myve[i] <- mean(as.numeric((mydf[i,1:3])))
}
myve[1:8]

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


# Problem 2: Print variable names and numbers that are 2 standard deviations above the averages
avg_values <- rowMeans(exercise %>%
                         select(where(is.numeric)),
                       na.rm = TRUE)
std_dev <- sd(avg_values, na.rm = TRUE)
threshold <- mean(avg_values, na.rm = TRUE) + 2 * std_dev

above_threshold <- which(avg_values > threshold)
names_above_threshold <- row.names(exercise)[above_threshold]

# Print the result
cat("\nProblem 2:\n")
cat("Genes with averages above 2 standard deviations:\n")
for (name in names_above_threshold) {
  cat("Gene name:", name, "\tAverage:", avg_values[name], "\n")
}


# Load required libraries
library(dplyr)

# Create a sample data frame
exercise <- data.frame(
  Gene = c("aaeA", "aaeB", "aaeR", "aaeX", "aas", "aat"),
  E14R012a01 = c(100, 116, 316, 77, 407, 243),
  E14R012a02 = c(56, 47, 253, 53, 286, 169),
  E14R012a03 = c(44, 54, 249, 53, 283, 163),
  E14R012a04 = c(94, 80, 396, 86, 375, 252),
  E14R012a05 = c(32, 37, 181, 46, 188, 104)
)

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

