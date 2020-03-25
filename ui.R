library(shiny)

shinyUI(fluidPage(

    titlePanel("The Best Cars"),

    sidebarLayout(
        sidebarPanel(
          h4("Please select variables to define the best cars"),
            helpText("Use the slider or boxes to set the values for:"),
            sliderInput('disp', 
                        'Displacement', 
                        min=70, 
                        max=480, 
                        value= c(160,325),
                        step=5),                
            helpText("Select gasoline price range"),
            numericInput('cost',
                         'Gasoline Price (per gallon)',
                         min = 2,
                         max = 5,
                         step=0.01,
                         value = 3.2),          
          helpText("Define the distance covered in miles"),
            numericInput("dis",
                         "Distance Range (in miles)",
                         min = 1,
                         max = 500,
                         value = 30),  
            checkboxGroupInput('am', 
                               'Transmition Type', 
                               c("Automatic"= 0, "Manual"= 1), 
                               selected = 0 ),
            checkboxGroupInput('cyl',
                               'Cylinders',
                               c("Four"=4, "Six"=6, "Eight"=8),
                               selected = c(4,8)),


        ),
        
        # Show a plot of the generated distribution
        mainPanel( 
            helpText("Results are filtered here"),
            dataTableOutput("table")
        ) 
      )
    ))
    
