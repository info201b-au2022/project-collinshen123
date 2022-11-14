
library(dplyr)

AsianRates <- read.csv("/Users/frank/Documents/Collin/code/info201/project-collinshen123/data/Asian_Obesity_Rates.csv", stringsAsFactors = FALSE )
WhiteRates <- read.csv("/Users/frank/Documents/Collin/code/info201/project-collinshen123/data/White_Obesity_Rates.csv", stringsAsFactors = FALSE )
BlackRates <- read.csv("/Users/frank/Documents/Collin/code/info201/project-collinshen123/data/Black_Obesity_Rates.csv", stringsAsFactors = FALSE )
HispanicRates <- read.csv("/Users/frank/Documents/Collin/code/info201/project-collinshen123/data/Hispanic_Obesity_Rates.csv", stringsAsFactors = FALSE )
AIANRates <- read.csv("/Users/frank/Documents/Collin/code/info201/project-collinshen123/data/AIAN_Obesity_Rates.csv", stringsAsFactors = FALSE )


a <- AsianRates %>%
  full_join(WhiteRates, by = "State")


install.packages("tidyverse")
install.packages("ggplot2")
library(ggplot2)


ggplot(data = a) + 
  geom_col(mapping = aes(x = State, y = Prevalence))

