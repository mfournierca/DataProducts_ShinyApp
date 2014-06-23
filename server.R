shinyServer(function(input, output, session) {
  
  #create new data frame from user - selected variables
  selectData <- reactive({
    swiss[, c(input$xcol, input$ycol)]
  })
  
  #the clustering function
  kclust <- reactive({
    kmeans(selectData(), input$numclusters)
  })
  
  #create the output
  output$plot1 <- renderPlot({
    
    #plot k means
    par(mar = c(5, 5, 1, 0))
    par(mfrow=c(1, 1))
    
    plot(selectData(), col=kclust()$cluster, pch=20, cex=2)
    points(kclust()$centers, pch=5, cex=4, lwd=1)
  })
})