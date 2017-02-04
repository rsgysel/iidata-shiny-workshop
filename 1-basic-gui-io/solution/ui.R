library(shiny)

shinyUI(
  # UI controls on left, output on right
  pageWithSidebar(
    headerPanel("Character count"),
  
    # UI controls
    sidebarPanel(
      textInput(inputId = "userString", label = "Send to server", value = "Enter a string!")
    ), # sidebarPanel
    
    # Output
    mainPanel(
      h3("Results from the server"),
      textOutput("textCharCount"),
      textOutput("outputString")
    ) # mainPanel 
))
