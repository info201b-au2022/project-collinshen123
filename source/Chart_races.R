
library(dplyr)
library(stringr)

install.packages("tidyverse")
install.packages("ggplot2")
library(ggplot2)

AsianRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Asian_Obesity_Rates.csv", stringsAsFactors = FALSE )
WhiteRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/White_Obesity_Rates.csv", stringsAsFactors = FALSE )
BlackRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Black_Obesity_Rates.csv", stringsAsFactors = FALSE )
HispanicRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Hispanic_Obesity_Rates%20.csv", stringsAsFactors = FALSE )
AIANRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/AIAN_Obesity_Rates.csv", stringsAsFactors = FALSE )



White <- WhiteRates%>%
  mutate(Race = "White")%>%
  filter(str_detect(State, "Washington") | str_detect(State, "Texas") | str_detect(State, "New York"))
  
 
Asian <- AsianRates%>%
  mutate(Race = "Asian")%>%
  filter(str_detect(State, "Washington") | str_detect(State, "Texas") | str_detect(State, "New York"))

updated_table <- White %>%
  rbind(Asian)

Black <- BlackRates%>%
  mutate(Race = "Black")%>%
  filter(str_detect(State, "Washington") | str_detect(State, "Texas") | str_detect(State, "New York"))
  
updated_table2 <- updated_table %>%
  rbind(Black)

Hispanic <- HispanicRates%>%
  filter(str_detect(State, "Washington") | str_detect(State, "Texas") | str_detect(State, "New York"))%>%
  mutate(Race = "Hispanic")

updated_table3 <- updated_table2 %>%
  rbind(Hispanic)

AIAN <- AIANRates%>%
  mutate(Race = "AIAN")%>%
  filter(str_detect(State, "Washington") | str_detect(State, "Texas") | str_detect(State, "New York"))

updated_table4 <- updated_table3 %>%
  rbind(AIAN)




ggplot(data = updated_table4) + 
  geom_col(mapping = aes(x = State, y = Prevalence, fill = Race), position = "dodge") + 
  ggtitle("Obesity across races grouped by state") + 
  ylim(0, 100)

