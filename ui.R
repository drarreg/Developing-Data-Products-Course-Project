# Developing Data Products - Course Project

# ui.R file for the shiny app

# This app was developed to help people get a better understanding of the factors affecting survival rates on the Titanic, using the Titanic dataset from R datasets package.

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Investigate Key Factors affecting Survival Rates on Titanic!"),
  sidebarPanel(
    helpText("Select at least 1 attribute from each of the following 3 factors (Class, Gender & Age)"),
    checkboxGroupInput("Class", "Passenger's Class:", c("1st"="1st", "2nd"="2nd", "3rd"="3rd", "Crew"="Crew"), selected = c("1st","2nd","3rd","Crew")),
    checkboxGroupInput("Sex", "Passenger's Gender:", c("Male"="Male", "Female"="Female"), selected = c("Male","Female")),
    checkboxGroupInput("Age", "Passenger's Age Group:", c("Child"="Child", "Adult"="Adult"), selected = c("Child","Adult"))
  ),
  
  mainPanel(
    dataTableOutput("table")
  )
))