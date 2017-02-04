##########################################
##### data types and values - server.R ###
##########################################

library(shiny)

shinyServer(function(input, output) { 
  
  output$textDisplay <- renderTable({ 
                                     
    getMat = matrix(c(paste(input$checkGroup, collapse=','), class(input$checkGroup), "checkboxGroupInput",
                      input$boxInput, class(input$boxInput), "checkboxInput", 
                      as.character(as.Date(input$theDate, origin = "1970-01-01")), class(input$theDate), "dateInput",
                      paste(as.character(as.Date(input$dateRange[1], origin = "1970-01-01")),
                            as.character(as.Date(input$dateRange[2], origin = "1970-01-01")), collapse = ','),
                            class(input$dateRange), "dateRangeInput",
                      input$pickNumber, class(input$pickNumber), "numericInput",
                      input$pickRadio, class(input$pickRadio), "radioButtons",
                      input$comboBox, class(input$comboBox), "selectInput",
                      input$slider, class(input$slider), "sliderInput",
                      input$comment, class(input$comment), "textInput"
                      # FIXME: Add a row for the 'action' widget here
                    ), ncol=3, byrow = TRUE)

    colnames(getMat) = c("Value", "Class", "Widget")
    
    getMat

  })
})
