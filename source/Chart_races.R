
library(dplyr)
library(stringr)
library(ggplot2)

AsianRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Asian_Obesity_Rates.csv", stringsAsFactors = FALSE )
WhiteRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/White_Obesity_Rates.csv", stringsAsFactors = FALSE )
BlackRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Black_Obesity_Rates.csv", stringsAsFactors = FALSE )
HispanicRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Hispanic_Obesity_Rates%20.csv", stringsAsFactors = FALSE )
AIANRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/AIAN_Obesity_Rates.csv", stringsAsFactors = FALSE )

new_df <- bind_rows(AsianRates, WhiteRates, BlackRates)

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

#Graph 3: Race/Ethnicity Effect on Obesity
#Here we have a column chart representing the difference in obesity prevalence by race in the United States,
#as the best example, we chose three states representing the three regions (New York, Texas, and Washington).
#The data was collected from CDC’s National Center for Health Statistics. This chart helped us reveal interesting 
#insights for our future research, on whether race has any direct or indirect influence on obesity prevalence. 
#We can conclude that Asians are the most noticeable group among others, which is most probably affected 
#by cultural values, while all other groups have almost similar results. This information helps exclude skeptical
#distractions and builds a strong foundation for our future research direction. 
