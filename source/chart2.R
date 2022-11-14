# Chart 2: Exercise vs Obesity % by sex

data_table <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Physical_Activity_Table.csv")
data_table <- data_table %>% 
  filter(County == "") %>% 
  select(State, Female.sufficient.physical.activity..prevalence..2011.....)

colnames(data_table)[colnames(data_table) == "Female.sufficient.physical.activity..prevalence..2011....."] <- "Female Sufficient Physical Activity Prevalence"

View(data_table)