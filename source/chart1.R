# Chart 2: Exercise vs Obesity % by sex
library(dplyr)
library(tidyr)

female_physical_activity <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Physical_Activity_Table.csv")
female_physical_activity <- female_physical_activity %>% 
  filter(County == "") %>% 
  select(State, Female.sufficient.physical.activity..prevalence..2011.....)

colnames(female_physical_activity)[colnames(female_physical_activity) == "Female.sufficient.physical.activity..prevalence..2011....."] <- "Female Sufficient Physical Activity Prevalence (%)"

female_obesity <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/County_Obesity_Table.csv")
female_obesity <- female_obesity %>% 
  filter(County == "") %>% 
  select(State, Female.obesity.prevalence..2011.....) 
colnames(female_obesity)[colnames(female_obesity) == "Female.obesity.prevalence..2011....."] <- "Female Obesity Prevalence (%)"

female_physical_activity <- left_join(female_physical_activity, female_obesity, by = "State") %>% 
  drop_na() %>% 
  select (-State)

View(female_physical_activity)

library(ggplot2)
# Basic scatter plot
ggplot(female_physical_activity, aes(x=`Female Sufficient Physical Activity Prevalence (%)`, y=`Female Obesity Prevalence (%)`)) + geom_point()
