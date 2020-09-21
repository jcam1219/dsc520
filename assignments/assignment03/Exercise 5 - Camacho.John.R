# Assignment: Exercise 5
# Name: Camacho, John
# Date: 2020-09-18

## Load the packages needed for the assignment
library(ggplot2)
library(car)
library(pastecs)
library(psych)
library(Rcmdr)
library(dplyr)
library(ggfortify)

theme_set(theme_minimal())



## working directory to project root folder 
setwd("C:/Users/Joslyn/Desktop/John Documents/Data Science Class/DSC520/dsc520/data")

#Loading the file `data/acs-14-1yr-s0201.csv` and assigning it to national data using `read.csv`
national_data <- read.csv("C:/Users/Joslyn/Desktop/John Documents/Data Science Class/DSC520/dsc520/data/acs-14-1yr-s0201.csv")

#Providing the results of str, nrow and ncol. 
str(national_data)
nrow(national_data)
ncol(national_data)

#Creating the mean and the standard deviation of HSDegree
HSDegree_M <- mean(national_data$HSDegree)
HSDegree_SD <- sd(national_data$HSDegree, na.rm = FALSE)
HSDegree_M
HSDegree_SD

## Creating a histogram variable for HSDdegree` using `geom_histogram()`

graph <- ggplot(national_data, aes(HSDegree)) + geom_histogram(aes(y = ..density..), bins = 30, colour = "black", fill = "white") + labs(x = "High School Degree", y = "Density") + ggtitle("The National High School Degree Chart")
# Displaying the HSDegree graph
graph
# Adding a normal curve to the histogram 
graph + stat_function(fun = dnorm, args = list(mean = mean(national_data$HSDegree, na.rm = TRUE), sd = sd(national_data$HSDegree, na.rm = TRUE)), colour = "blue", size = 1)

#Creating a probability plot for the HSDegree 
ggdistribution(dnorm, seq(0, 100, 1), mean = 87.63, sd = 5.12)

#Running the stat.desc on the HS
stat.desc(national_data$HSDegree, basic = FALSE, norm = TRUE)

shapiro.test(national_data$HSDegree)

#1. What are the elements in your data (including the categories and data types)?
#1a. Their are eight different elements.  Characters: ID, Geography and Population group display label. Numbers: HS Degree and Bach Degree. Integors: ID2, PopGroup ID and Races Reported

#4. Answer the following questions based on the Histogram produced:
#a. Based on what you see in this histogram, is the data distribution unimodal?
#a. a. I don't believe it is perfect but it seems to be a bit of a unimodal distribution. 

#b. Is it approximately symmetrical?
#b. a. No the data is not symmetrical. 

#c. Is it approximately bell-shaped?
#c a. No I don't think it's bell shaped. 

#d. Is it approximately normal?
#d. a. No there is plenty of data multiple standard deviations away from the mean.
  
#e. If not normal, is the distribution skewed? If so, in which direction?
#e. a. The distribution is not normal and is skewed to the right. 
  
#f. Include a normal curve to the Histogram that you plotted.
#f. a. In cluded in the code above 

#g. Explain whether a normal distribution can accurately be used as a model for this data.
#g. a. I don't believe so the data is to skewed to the right.  There is also a lot of tails at the begining that are lots of standard deviations awway from the mean. 

#6. Answer the following questions based on the Probability Plot:
#a. Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
#a a. The probability plot is not a normal distribution. The curve is way to the right of the chart. 

#b. If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
#b a. The distribution is skewed to the right. In the visual the curve is clearly to the right of the chart with a peak to the right.  

#8. In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. 

#8a. a The skew of this distribution was -1.6747 this indicates that the data is skewed to the right.  Th kurtosis was 4.45285.  Due to the kurtosis being well above zero and positive.
#8. a. It indicates that the data is pointy and a heavy tailed distribution.  Once Kurtosis and skew is converted into z scores, the z scores are as follows Kurt.2se = 5.27388 and skew.2se = -4.03025.
# These z scores a re significant because they are well above an even high number of 2.58. 


# In addition, explain how a change in the sample size may change your explanation?
#. a. The sample size was already large sitting at 136 which means the the skew, kurtosis and z- scores were showing how significant the skew was.  If the data increased much higher above 200.  I would need to look at the curve visually rather than calutlate the difference in Skew and Kurtosis.