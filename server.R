
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#
TSPct_calc <- function(pts, fga, fta) {pts/(2*(fga+(0.44*fta)))}

TSPct_eval <- function(pts, fga, fta) {
  
  TSPct_value = TSPct_calc(pts, fga, fta)
  
  if(TSPct_value<0.437) {
    writeLines(
      c("Boo! You are not NBA-worth."
        ,"Among NBA players who have taken at least 500 shots in the 2015-16 season - "
        ,"Emmanuel Mudiay had the lowest TS%, 0.437"
        ,"Stephen Curry had the highest TS%, at 0.669"
      )
    )
  }else if(TSPct_value>=0.669) {
    writeLines(
      c("2016-17 training camp just started, What are you waiting for?!"
        ,"Among NBA players who have taken at least 500 shots in the 2015-16 season - "
        ,"Emmanuel Mudiay had the lowest TS%, 0.437"
        ,"Stephen Curry had the highest TS%, at 0.669"
      )
    )
  }else{
    writeLines(
      c("Not bad!! You may be NBA-worthy."
        ,"Among NBA players who have taken at least 500 shots in the 2015-16 season - "
        ,"Emmanuel Mudiay had the lowest TS%, 0.437"
        ,"Stephen Curry had the highest TS%, at 0.669"
        #        ,"Below is how you compare: "
      )
    )
    
  }
  
}


shinyServer(

    function(input, output, session) {
      observeEvent(
        eventExpr = input[["submit_btn"]],
        handlerExpr = {
          output$pts <- renderPrint({input$pts})
          output$fga <- renderPrint({input$fga})
          output$fta <- renderPrint({input$fta})
          TSPct <- renderPrint({TSPct_calc(input$pts,input$fga,input$fta)})
          output$TSPct <- TSPct
          output$eval <- renderPrint({TSPct_eval(input$pts,input$fga,input$fta)})
        }
      )
    }

)
