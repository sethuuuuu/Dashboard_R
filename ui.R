# Dashboard UI
ui <- dashboardPage(
  
  dashboardHeader(
    title = "Revenue Realisation from Direct Taxes",
    titleWidth = 650, 
    tags$li(class = "dropdown", tags$a(href = "https://www.linkedin.com/in/sumiran-naman-b5b38339/", icon("linkedin"), "My Profile", target = "_blank")),
    tags$li(class = "dropdown", tags$a(href = "https://github.com/sumiran98/Crime_against_women_dashboard", icon("github"), "Source code and Report", target = "_blank"))
  ),
  dashboardSidebar(
    sidebarMenu(
      id = "sidebar",
      menuItem("Dataset", tabName = "data", icon = icon("database")),
      menuItem(text = "Visualization", tabName = "viz", icon = icon("chart-line")),
      menuItem(text = "Analysis", tabName = "anova", icon = icon("chart-line")),
      selectInput(inputId = "var1", label = "Select the type", choices = choices1, selected = "Revenue Realization From - Corporation Tax")
    )
  ),
  
  dashboardBody(
    tabItems(
      #First tab item
      tabItem(tabName = "data",
              #tab box
              tabBox(id = "t1", width = 12,
                     tabPanel("About",
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("Welcome to the Revenue Realisation from Direct Taxes Dashboard – This data analysis delves into the revenue realization from direct taxes, focusing on Corporation Tax, Income Tax, and Other Direct Taxes over a specified financial period. By examining the minimum, maximum, average, and median revenue realizations for each tax category, as well as their respective growth rates and share in total direct taxes, this report aims to provide valuable insights into the fiscal landscape. Understanding the patterns and trends in revenue generation is crucial for policymakers and stakeholders to make informed decisions regarding taxation policies, compliance measures, and revenue management strategies. Through this analysis, we seek to uncover key findings that can guide future fiscal planning and optimize tax collection mechanisms for sustainable economic growth.")),
                                column(width = 4, tags$br() ,
                                       tags$p("Abbrevations used are (CR) Case Registered")
                                )
                              )  
                              
                     ),
                     tabPanel("Data",dataTableOutput("dataT")),
                     tabPanel("Structure",verbatimTextOutput("structure")),
                     tabPanel("Summary",verbatimTextOutput("summary")))),
      tabItem(tabName = "viz",
              #tab box
              tabBox(id = "t1", width = 12,
                     tabPanel("variation by year",value = "variation", plotlyOutput("bar")),
                     tabPanel("Distribution", value = "distro",plotlyOutput("histplot")))),
      tabItem(tabName = "anova",
              tabBox(id = "t1", width = 12,
                     tabPanel("About",
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("This part of Dashboard compares revenue realisation from direct taxes using test of Anova")),
                                column(width = 4, tags$br())
                     
                     )),
                     tabPanel("CR", verbatimTextOutput("CR")),
                     tabPanel("CCS", verbatimTextOutput("CCS")),
                     tabPanel("CON", verbatimTextOutput("CON")),
                     tabPanel("PAR", verbatimTextOutput("PAR")),
                     tabPanel("PCS", verbatimTextOutput("PCS")),
                     tabPanel("PCV", verbatimTextOutput("PCV"))
    )
    
  )
)))
