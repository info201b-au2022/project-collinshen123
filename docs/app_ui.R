
First_Page <- tabPanel(
  h4("Introduction"),
  p("")
)


Second_Page <- tabPanel(
  h4("Physical Activity vs Obesity"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "year_input",
        label = "Year:" ,
        choices = c("2001", "2009", "2011")
      ),
      radioButtons(
        inputId = "sex_input",
        label = "Change sex: ",
        choices = c("Male", "Female")
      )
    ),
    mainPanel(
      plotOutput("exercise_output")
    )
  ),
  h4("Summary paragraph"),
  p("This scatter plot shows the percentage of obesity prevalence 
    compared to the percentage of sufficient physical activity prevalence 
    in each state. The user can select which year (2001, 2009, 2011) and 
    sex (male or female) and a scatterplot with these varibales will be displayed. 
    This information is useful as it helps to gain a better understanding from 
    data of the relationship between the prevalence of obesity when it is being 
    compared to the prevalence of physical activity. While correlation does not 
    necessarily mean causation, seeing these two variables together leaves the
    plot up for interpretation by the user.")
)

Third_Page <-tabPanel(
  h4("Prevalence of Obesity (%) by State"),
  p(""),
  sidebarPanel(
    checkboxGroupInput(
      inputId = "select_states",
      label = "States",
      choices = state.name,
      selected = ""
    )
  ),
  mainPanel(
    plotlyOutput("bar")
  ),
  h4("Summary paragraph"),
  p("This bar graph displays the recorded percent prevalence of 
    obesity by US state. Data for this graph was sourced from the 
    Centers for DiseaseControl and Prevention (CDC) and was collected 
    from 2019–2021. It is included as it presents valuable information 
    of how prevalent obesity may be in a particular state. The user is 
    able to select whatever state(s) of their choosing and visualize
    how states may compare to one another when it comes to the prevalence of obesity. ")
  
 
)


Fourth_Page <- tabPanel(
  h4("Obesity % by state in the US"),
  p("This map shows the incarceration percentages in each state for the chosen race."),
  
  map_sidebar_content <- sidebarPanel(
    selectInput(
      "mapvar",
      label = "Select Race",
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
  ),
  h4("Summary paragraph"),
  p("Here we have a geographic map of the US representing the 
    difference in obesity prevalence by race in the United States. 
    The data was collected from CDC’s National Center for Health 
    Statistics. This chart helped us reveal interesting insights 
    for our future research, on whether race has any direct or 
    indirect influence on obesity prevalence. The user is able to 
    select a race and from there the visualization will display the
    estimated number of people from a race group that are obese and
    in which area of the US. ")
  
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


