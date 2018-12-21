#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
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

shinyUI( pageWithSidebar(
  headerPanel( "Exploring the iris dataset"),
  sidebarPanel(
    img(src="https://www.pinterest.com/pin/468796642432600760/"),
    br(),
    numericInput( "sl", "Sepal.Length", 1, min = 4.3, max= 7.9, step = 0.1),
    numericInput( "sw", "Sepal.Width", 2, min = 2.0, max= 4.4, step = 0.1),
    numericInput( "pl", "Petal.Length", 3, min = 1.0, max= 6.9, step = 0.1),
    numericInput( "pw", "Petal.Width", 4, min = 0.1, max= 2.5, step = 0.1),
    submitButton('Submit')
  ),
  mainPanel(
    h3("Results of prediction"),
    h4 ('Your Flower\'s Predicted Petal length:'),
    textOutput("prediction")
  )
)

)