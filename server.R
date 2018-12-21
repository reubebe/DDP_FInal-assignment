#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)
library(datasets)
library(caret)

data(iris)
df <- as.data.frame(iris)


inTrain <- createDataPartition(y=iris$Species,
                               p=0.7, list=FALSE)
training <- iris[inTrain,]; testing <- iris[-inTrain,]
dim(training); dim(testing)

modFit <- train(Species ~ ., method="rf",prox=TRUE, data=training)

shinyServer(
  function(input, output) { 
    #pred = predict(modFit, data)
    #output$prediction <- renderPrint ({as.string(pred)})
    output$prediction <- renderPrint ({
      sl = input$sl
      sw = input$sw
      pl = input$pl
      pw = input$pw
      predict(modFit,pw)})
  }
)
