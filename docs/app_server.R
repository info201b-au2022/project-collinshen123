library(dplyr)
library(ggplot2)
library(plotly)






# CHART 1: EXERCISE VS OBESITY DATA TABLE BELLOW:
# ================================================
#Reformat chart 1 datatable
physical_activity <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Physical_Activity_Table.csv")
physical_activity <- physical_activity %>% 
  filter(County == "") %>% 
  select(c(1, 3, 4, 5, 6, 7, 8))
#View(physical_activity)
colnames(physical_activity) <- c("State", "PA Male 2001", "PA Female 2001", "PA Male 2009", "PA Female 2009", "PA Male 2011", "PA Female 2011")

obesity <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/County_Obesity_Table.csv")
obesity <- obesity %>% 
  filter(County == "") %>% 
  select(c(1, 3, 4, 5, 6, 7, 8))

colnames(obesity) <- c("State", "O Male 2001", "O Female 2001", "O Male 2009", "O Female 2009", "O Male 2011", "O Female 2011")

data_exercise <- left_join(obesity, physical_activity, by = "State")





#chart 2

WhiteRates1 <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/White_Obesity_Rates.csv", stringsAsFactors = FALSE )



build_bar <- function(data, select_states) {
  
  
  # Filter data based on search 
  data <- data %>% 
    filter(State %in% select_states)
  

ymax <- max(data$Prevalence) * 1.1


  # Plot data
  p1 <- plot_ly(x = data$State,
               y = data$Prevalence, 
               name = "White Obesity Prevalence",
               type = "bar"
               )%>%
    layout(title = "White Obesity Prevalence % by state",
            xaxis = list(title = "States"), 
            yaxis = list(range = c(0, ymax), title = "White Obesity Prevalence %")
    )
       
  return(p1)
}






#chart 3
AsianRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Asian_Obesity_Rates.csv", stringsAsFactors = FALSE )
WhiteRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/White_Obesity_Rates.csv", stringsAsFactors = FALSE )
BlackRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Black_Obesity_Rates.csv", stringsAsFactors = FALSE )
HispanicRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Hispanic_Obesity_Rates%20.csv", stringsAsFactors = FALSE )
AIANRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/AIAN_Obesity_Rates.csv", stringsAsFactors = FALSE )

colnames(WhiteRates) <- c("State", "White Prevalence")
colnames(AsianRates) <- c("State", "Asian Prevalence")
colnames(BlackRates) <- c("State", "Black Prevalence")
colnames(HispanicRates) <- c("State", "Hispanic Prevalence")
colnames(AIANRates) <- c("State", "AIAN Prevalence")

new_df <- left_join( WhiteRates, AsianRates)
new_df1 <- left_join(new_df, BlackRates)
new_df2 <- left_join(new_df1, HispanicRates)
new_df3 <- left_join(new_df2, AIANRates)




build_map <- function(data, map.var) {
  
  
  # give state boundaries a white border
  l <- list(color = toRGB("white"), width = 2)
  
  # specify some map projection/options
  g <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showlakes = TRUE,
    lakecolor = toRGB('white')
  )
  
  # Make equation for map color / text
  var.equation <- paste0('~', map.var)
  
  # Plot
  p <- plot_geo(data, locationmode = 'USA-states') %>%
    add_trace( 
      z = data[,map.var], text = state.name, span = I(0), locations = state.abb  
    ) %>%
    colorbar(title = "Color Title") %>%
    layout(
      title = "Obesity % by state in the US",
      geo = g
    )
  return(p)
}




# Start shinyServer
server <- function(input, output) {
 
  
  output$bar <- renderPlotly({
    return(build_bar(WhiteRates1, input$select_states))
  })
  
  output$exercise_output <- renderPlot({
    x_value <- paste("PA", input$sex_input, input$year_input)
    y_value <- paste("O", input$sex_input, input$year_input)
    exercise_plot <- ggplot(data = data_exercise)+
      geom_point(mapping = aes(x = data_exercise[[x_value]], y = data_exercise[[y_value]]), color = "Red") +
      xlab("Physical Activity Prevalence (%)") +
      ylab("Obesity Prevalance (%)") +
      ggtitle("Physical Activity and Obesity Graph")
    
    exercise_plot
  })
  
  output$map <- renderPlotly({
    return(build_map(new_df3, input$mapvar))
  })
}

