library(shiny)

shinyServer(function(input, output) {
  output$textCharCount <- renderText({
    sprintf("Your string has %d characters.\n", nchar(input$userString))
  })
  # FIXME: generate outputString here
})                  
