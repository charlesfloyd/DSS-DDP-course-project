shinyUI(pageWithSidebar( 
                headerPanel("Diamond Price Calculator (in Singapore Dollars)"), 
                sidebarPanel(
                        numericInput('carats', 'carat weight (0.0 - 1.0)', 
                                     min = 0, max = 1, step = 0.05, 
                                     value = 0.5), 
                        radioButtons("color",
                                           "color (please choose one)",
                                           c("D" = "D", "E" = "E", "F" = "F",
                                             "G" = "G", "H" = "H", "I" = 'I')),
                        radioButtons("clarity",
                                           "clarity (please choose one)",
                                           c("IF" = "IF", "VVS1" = "VVS1", 
                                             "VVS2" = "VVS2", 'VS1' = 'VS1',
                                             'VS2' = 'VS2')),
                        radioButtons('certification.body',
                                           'certification.body (please choose one)',
                                           c("GIA" = "GIA", "HRD" = "HRD",
                                           "IGI" = "IGI")),
                        actionButton("goButton", "Calculate!")
                        ),
                mainPanel(
                        h3('Current selections:'), 
                        h4('for carats'), verbatimTextOutput('carats'), 
                        h4('for color'), verbatimTextOutput("color"), 
                        h4('for clarity'), verbatimTextOutput("clarity"),
                        h4('for certification body'), 
                        verbatimTextOutput('certification.body'),
                        h3('calculated price (in Singapore dollars)'),
                        verbatimTextOutput('predicted.price')
                        ) 
                )
)
