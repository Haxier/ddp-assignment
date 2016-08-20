library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Speed and stopping distance for cars"),
    sidebarPanel(
        h4("Enter the speed (mph) you are going to and we will calculate the stopping distance:"),
        numericInput("id1", "Enter a numeric input, from 5 to 25", 20, min=5, max=25, step = 1),
        actionButton("renderButton", "Refresh Plot")
    ),
    mainPanel(
        h4("you entered"),
        verbatimTextOutput("oid1"),
        h4("your stopping distance (ft) is:"),
        verbatimTextOutput("oid2"),
        plotOutput('myHist')
    )
))