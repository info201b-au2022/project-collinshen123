# Table for Part 2

# Joining data for each state from exercise, race, and overall
library(readxl)
library(dplyr)
data_table <- read_excel("C://Users/fatni/documents/info201/project-collinshen123/data/Physical_Activity_Table.xlsx")
data_table <- data_table %>% 
  filter(is.na(County)) %>% 
  select(State, `Male sufficient physical activity  prevalence, 2011* (%)`, `Female sufficient physical activity  prevalence, 2011* (%)`)

white_table <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/White_Obesity_Rates.csv")
asian_table <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Asian_Obesity_Rates.csv")
AIAN_table <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/AIAN_Obesity_Rates.csv")
black_table <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Black_Obesity_Rates.csv")
hispanic_table <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Hispanic_Obesity_Rates.csv")

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

View(race_table)
