# Summary info about Physical_Activity chart

# Physical activity (PA) Chart:
PA_chart <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Physical_Activity_Table.csv")

View(PA_chart)

summary_info <- list()

# There is an obvservation for every county in the US as well as summaries for each state and
# the whole US
summary_info$num_observations <- nrow(PA_chart)

# The state with the highest prevalence of female physical activity in 2011 was...
summary_info$highest_PA_female <- PA_chart %>%
  filter(County == "") %>% 
  select(State, Female.sufficient.physical.activity..prevalence..2011.....) %>% 
  filter(Female.sufficient.physical.activity..prevalence..2011..... == max(Female.sufficient.physical.activity..prevalence..2011....., na.rm = T)) %>%
  pull(State) 

# The state with the highest prevalence of male physical activity in 2011 was...
summary_info$highest_PA_male <- PA_chart %>%
  filter(County == "") %>% 
  select(State, Male.sufficient.physical.activity..prevalence..2011.....) %>% 
  filter(Male.sufficient.physical.activity..prevalence..2011..... == max(Male.sufficient.physical.activity..prevalence..2011....., na.rm = T)) %>%
  pull(State) 

# The the highest change in one state for female physical activity prevalence from 2001 t0 2009 was...
summary_info$highest_female_change <- PA_chart %>%
  filter(County == "") %>% 
  select(Difference.in.female.sufficient.physical.activity.prevalence..2001.2009..percentage.points.) %>% 
  filter(Difference.in.female.sufficient.physical.activity.prevalence..2001.2009..percentage.points. == max(abs(Difference.in.female.sufficient.physical.activity.prevalence..2001.2009..percentage.points.), na.rm = T)) %>%
  pull(Difference.in.female.sufficient.physical.activity.prevalence..2001.2009..percentage.points.) 

# The the highest change in one state for male physical activity prevalence from 2001 to 2009 was...
summary_info$highest_male_change <- PA_chart %>%
  filter(County == "") %>% 
  select(Difference.in.male.sufficient.physical.activity.prevalence..2001.2009..percentage.points.) %>% 
  filter(Difference.in.male.sufficient.physical.activity.prevalence..2001.2009..percentage.points. == max(abs(Difference.in.male.sufficient.physical.activity.prevalence..2001.2009..percentage.points.), na.rm = T)) %>%
  pull(Difference.in.male.sufficient.physical.activity.prevalence..2001.2009..percentage.points.) 
