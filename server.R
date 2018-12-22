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


#inTrain <- createDataPartition(y=iris$Species,
                               #p=0.7, list=FALSE)
#training <- iris[inTrain,]; testing <- iris[-inTrain,]
#dim(training); dim(testing)

modFit <- train(species ~ ., method="rf",prox=TRUE, data=df)
#modFit <- train(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width , method="glm", data=iris)
#getTree(modFit$finalModel,k=2)
#irisP <- classCenter(training[,c(1,2)], training$Species, modFit$finalModel$prox)
#irisP <- as.data.frame(irisP); irisP$Species <- rownames(irisP)


shinyServer(
  function(input, output) { 
    #pred = predict(modFit, data)
    #output$prediction <- renderPrint ({as.string(pred)})
    output$prediction <- renderPrint ({
      sepal_length = input$sepal_length
      sepal_width = input$sepal_width
      petal_length = input$petal_length
      petal_width = input$petal_width
      #species = input$species
      predict(modFit,data.frame(sepal_length,sepal_width,petal_length,petal_width))})
      
    }
  )
    


#r<- reactive(predict(modFit, df[df$Sepal.Length == input$sl & df$Sepal.Width == input$sw & df$Petal.Length == input$pl & df$Petal.Width == input$pw & df$Species =="setosa",1:3])) levels(r)[r]