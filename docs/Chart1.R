
library(dplyr)
library(stringr)

AsianRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Asian_Obesity_Rates.csv", stringsAsFactors = FALSE )
WhiteRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/White_Obesity_Rates.csv", stringsAsFactors = FALSE )
BlackRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Black_Obesity_Rates.csv", stringsAsFactors = FALSE )
HispanicRates <- read.csv("/Users/frank/Documents/Collin/code/info201/project-collinshen123/data/Hispanic_Obesity_Rates.csv", stringsAsFactors = FALSE )
AIANRates <- read.csv("/Users/frank/Documents/Collin/code/info201/project-collinshen123/data/AIAN_Obesity_Rates.csv", stringsAsFactors = FALSE )



White_in_Wa <- WhiteRates%>%
  mutate(Race = "White in WA")%>%
  filter(str_detect(State, "Washington"))
  
 
Asian_in_Wa <- AsianRates%>%
  mutate(Race = "Asian in WA")%>%
  filter(str_detect(State, "Washington"))

updated_table <- White_in_Wa %>%
  rbind(Asian_in_Wa)

Black_in_Wa <- BlackRates%>%
  mutate(Race = "Black in WA")%>%
  filter(str_detect(State, "Washington"))
  
updated_table2 <- updated_table %>%
  rbind(Black_in_Wa)



install.packages("tidyverse")
install.packages("ggplot2")
library(ggplot2)


ggplot(data = updated_table) + 
  geom_col(mapping = aes(x = Prevalence, y = Race))

