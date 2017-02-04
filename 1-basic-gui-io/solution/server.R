library(shiny)

shinyServer(function(input, output) {
  output$textCharCount <- renderText({
    sprintf("Your string has %d characters.\n", nchar(input$userString))
  })
  output$outputString <- renderText({
    sprintf("Your string is \"%s\"\n", input$userString)
  })
})
                  
