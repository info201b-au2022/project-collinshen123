
First_Page <- tabPanel(
  h4("Introduction"),
  p("")
)


Second_Page <- tabPanel(
  h4("Exercise"),
  p("asdfghjkjhgfdfghjuiuytgfrdfghjuiuytgfrdefghjuiuytgfrghyju"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "year_input",
        label = "Year:" ,
        choices = c("2001", "2009", "2011"))
    ),
    selectInput(
      inputId = "sex_input",
      label = "Change sex: ",
      choices = c("Male", "Female")
    )
  ),
  mainPanel(
    plotlyOutput(outputId = "exercise_output")
  )
)

Third_Page <-tabPanel(
  h4("Prevalence of Obesity (%) by State"),
  p(""),
  bar_sidebar_content <- sidebarPanel(
  checkboxGroupInput(
    inputId = "select_states",
    label = "States",
    choices = state.name,
    selected = "Washington"
  )
  ),
  bar_main_content <- mainPanel(
    plotlyOutput("bar")
  )
  
 
)


Fourth_Page <- tabPanel(
  h4("Incarceration by US State"),
  p("This map shows the incarceration percentages in each state for the chosen race."),
  
  map_sidebar_content <- sidebarPanel(
    selectInput(
      "mapvar",
      label = "Variable to Map",
      choices = list(
        "White Prevalence",
        "Asian Prevalence",
        "Black Prevalence",
        "Hispanic Prevalence",
        "AIAN Prevalence"
      )
      
    )
  ),
  
  
  map_main_content <- mainPanel(
    plotlyOutput("map")
  )
  
)

Fifth_Page <-tabPanel(
  h4("Summary and takeaways"),
  p("")
)


Sixth_Page <-tabPanel(
  h4("Report page"),
  p("")
)



ui <- navbarPage(
  title = "P3",
  First_Page,
  Second_Page,
  Third_Page,
  Fourth_Page,
  Fifth_Page,
  Sixth_Page
)


