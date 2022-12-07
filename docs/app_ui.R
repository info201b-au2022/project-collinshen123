
source("app_server.R") 
First_Page <- tabPanel(
  h4("Introduction"),
  h4("Analysis of Obesity in the U.S."),
  h4("Authors: Collin Shen, Erzhan Umarov, Jaime Li, Kailynn Nguyen"),
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
  h4("Findings: "),
  p("The first set of questions we intended to investigate in this project 
  was: how do exercise habits of adults influence obesity rates, what is 
  the significance of getting exercise and by how much does it affect obesity
  and possibly other health issues? As demonstrated in the scatterplot graph, 
  it displays the correlation that as participation in physical activity increases, 
  the prevalence of obesity of both men and women decreases. Thus, from this
  graph as well as the negative slope seen, it demonstrates that the percentage 
  of people that engage in sufficient physical activity are less prone to obesity. 
  It provides insights of the relevant topic of obesity and how promoting physical 
  activity, in an aspect, can help to combat it."),
  p("The second topic of interest of this project was: how does geography affect 
    obesity, since different regions of the United States have differing cuisines, 
    does diet based on geographical location have a large enough influence on obesity
    in the US? The data from the bar chart reveals which state’s population may be 
    more affected by the issue of obesity and possible help to bring awareness to 
    this issue. As can be seen, West Virginia has the highest obesity prevalence with 
    a percentage of 40.6%. In contrast, the District of Columbia has the lowest 
    obesity prevalence with a percentage of 24.7%. Factors such as food portions
    and availability have an influence on the foods eaten and thus the diets of 
    residents living in certain states. As a result, various eating lifestyles 
    are observed. If the data visualization shows that specific states have a notably 
    high percent prevalence of obesity, this can help bring attention and implement 
    policies as well as interventions."),
  p("Lastly, the topic of race was examined from our research. We considered the 
    question: how does race/ethnicity affect obesity? As the effects that Race and 
    Ethnicity may likely have are most closely linked to genetics. The geographic map 
    in our project allows users to select a race and visualize the prevalence of obesity 
    in the specified group in the United States. The prevalence of obesity-related 
    conditions varies by ethnic group and other health issues also differ depending 
    on religion, socioeconomic status, and cultural differences. As reported by the 
    US Department of Health and Human Services Office of Minority Health (OMH), 
    African-American women have the highest rates of being overweight or having 
    obesity, compared with other racial or ethnic groups in the US."),
  h4("Discussion: "),
  p("We expect the data to imply that communities with lower incomes experience higher 
  rates of obesity, due to the fact that eating unhealthy processed foods in America has 
  become significantly cheaper than eating a balanced diet. We also suspect that 
  historically marginalized groups of people (such as African Americans) will experience 
  disproportionate rates of obesity because these groups usually have less access to 
  healthy foods and health resources. The data will most likely imply that factors that 
  affect an individual’s economic status, such as race and location, are what affect a
  person’s likelihood of obesity. There isn’t one set factor that contributes to obesity. 
  There are some factors such as having a high metabolism that vary from person to person, 
  which also lead to our next factor - genetics, but attributes like these are hard to 
  gather data for. Another challenge in studying obesity in the US is the lack of reliable 
  and comprehensive data. While there are many sources of data on obesity and related 
  health issues, these data are often limited in scope or quality, and may not provide a 
  complete picture of the problem. For example, some data sources may only include 
  information on a particular group of people, such as adults in a certain age range or 
  people living in a particular region. Additionally, data on obesity and related health 
  issues are often collected and reported in different ways, making it difficult to 
  compare and combine data from different sources. Despite these challenges, there is a 
  growing recognition of the need to better understand and address obesity in the US. 
  Many organizations and researchers are working to collect and analyze data on obesity and
  related health issues, and to develop strategies and interventions to address the problem. 
  These efforts are likely to continue, and it is hoped that they will help to improve the 
  health and well-being of individuals and communities across the country. We would also like
  to address limitations in our data visualizations. For example in our first interactive 
  page the user can select between three years (2001, 2009, 2011) and sex (male or female) 
  and a scatterplot with these variables will be displayed. This information is useful as 
  it helps to gain a better understanding from data and compare different periods of time 
  that correspond to specific economic events or periods, as well as difference in sex. 
  Second interactive page has the least limitations as the data in total, but it’s a
  comparatively fresh dataset that represents obesity prevalence by state for 2019-2021, 
  where the state of Florida is missing. It is an interactive graph where you can compare 
  multiple states. Therefore, our next interactive page is a US map with an obesity 
  prevalence representation by race, unfortunately some of the races are not represented in 
  some states. For example, there is no data for Black  in Nebraska. "),
  h4("Conclusion: "),
  p("")
  
)


Sixth_Page <-tabPanel(
  h4("Report page"),
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
  h4("References:"),
  p("“Overweight & Obesity Statistics.” National Institute of Diabetes and 
    Digestive and Kidney Diseases, U.S. Department of Health and Human Services, 
    https://www.niddk.nih.gov/health-information/health-statistics/overweight-obesity. 
    Puhl, Rebecca M, and Chelsea A Heuer. “Obesity Stigma: Important Considerations 
    for Public Health.” American Journal of Public Health, American Public Health 
    Association, June 2010, https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2866597/#:~:
    text=Numerous%20studies%20have%20documented%20harmful,noncompliant%20with%20weight
    %2Dloss%20treatment. Brody, Jane E. “Half of Us Face Obesity, Dire Projections 
    Show.” The New York Times, The New York Times, 10 Feb. 2020, https://www.nytimes.
    com/2020/02/10/well/live/half-of-us-face-obesity-dire-projections-show.html. 
    Pearce, Claire, et al. “Obesity Prevention and the Role of Hospital and 
    Community-Based Health Services: A Scoping Review - BMC Health Services 
    Research.” BioMed Central, BioMed Central, 5 July 2019, https://bmchealthservres.
    biomedcentral.com/articles/10.1186/s12913-019-4262-3#:~:text=Being%20obese%20is%
    20a%20major,diabetes%20%5B3%2C%204%5D.Mclntosh, James. “How Do Race and Ethnicity 
    Influence Childhood Obesity?” Medical News Today, MediLexicon International, 18 
    Jan. 2022, ")
)



ui <- navbarPage(
  title = "Study of Obesity in the United States",
  First_Page,
  Second_Page,
  Third_Page,
  Fourth_Page,
  Fifth_Page,
  Sixth_Page
)


