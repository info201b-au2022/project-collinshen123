# Table for Part 2

# Joining data for each state for exercise and overall obesity rate
library(dplyr)
exercise_table <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Physical_Activity_Table.csv")

#group by state
exercise_table <- exercise_table %>% 
  group_by(State) 
View(exercise_table)

# Create more readable column names
colnames(exercise_table) <- c("State", "County", "Male Sufficient PA Prevalence 2001", "Female Sufficient PA Prevalence 2001",
                              "Male Sufficient PA Prevalence 2009", "Female Sufficient PA Prevalence 2009", "Male Sufficient PA Prevalence 2011",
                              "Female Sufficient PA Prevalence 2011", "Male Sufficient PA Prevalence Difference 2001-2009", 
                              "Female Sufficient PA Prevalence Difference 2001-2009")

overall_table <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/County_Obesity_Table.csv")
View(overall_table)

# Change col names
colnames(overall_table) <- c("State", "County", "Male Obesity Rate 2001", "Female Obesity Rate 2001",
                              "Male Obesity Rate 2009", "Female Obesity Rate 2009", "Male Obesity Rate 2011",
                              "Female Obesity Rate 2011", "Male Obesity Rate Difference 2001-2009", 
                              "Female Obesity Rate Difference 2001-2009")

#group by state
overall_table <- overall_table %>% 
  group_by(State) %>% 
  left_join(exercise_table, by = c("State" = "State", "County" = "County")) 
