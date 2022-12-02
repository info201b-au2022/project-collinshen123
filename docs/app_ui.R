
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
  
  
  scatter_sidebar_content <- sidebarPanel(
    textInput("search", label = "Find a State", value = "")
  ),
  
  # Define a variable `scatter_main_content` that is a `mainPanel()` for your
  # second (scatter) page that contains the `plotlyOutput()` of your scatter
  scatter_main_content <- mainPanel(
    plotlyOutput("scatter")
  ),
  
  scatter_panel <- tabPanel(
    "Scatter",
    
    # Add a titlePanel to your tab
    titlePanel("Population v.s. Vote Power"),
    
    # Create a sidebar layout for this tab (page)
    sidebarLayout(
      
      # Display your `scatter_sidebar_content`
      scatter_sidebar_content,
      
      # Display your `scatter_main_content`
      scatter_main_content
    )
  ) 
)


Fourth_Page <-tabPanel(
  h4("Obesity Across Races Grouped by State"),
  p("")
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


