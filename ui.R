#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)
library(caret)
library(datasets)
df <- as.data.frame(iris)

shinyUI( pageWithSidebar(
  headerPanel( "Exploring the iris dataset"),
  sidebarPanel(
    img(src="https://www.pinterest.com/pin/468796642432600760/"),
    
    numericInput( "sepal_length", "sepal_length", 1, min = 4.3, max= 7.9, step = 0.1),
    numericInput( "sepal_width", "sepal_width", 2, min = 2.0, max= 4.4, step = 0.1),
    numericInput( "petal_length", "petal_length", 3, min = 1.0, max= 6.9, step = 0.1),
    numericInput( "petal_width", "petal_width", 2, min = 0.1, max= 2.5, step = 0.1),
    #selectInput( "species", "species", levels(df[1,3]), "setosa"),
    submitButton('Submit')
    #h5("Species ?"),
    #textOutput("result")
  ),
  mainPanel(
    h3("Results of prediction"),
    h4 ('Your Flower\'s Predicted species:'),
    textOutput("prediction")
  )
)

)