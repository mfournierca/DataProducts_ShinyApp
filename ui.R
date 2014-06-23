shinyUI(fluidPage(
  
  titlePanel("Clustering Swiss Fertility Data"), 
  
  fluidRow(
    
    column(4,
      numericInput("numclusters", "Cluster Count", 3,
            min=1, max=8),
      selectInput("xcol", "X Variable", names(swiss)),
      selectInput("ycol", "Y Variable", names(swiss), 
                  selected=names(swiss)[[2]]),
      
      includeHTML("documentation.html")
    ),
  
    column(8, 
      plotOutput('plot1')
    )
  )
))