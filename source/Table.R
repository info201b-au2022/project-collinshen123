# Table for Part 2

# Joining data for each state from exercise, race, and overall
library(dplyr)

# Getting data table of exercise (male and female for 2011)
data_table <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Physical_Activity_Table.csv")
data_table <- data_table %>% 
  filter(County == "") %>% 
  select(State, Male.sufficient.physical.activity.prevalence..2001...., Female.sufficient.physical.activity..prevalence..2011.....)

colnames(data_table)[colnames(data_table) == "Male.sufficient.physical.activity.prevalence..2001...."] <- "Male Sufficient Physical Activity Prevalence"
colnames(data_table)[colnames(data_table) == "Female.sufficient.physical.activity..prevalence..2011....."] <- "Female Sufficient Physical Activity Prevalence"

View(data_table)

# Getting table of obesity rate by race
white_table <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/White_Obesity_Rates.csv")
asian_table <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Asian_Obesity_Rates.csv")
AIAN_table <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/AIAN_Obesity_Rates.csv")
black_table <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Black_Obesity_Rates.csv")
hispanic_table <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Hispanic_Obesity_Rates%20.csv")

filter_columns <- function(table) {
  table <- select(table, State, Prevalence)
  
  table[table == "Insufficient data*"] <- NA
  
  return(table)
}

white_table <- filter_columns(white_table)
colnames(white_table)[colnames(white_table) == "Prevalence"] <- "White Obesity Rate"

asian_table <- filter_columns(asian_table)
colnames(asian_table)[colnames(asian_table) == "Prevalence"] <- "Asian Obesity Rate"

AIAN_table <- filter_columns(AIAN_table)
colnames(AIAN_table)[colnames(AIAN_table) == "Prevalence"] <- "American Indian/Alaskan Native Obesity Rate"

black_table <- filter_columns(black_table)
colnames(black_table)[colnames(black_table) == "Prevalence"] <- "Black Obesity Rate"

hispanic_table <- filter_columns(hispanic_table)
colnames(hispanic_table)[colnames(hispanic_table) == "Prevalence"] <- "Hispanic Obesity Rate"

race_table <- left_join(white_table, asian_table, by = "State") %>% 
  left_join(AIAN_table, by = "State") %>% 
  left_join(black_table, by = "State") %>% 
  left_join(hispanic_table, by = "State")

race_table <- race_table[-c(55), ]

View(white_table)

# Get overall obesity rate per state for male and female
overall_obesity <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/County_Obesity_Table.csv")

overall_obesity <- overall_obesity %>% 
  filter(County == "") %>% 
  select(State, Male.obesity..prevalence..2011....., Female.obesity.prevalence..2011.....) 

colnames(overall_obesity)[colnames(overall_obesity) == "Male.obesity..prevalence..2011....."] <- "Male Obesity Prevalence"
colnames(overall_obesity)[colnames(overall_obesity) == "Female.obesity.prevalence..2011....."] <- "Female Obesity Prevalence"

View(overall_obesity)

# Join all tables 

data_table <- data_table %>% 
  left_join(overall_obesity, by = "State") %>% 
  left_join(race_table, by = "State")

View(data_table)
