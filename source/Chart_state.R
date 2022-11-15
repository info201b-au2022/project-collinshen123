library(dplyr)
library(stringr)
library(ggplot2)

WhiteRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/White_Obesity_Rates.csv", stringsAsFactors = FALSE )

ggplot(data = WhiteRates) + 
  geom_col(mapping = aes(x = Prevalence, y = State)) +
  xlim(0, 100)