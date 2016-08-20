library(datasets)
library(shiny)
data("cars")
#intrain <- createDataPartition(cars$dist, p=0.7, list= FALSE)
#training <- cars[intrain, ]
#testing <- cars[ -intrain, ]
#mdl <- train(dist ~ speed, data=training, method="glm")
mdl <- lm(dist ~ speed, data = cars)

shinyServer(
    function(input, output){
        output$oid1= renderPrint({input$id1})
        output$oid2= renderPrint({predict(mdl, newdata = data.frame(speed=input$id1))})
        output$myHist <- renderPlot({ 
            input$renderButton
            userspeed <- isolate(input$id1)
            dist <- predict(mdl, newdata = data.frame(speed=userspeed))
            plot(cars$speed, cars$dist, xlab="Car Speed (mph)", ylab = "Distance (ft)", col="blue",main="Stopping Distance") 
            abline(mdl)
            lines(c(userspeed, userspeed), c(0, 200),col="red",lwd=3)    
            text(10, 120, paste("Distance = ", round(dist, digits = 3)))      
            
        })
    }
)