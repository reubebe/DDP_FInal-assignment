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



# Define UI for IRIS application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Reuben Addison - IRIS characteristics: Plotting Two Variables"),
  
  # Sidebar with controls to select the variables to plot 
  sidebarPanel(
    
    h3("* Select two varibles to be ploted:"),
    selectInput("sepal_length", "First variable:",
                list("sepal_length" = "sepal_length",
                     "sepal_width"  = "sepal_width",
                     "petal_length" = "petal_length",
                     "petal_width"  = "petal_width")),
    
    selectInput("sepal_width", "Second variable:",
                list("sepal_length" = "sepal_length",
                     "sepal_width"  = "sepal_width",
                     "petal_length" = "petal_length",
                     "petal_width"  = "petal_width"))
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Plot", 
               h3 ("* Here, The plot of the two selected variables:"),
               h3(textOutput("caption")),
               plotOutput("plot")),
      
      tabPanel("Readme", 
               h3 ("* This gives documentation about the application:"),
               h3 (""),
               h3("This application gives a plot two variables from IRIS data set."),
               verbatimTextOutput("head")),
      h3 (""),
      h3 ("You first need to select two variables from the options provided."),
      h3 ("After which you view  the plot from the plot panel using species as colors."),
      h3 ("")
    ))
))