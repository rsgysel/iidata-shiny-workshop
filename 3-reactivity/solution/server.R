##########################################
##### data types and values - server.R ###
##########################################

library(shiny)

shinyServer(function(input, output) { 
  output$textDisplay <- renderTable({
    # Add a dependence on input$action -> this reactive context updates if actionButton is pressed
    # In this example we don't need this because input$action is used to calculate getMat, but this is
    # how you would use the result of an actio button in general
    input$action 

    comment <- isolate(input$comment)
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
                      # FIXME: update the Value of this row only after actionButton is pressed
                      comment, class(comment), "textInput",
                      input$action, class(input$action[0]), "actionButton"
                    ), ncol=3, byrow = TRUE)

    colnames(getMat) = c("Value", "Class", "Widget")
    
    getMat

  })
})
