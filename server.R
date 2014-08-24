download.file(method = 'curl', 
              'http://www.amstat.org/publications/jse/v9n2/4Cdata.txt',
              destfile = 'tmp_diamond_data.txt')
df <- read.csv('tmp_diamond_data.txt', sep = '', header = F)
colnames(df) <- c('carat', 'color', 'clarity', 'certification.body', 'price')
model4c <- lm(price ~ ., data = df)
summary(model4c)

shinyServer(function(input, output) {
                output$color <- renderPrint({input$color})
                output$clarity <- renderPrint({input$clarity}) 
                output$carats <- renderPrint({input$carats})
                output$certification.body <- renderPrint({input$certification.body})  
                output$predicted.price <-
                        renderText({
                                if (input$goButton >= 1)
                                isolate(
                                        predict(model4c, 
                                                list(carat = {input$carats}, 
                                                     color = {input$color},
                                                     clarity = {input$clarity},
                                                     certification.body = {input$certification.body})
                                                )
                                        
                                        
                                        )

}
        )
}
)