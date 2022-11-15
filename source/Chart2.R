
library(dplyr)
library(stringr)
library(ggplot2)

AsianRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Asian_Obesity_Rates.csv", stringsAsFactors = FALSE )
WhiteRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/White_Obesity_Rates.csv", stringsAsFactors = FALSE )
BlackRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Black_Obesity_Rates.csv", stringsAsFactors = FALSE )
HispanicRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Hispanic_Obesity_Rates%20.csv", stringsAsFactors = FALSE )
AIANRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/AIAN_Obesity_Rates.csv", stringsAsFactors = FALSE )


# Get data for washington state
White_in_Wa <- WhiteRates%>%
  mutate(Race = "White")%>%
  filter(str_detect(State, "Washington"))
 
Asian_in_Wa <- AsianRates%>%
  mutate(Race = "Asian")%>%
  filter(str_detect(State, "Washington"))

updated_table <- White_in_Wa %>%
  rbind(Asian_in_Wa)

Black_in_Wa <- BlackRates%>%
  mutate(Race = "Black")%>%
  filter(str_detect(State, "Washington"))
  
updated_table2 <- updated_table %>%
  rbind(Black_in_Wa)

Hispanic_in_Wa <- HispanicRates%>%
  mutate(Race = "Hispanic")%>%
  filter(str_detect(State, "Washington"))

updated_table3 <- updated_table2 %>%
  rbind(Hispanic_in_Wa)

AIAN_in_Wa <- AIANRates%>%
  mutate(Race = "AIAN")%>%
  filter(str_detect(State, "Washington"))

updated_table4 <- updated_table3 %>%
  rbind(AIAN_in_Wa)


# Get data for california
White_in_Ca <- WhiteRates%>%
  mutate(Race = "White")%>%
  filter(str_detect(State, "California"))

Asian_in_Ca <- AsianRates%>%
  mutate(Race = "Asian")%>%
  filter(str_detect(State, "California"))

updated2_table <- White_in_Ca %>%
  rbind(Asian_in_Ca)

Black_in_Ca <- BlackRates%>%
  mutate(Race = "Black")%>%
  filter(str_detect(State, "California"))

updated2_table2 <- updated2_table %>%
  rbind(Black_in_Ca)

Hispanic_in_Ca <- HispanicRates%>%
  mutate(Race = "Hispanic")%>%
  filter(str_detect(State, "California"))

updated2_table3 <- updated2_table2 %>%
  rbind(Hispanic_in_Ca)

AIAN_in_Ca <- AIANRates%>%
  mutate(Race = "AIAN")%>%
  filter(str_detect(State, "California"))

updated2_table4 <- updated2_table3 %>%
  rbind(AIAN_in_Ca)

# Bind together two plots
updated2_table4 <- updated2_table4 %>%
  rbind(updated_table4)

# Plot
ggplot(updated2_table4, aes(fill=Race, y=Prevalence, x=State)) + 
  geom_bar(position="dodge", stat="identity")

#ggplot(data = WhiteRates) + 
  #geom_col(mapping = aes(x = Prevalence, y = State))

