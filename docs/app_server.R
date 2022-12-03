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




#chart 3
AsianRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Asian_Obesity_Rates.csv", stringsAsFactors = FALSE )
WhiteRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/White_Obesity_Rates.csv", stringsAsFactors = FALSE )
BlackRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Black_Obesity_Rates.csv", stringsAsFactors = FALSE )
HispanicRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/Hispanic_Obesity_Rates%20.csv", stringsAsFactors = FALSE )
AIANRates <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-collinshen123/main/data/AIAN_Obesity_Rates.csv", stringsAsFactors = FALSE )

new_df <- bind_rows(AsianRates, WhiteRates, BlackRates, HispanicRates, AIANRates)%>%
  arrange(State)

build_scatter <- function(data,  search = "", xvar = "year", yvar = "coal_co2") {
  # Get x and y max
  xmax <- max(data[,xvar]) + 10
  ymax <- max(data[,yvar]) + 100
  xmin <- min(data[,xvar])
  ymin <- min(data[,yvar])
  
  
  # Filter data based on search 
  data <- data %>% 
    filter(grepl(search, country))
  
  # Plot data
  p <- plot_ly(x = data[, xvar],
               y = data[, yvar], 
               mode="markers", 
               marker = list(
                 opacity = .4, 
                 size = 10
               )) %>% 
    layout(xaxis = list(range = c(xmin, xmax), title = xvar), 
           yaxis = list(range = c(ymin, ymax), title = yvar)
    )
  return(p)
}

# Start shinyServer
server <- function(input, output) {
  x_value <- paste("PA", input$sex_input, input$year_input)
  y-value <- paste("O", input$sex_input, input$year_input)
  output$exercise_output <- renderPlotly({
    exercise_plot <- ggplot(data = data_exercise)+
      geom_point(mapping = aes(x = x_value, y = y_value))
    
    exercise_plot
  })
  
  output$scatter <- renderPlotly({
    return(build_scatter(df, input$select))
  })
}

