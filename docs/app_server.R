library(dplyr)


source("app_ui.R") 

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

# Start shinyServer
server <- function(input, output) {
  x_value <- paste("PA", input$sex_input, input$year_input)
  y-value <- paste("O", input$sex_input, input$year_input)
  output$exercise_output <- renderPlotly({
    exercise_plot <- ggplot(data = data_exercise)+
      geom_point(mapping = aes(x = x_value, y = y_value))
    
    exercise_plot
  })
}

