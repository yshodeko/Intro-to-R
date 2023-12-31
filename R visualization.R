library(help="graphics")

# load the data set in R

parkinfo <- read.csv("NationalParkInfo.csv", header=TRUE, sep=",")

# Explore the newly built object a little bit and check if its in your desired format

str(parkinfo)
#View(parkinfo)
head(parkinfo, n=3)
tail(parkinfo, n=3)
summary(parkinfo)

# Plot a basic scatter plot

plot(parkinfo)

# Now, to study the relationship between the wildlife_count and park_staff_count.

plot(parkinfo$Wildlife_Count, parkinfo$Park_Staff_Count) # The plot shows mostly a positive correlation.



# Using arguments with the plot() function
# We can easily style our charts by using different arguments of the plot() function. One of them is the type argument.
# type argument:
# The plot function has the type argument that takes in values like p: points, 
# l: lines, b: points & lines, h: high-density vertical lines. This decides the output graph shape.

plot(parkinfo$Wildlife_Count, type="b")

# We can also label the X and the Y axis and give a title and color to the plot. 

plot(parkinfo$Wildlife_Count, xlab = 'Parks', ylab = 'Wildlife Count', main = 'Wildlife Count in National Parks around the World', col = 'blue', type='b')

# In a bar plot, data is represented in the form of rectangular bars 
# and the length of the bar is proportional to the value of the variable or column in the dataset. 
# Both horizontal, as well as a vertical bar chart, can be generated by tweaking the horiz parameter.
# Horizontal bar plot

barplot(parkinfo$Wildlife_Count, main = 'Wildlife Count in National Parks around the World',xlab = 'Wildlife Count', col= 'green',horiz = TRUE)

# A histogram is similar to a bar chart except that it groups values into continuous ranges. 
# It represents frequencies of values of a variable bucketed into ranges.

hist(parkinfo$Entry_Fee,main = 'Entry Fee for National Parks',xlab = 'Entry Fee', col='red')

# Boxplot is graphical representation of the summary() command in the form of quartiles.
# Single box plot

boxplot(parkinfo$Entry_Fee)

# Multiple box plots

boxplot(parkinfo[,3], parkinfo[,4], parkinfo[,6], parkinfo[,7], main='Multiple Box plots')
boxplot(parkinfo[,c(3,4,6,7)], main= 'Multiple Box plots')

# Grid of Charts
# This is a very useful feature in R with which we can plot multiple charts at once. 
# You can plot different types of graphs at once and then pick and choose which one explains your data more informatively.
# For drawing a grid, the first argument should specify certain attributes 
# like the margin of the grid(mar), 
# no of rows and columns(mfrow), 
# whether a border is to be included(bty) 
# and position of the labels(las: 1 for horizontal, las: 0 for vertical).

par(mfrow=c(3,3), mar=c(2,5,2,1), las=1, bty="n")

plot(parkinfo$Entry_Fee)

plot(parkinfo$Entry_Fee, parkinfo$Visitor_Each_Year)

plot(parkinfo$Wildlife_Count, type="c")

plot(parkinfo$Park_Staff_Count, type="h")

plot(parkinfo$Visitor_Each_Year, type="s")

barplot(parkinfo$Entry_Fee, main = 'Entry Fee in National Parks',xlab = 'Entry Fee', col='green',horiz = TRUE)

hist(parkinfo$Park_Staff_Count)

boxplot(parkinfo[,c(3,6)], main='Multiple Box plots')




# ggplot2
library(ggplot2)
# Loading the dataset
attach(parkinfo)

# Scatterplots using ggplot2

ggplot(data = parkinfo, mapping = aes(x = Wildlife_Count, y = Park_Staff_Count)) + geom_point()

# Styling scatter plots by factor

ggplot(data = parkinfo, mapping = aes(x = Wildlife_Count, y = Park_Staff_Count, color = as.factor(Park_Country))) + geom_point()

# Styling scatter plots by size

ggplot(data = parkinfo, mapping = aes(x = Wildlife_Count, y = Park_Staff_Count, size = Visitor_Each_Year)) + geom_point()

# Different symbols for different sizes

p <- ggplot(parkinfo,aes(Wildlife_Count, Park_Staff_Count, shape = factor(Park_Country)))

p + geom_point(aes(colour = factor(Park_Country)), size = 4) + geom_point(colour = "grey90", size = 1.5)



# Heatmaps using ggplot2
# For a basic heatmap, we will use the geom_tile() function of ggplot2. 
# Here, the input data must be a long format 
# (check this link for further explanation on long and wide formats along with the conversion details: 
# http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/) 
# where each row provides an observation. At least 3 variables are needed per observation:
  # x: position on the X axis
# ???	y: position on the Y axis
# ???	fill: the numeric value that will be translated in a color



# Let's try:

# dummy data

x <- LETTERS[1:20]
y <- paste0("var", seq(1,20))
data <- expand.grid(X=x, Y=y)
data$Z <- runif(400, 0, 5)

 # Heatmap 

ggplot(data, aes(X, Y, fill= Z)) + geom_tile()

































