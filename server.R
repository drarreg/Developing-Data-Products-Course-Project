# Developing Data Products - Course Project

# server.R file for the shiny app

# This app was developed to help people get a better understanding of the factors affecting survival rates on the Titanic, using the Titanic dataset from R datasets package.

library(shiny)
library(datasets)
library(dplyr)
data(Titanic)
Titanic_Data <- as.data.frame(Titanic)

shinyServer(
  function(input, output) {

# Show the categories that correspond to the filters
    output$table <- renderDataTable({
      data <- transmute(Titanic_Data, PassengerClass = Class, PassengerGender = Sex, PassengerAgeGroup = Age, Survival = Survived, No.ofPassengers = Freq, "SurvivalRate%" = 0, Total = 0)
      data <- filter(data, PassengerClass %in% input$Class, PassengerGender %in% input$Sex, PassengerAgeGroup %in% input$Age)
      total <- summarise(data, Total = sum(No.ofPassengers))
      data <- group_by(data, Survival)
      data <- summarise(data, "SurvivalRate%" = (sum(No.ofPassengers)/total[1,1])*100)
      data
    })
})