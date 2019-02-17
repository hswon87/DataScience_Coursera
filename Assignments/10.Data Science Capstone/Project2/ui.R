library(shiny)

shinyUI(
    fixedPage(
        column(
            width = 12,
            offset = 0,
            titlePanel("Predicting the Following Word"),
            wellPanel("This application is a part of the project for the Coursera Data Science Capstone Course.
                      The auto-completion algorithm which is commonly used function on websites were presented.
                      Please press \"Submit\" after typing the phrase in input box"),
            fixedRow(
                sidebarPanel(
                    span(
                        textInput(
                            "phrase",
                            "Input Phrase Here:",
                            value = ""
                        ),
                        actionButton("predictButton", "Submit")
                    )
                ),
                mainPanel(
                    h3(strong("Input phrase:")),
                    textOutput("phrase"),
                    h3(strong("Following word will be:")),
                    textOutput("word")
                )
            ),
            tabsetPanel(
                tabPanel(
                    "ui.R",
                    br(),
                    includeHTML("ui.html")
                ),
                tabPanel(
                    "server.R",
                    br(),
                    includeHTML("server.html")
                )
            )
        )
    )
)
