
First_Page <- tabPanel(
  h4("Introduction"),
  p("")
)


Second_Page <- tabPanel(
  h4("Female Physical Activity (%) vs Female Obesity Prevalence (%)"),
  p("This is the second page"),
)

Third_Page <-tabPanel(
  h4("Prevalence of Obesity (%) by State"),
  p("")
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


