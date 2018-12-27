#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)
library(caret)
library(randomForest)
library(RCurl)
library(rsconnect)
iris <- getURL("https://raw.githubusercontent.com/uiuc-cse/data-fa14/gh-pages/data/iris.csv")
iris <- read.csv(text = iris)
df <- as.data.frame(iris)


library(ggplot2)



# Define server logic required to plot variables
shinyServer(function(input, output) {
  
  # Create a reactive text
  text <- reactive({
    paste(input$sepal_length, 'versus', input$sepal_width)
  })
  
  # Return as text the selected variables
  output$iris_Characteristics <- renderText({
    text()
  })
  
  # Generate a plot of the selected variables
  output$plot <- renderPlot({
    p <- ggplot(iris, aes_string(x=input$sepal_length, 
                                 y=input$sepal_width, 
                                 colour="species")) + geom_point()
    print(p)
  })
  
  # Generate a head of the data
  output$head <- renderPrint({
    head(iris)
  })
})