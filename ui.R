# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("True Shooting Percentage (TS%) Calculator (Gauge your NBA-worthiness)"),
  
  # User inputs
  sidebarPanel(
    numericInput('pts', 'Enter total points scored by you', 60, min=0, max=82),
    numericInput('fga', 'Enter total field goal attempts', 50, min=0),
    numericInput('fta', 'Enter total free throw attempts', 12, min=0),

    actionButton(
      inputId = "submit_btn",
      label = "Calculate TS%"
    )
        
    #    submitButton('Calculate TS%')
  ),

  # Responses
  mainPanel(
    p('In basketball, True shooting percentage (TS%) take two- and three-point field goals and free throws are all considered in its calculation, and it attempts to be the one measure that more accurately calculate a player shooting ability than field goal percentage, free throw percentage, and three-point field goal percentage taken individually. ')
    ,p('In NBA 2015-16 regular season, over 170 NBA players took more than 500 shots. Based on their calculated TS%, ranging from 0.437 to 0.669, this app helps you guage your NBA-worthiness.')
    ,h4('Calculating TP% based on values you entered:')
    ,p('total points: '), verbatimTextOutput("pts")
    ,p('total field goal attempts: '), verbatimTextOutput("fga")
    ,p('total free throw attempts: '), verbatimTextOutput("fta")
    ,h4('Your TS% is:')
    ,verbatimTextOutput("TSPct")
    ,verbatimTextOutput("eval")
  )
))
