# This is the user-interface definition of a Shiny web application.

library(shiny)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(

        # Application title
        headerPanel("Histogram of child height"),

        # Sidebar with options
        sidebarPanel(
                sliderInput('mu', 'Guess at the mean',value = 62, min = 62, max = 74, step = 0.05,)
        ),


        # make a histogram
        mainPanel(
                plotOutput('newHist')
        )
))
