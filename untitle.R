
TSPct_measure <- function(TSPct_value) {
  
  if(TSPct_value<0.437) {
    writeLines(
        c("Boo! You are not NBA-worth.", 
          "Your True Shoot Percentage (TS%) is: ", TSPct_value, " ",
          "In 2015-16 season, among NBA players who have taken at least 500 shots:",
          "Emmanuel Mudiay had the lowest TS%, 0.437", 
          "Stephen Curry had the highest TS%, at 0.669."
          )
        )
  }else if(TSPct_value>=0.669) {
    writeLines(
      c("2016-17 training camp just started, What are you waiting for?!", 
        "Your True Shoot Percentage (TS%) is: ", TSPct_value, " ",
        "In 2015-16 season, among NBA players who have taken at least 500 shots:",
        "Emmanuel Mudiay had the lowest TS%, 0.437", 
        "Stephen Curry had the highest TS%, at 0.669."
      )
    )
  }else{
    writeLines(
      c("Not bad!! You may be NBA-worthy.", 
        "Your True Shoot Percentage (TS%) is: ", TSPct_value, " ",
        "Below is how you compare among NBA players who have taken at least 500 shots in the 2015-16 season.",
        "Emmanuel Mudiay had the lowest TS%, 0.437", 
        "Stephen Curry had the highest TS%, at 0.669."
      )
    )
  
    nba <- read.csv("tspct-nba2015.csv")
    hist(nba$TSPct,main="Histogram of NBA Players TS% (2015-16)")
    abline(v=TSPct_value,col="red")
    
  }
  
}

TSPct_measure(0.445)

