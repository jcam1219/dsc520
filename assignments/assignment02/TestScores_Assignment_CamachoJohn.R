# Assignment: ASSIGNMENT - Test Scores
# Name: Camacho, John
# Date: 2020-09-10

library(readxl)
library(ggplot2)


#Reading the CSV test scores file
test_scores <- read.csv("C:/Users/Joslyn/Desktop/John Documents/Data Science Class/DSC520/dsc520/data/scores.csv")
test_scores
# creating a variable for both all of the counts and scores 
Count <- test_scores[, 1]
Score <- test_scores[, 2]
#Creating two variables one with all of the Regular section scores and one with the Sports section scores.
Regular_Scores <- test_scores[test_scores$Section == "Regular", 2]
Sports_Scores <- test_scores[test_scores$Section == "Sports", 2]
# Creating two variables for both the regular and sports section counts. 
Regular_Count <- test_scores[test_scores$Section == "Regular", 1]
Sports__Count <- test_scores[test_scores$Section == "Sports", 1]

#Creating two variables one for the count and scores of the regular section and one with the count and scores for the sports section. 
Regular_Section <- list(Regular_Count, Regular_Scores)
Regular_Section
Sports_Section <- list(Sports__Count, Sports_Scores)
Sports_Section

# Creating variables and calculating the total score and mean of the sports section
Total_Sports_Score <- sum(Sports__Count) * sum(Sports_Scores)
Sports_Score_Mean <-sum(Sports_Scores) / length(Sports__Count)
Sports_Score_Mean
Total_Sports_Score

# Creating variables and calculating the total score and mean of the Regular section
Total_Regular_Score <-sum(Regular_Scores) * sum(Regular_Count)
Total_Regular_Score
Regular_Scores_Mean <- sum(Regular_Scores) / length(Regular_Scores)
Regular_Scores_Mean

#Calculating which section has the highest total score and mean. 
Total_Regular_Score > Total_Sports_Score
Regular_Scores_Mean > Sports_Score_Mean

#ploting the test scores, using the score for y and the count for x
x <-  ggplot(test_scores, aes(x=Count, y=Score))
x + geom_point(aes(color=Section)) +ggtitle("Regular and Sports Student Test Scores")



#1. What are the observational units in this study?
#1. A. The observational units in this study is the individual test scores for each participate. The sum of the test scores from the Regular students and the sum of the test scores of the Sports Students.

#2. Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
#2. A. The variables from the story is the section which is either either Regular or Sports. The count for both Regular and Sports.  The sum of the test scores and the idividual scores for both Regular and Sports. 
#2. A. Regular and Sports are categorical.  The count for both Regular and Sports are quantitative.  The scores and the sum of the scores for both Regular and Sports is quantitative.

#3. Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.
# 3. A. Regular Variable = "Regular_Section and Sports Variable = "Sports_Section"

#4A.  Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency: Can you say that one section tended to score more points than the other? Justify and explain your answer.
#4A. A. When looking at the graph the Regular Section was more consistently in the higher range.  This is especially evident in the with having more and higher scores in the 20 and 30 count range. 

#4B. b. Did every student in one section score more points than every student in the other section? If not, explain what a statistical tendency means in this context.
#4B. A. While the regular Section had a higher total score and average, not every student in the Regular Section scored higher than the Score Section Students.  
#4B A.  The central tendency for both of these was calculated by the variable I created called Regular_Scores_Mean and Sports_Scores_Mean. The regular section students had a mean of 327.63 and the sports section students had a mean of 307.36.

#4C.  What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions between the two sections?
#4C.  I think their are a couple that could be an additional variable.  One could gender which may cause one gender compared to the other to do better in one of the sections.  The other could be the students age or the students name whcih would allow us to compare an indiduals performance from one section to the next. 


