library(shiny)
library(dplyr)
library(datasets)

shinyServer(function(input, output) {
    
    output$table <- renderDataTable({
        
        # Data sequance by range min and max
        seq <- seq(from = input$disp[1], to = input$disp[2], by = 0.1) 
        
        data <- transmute(mtcars,
                                   CarModel = rownames(mtcars),
                                   Displacement = disp,
                                   GasolineCost = input$dis/mpg*input$cost, 
                                   MilesPerGallon = mpg,  
                                   Transmission = am,
                                   Cylinders = cyl)
        
        # To filter the data result
        datafilter <- filter(data ,
                                Cylinders %in% input$cyl,
                                Displacement %in% seq, 
                                Transmission %in% input$am) 
        
        # Transmission variable change from 0/1
        datachange <- mutate(datafilter, 
                                Transmission = ifelse(Transmission==0,
                                                      "Automatic",
                                                      "Manual"))
        
        # GasolineCost sort 
        Finaldata <- arrange(datachange, GasolineCost) 
        # Final resultant table
        Finaldata 
        
    },
    # Customize page layout
    options = list(lengthMenu = c(5, 10, 15), pageLength = 15) )
    
})

