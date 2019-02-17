# This is the server logic of a Shiny web application.

library(shiny)
library(UsingR)
data(galton)

# Define server logic required to draw a plot
shinyServer(
        function(input, output) {
                output$newHist <- renderPlot({
                        hist(galton$child, xlab='Child height in galton data', col='lightblue', main='Histogram', ylim = c(0, 200), xlim = c(60, 75)))

                        # select mu with lines according to user input
                        mu <- input$mu
                        lines(c(mu, mu), c(0, 200), col="red",lwd=5)
                        mse <- mean((galton$child - mu)^2)

                        # render the annotations
                        text(63, 200, paste("mu = ", mu))
                        text(63, 190, paste("MSE = ", round(mse, 2)))
                })
        }
)
