library(shiny)
library(datasets)
vars <- colnames(houseprice)

# Create a mock dataset with the three main types of variables 
# (numeric, strings and booleans), "stringy" row.names and a 
# few missing values for the user to test the renderTable() 
# inputs with
mock <- data.frame(v1 = c(    1,    2,    NA,   9,   NaN,   7 ),
                   v2 = c(  "a",  "b",   "c", "d",   "e",  NA ),
                   v3 = c( TRUE, TRUE, FALSE,  NA, FALSE, TRUE)) 
row.names(mock) <- c("uno", "dos", "tres", "cuatro", "cinco", "seis")


function(input, output, session) {
  
  source("tab1.R", local=TRUE)
  source("tab2.R", local=TRUE)
  source("tab3.R", local=TRUE)
  source("s.R", local=TRUE)
  
}
