
First_Page <- tabPanel(
  h4("Introduction"),
  h4("Analysis of Obesity in the U.S."),
  h4("Authors: "),
  p(" Collin Shen, Erzhan Umarov, Jaime Li, Kailynn Nguyen"),
  p("Code Name: Yum Yum"),
  p("Affiliation: INFO 201: Technical Foundations of Informatics – 
    The Information School – University of Washington"),
  p("Date: Autumn 2022"),
  
  h4("Abstract"),
  p("In this project, we are concerned with the issue of obesity, 
    specifically, the prevalence of the rates in the US. 
    This topic is important because according to the data collected 
    from the National Institutes of Health (NIH), more than 2 in 5 adults 
    (42.4%) have obesity and almost 1 in 5 children and adolescents ages 2 to 19 
    (19.3%) have obesity. To address this concern we plan to analyze datasets 
    to examine the many factors that contribute to this issue."),
  p("Keywords: obesity, geography, race, exercise"),
  h4("Summary Information:"),
  p("Obesity rates in the United States was the topic of interest for our project. 
    The data utilized in this project helped to present valuable information and 
    see the prevalence of obesity by geographic location, sex, and race. One of 
    the datasets we used in our project was a physical activity dataset that 
    recorded the percentage of sufficient physical activity prevalence of male 
    and females for each state and county. From this, a total of 3194 observations 
    were made from the states, counties, and country as a whole. Furthermore, the 
    data indicates that the state with the highest prevalence of female physical 
    activity in 2011 was Vermont, while the state with the highest prevalence of 
    male physical activity in 2011 was Hawaii. In addition, the highest change in 
    one state for female physical activity prevalence from 2001 to 2009 was 10.4 
    while the highest change in one state for male physical activity prevalence 
    from 2001 to 2009 was 6.8."),
  h4("Introduction:"),
  p("“It is health that is the real wealth, and not pieces of gold and silver.” 
    – Mahatma Gandhi. As obesity remains one of the main health and social issues 
    in the US, why is it so important and why should we be concerned ? According 
    to the CDC, annual obesity-related medical care costs in the United States, 
    in 2019, were estimated to be nearly $173 billion dollars. Annual nationwide 
    productivity costs of obesity-related absenteeism range between $3.38 billion 
    ($79 per individual with obesity) and $6.38 billion ($132 per individual with obesity).
    Preventive, diagnostic, and therapeutic services may all be included
    in direct medical costs. Lost productivity is included in indirect expenses 
    associated with illness and mortality. Employee absences from work due to 
    obesity-related health issues, decreased productivity at work, and early 
    death and disability are all examples of productivity measurements. Another 
    reason is military readiness, over one third of young adults (17–24) are too 
    obese to join the US military. Only 3 out of 4 young adults who satisfy the 
    weight standards report having levels of physical activity that equip them 
    for the difficulties of basic training. As a result, just 2 in 5 young adults 
    are sufficiently active and within the weight requirements for military service. 
    Additionally, from 16% in 2015 to 19% of active-duty service personnel in 2020 
    were obese. These people are less likely to be in good health and be able to deploy. 
    More than 3.6 million musculoskeletal injuries occurred to active-duty soldiers 
    between 2008 and 2017. According to one study, obese active-duty troops had a 33% 
    higher risk of suffering this kind of injury."),
  h4("The Problem Domain:"),
  p("Referencing The New York Times, a study done by medical scientists, 
    “…projected that by 2030, nearly one in two adults will be obese,” (Brody). 
    The problem domain we are presenting concerns obesity in the U.S. and as it 
    persists, the factors correlated to this issue. The main question that we 
    strive to address is “What factors impact the obesity levels in the U.S.?” 
    Upon this, we will consider questions including: how does geography affect 
    obesity, how does race/ethnicity influence obesity, and how does school funding 
    impact childhood obesity rates/how does economic status affect obesity?"),
  p("According to the National Institutes of Health (NIH), various studies have 
    reported harmful stereotypes that those who are overweight or obese are, “lazy, 
    -willed, unsuccessful, unintelligent, lack self-discipline, have poor willpower,
    and are noncompliant with weight-loss treatment,” (Puhl, Heuer). As a result of 
    these stigmas, prejudice of obese individuals is commonly experienced in workplaces, 
    health facilities, schools, and mass media. Once more referencing the NIH, 
    “the prevalence of weight discrimination has increased by 66% over the past decade, 
    and is now comparable to prevalence rates of racial discrimination in America.”
    While these opinions generally sprout from the notion that sustaining a healthy 
    lifestyle is important, this should not deter from the fact that there are external 
    factors that contribute to obesity which need to be addressed."),
  p("The direct stakeholders of this topic are the obese population in the US. 
    As this project centers around this group and they are the ones living with 
    this chronic health condition, this topic affects them the most directly. 
    They may be interested in gaining information about the external components 
    that are related to obesity. The indirect stakeholders are the ones who are 
    not experiencing this health condition firsthand, but are associating themselves 
    with the conversation either by obligation or choice. This includes health care 
    facilities, mass media, workplaces, and schools."),
  p("If interventions are taken with data and technology, a possible benefit could be 
    bringing awareness and diminishing the harmful stigma that obesity is solely a choice.
    Rather than having this negative outlook, it should encourage the conversation of 
    living a healthier lifestyle, one that includes a nutritious diet, exercise, and 
    improvements on mental health. Furthermore, as stated by the BMC, “obese is a major 
    risk factor for many chronic diseases including heart disease, cancer, kidney failure, 
    pulmonary disease and diabetes,” thus needs to be addressed for preventative action 
    (Pearce, et al.). However, acknowledging that data and technology simply presents data, 
    this will not stop negative stereotypes. If the data shows that one ethnical or racial 
    group has high percentages of obesity, this may create a stigma that this group as a 
    whole is obese. This applies to the other variables as well such as socioeconomic status, 
    region of residency, and age."),
  h4("Research Questions – topics we were interested in exploring and answering 
     using the datasets:"),
  p("1. How do exercise habits of adults influence obesity rates?
    What is the significance of getting exercise and by how much does it affect 
    obesity and possibly other health issues?"),
  p("2. How does geography affect obesity? Since different regions of the United 
    States have differing cuisines, does diet based on geographical location have 
    a large enough influence on obesity in the US."),
  p("3. How does race/ethnicity affect obesity? The effects that Race and Ethnicity 
    may most likely have are most closely linked to genetics. "),
  h4("About the Datasets:"),
  p("Three datasets with information related to obesity in the United States are cited 
    in our project.is derived from the Institute for Health Metrics and 
    Evaluation (IHME) and provides data on life expectancy, obesity, and physical 
    activity for men and women. For this project, we focused on the data on obesity and 
    physical activity in order to find if there was a correlation between the two. 
    Dataset 2 was obtained from the Centers for Disease Control and Prevention (CDC) 
    and presents the prevalence of obesity for each of the states. Citing this dataset 
    allowed us to better understand if geography had an impact on obesity. The last dataset, 
    Dataset 3, provides data on the obesity rates of race groups by states and was also cited 
    from the CDC. ")
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


