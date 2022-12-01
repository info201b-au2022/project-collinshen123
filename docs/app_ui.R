
First_Page <- tabPanel(
  h4("First_Page"),
  p("asdfghjkjhgfdfghjuiuytgfrdfghjuiuytgfrdefghjuiuytgfrghyju")
)


Second_Page <- tabPanel(
  h4("Second_Page"),
  p("This is the second page"),
  img(src = "https://e7.pngegg.com/pngimages/505/408/png-clipart-random-password-generator-macupdate-doorman-fictional-character-cartoon-thumbnail.png")
)





ui <- navbarPage(
  title = "Demo",
  First_Page,
  Second_Page
)


