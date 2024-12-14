library(maps)
counties <- readRDS("data/2020_percents.rds")
source("helpers.R")

shinyServer(
  function(input, output) {
    output$dem_map <- renderPlot({
      args <- switch(input$dem,
                     "Percent White" = list(counties$PERC_WHITE, "darkgreen", "% White"),
                     "Percent Black" = list(counties$PERC_BLACK, "black", "% Black"),
                     "Percent Indigenous" = list(counties$PERC_INDIG, "blue3", "% Indigenous"),
                     "Percent Asian" = list(counties$PERC_ASIAN, "darkviolet", "% Asian"),
                     "Percent Two or More" = list(counties$PERC_TWOMO, "red3", "% Two or More"),
                     "Percent Hispanic" = list(counties$PERC_HISPA, "darkorange", "% Hispanic"),
                     "Percent Male" = list(counties$PERC_MALE, "deeppink4", "% Male"),
                     "Percent Female" = list(counties$PERC_FEMALE, "darkcyan", "% Female"),
                     "Percent Minority" = list(counties$PERC_MINORITY, "darkslategrey", "% Minority"))
      
      args$min <- input$range[1]
      args$max <- input$range[2]
      
      do.call(percent_map, args)
    })
    
    output$elec_map <- renderPlot({
      args <- switch(input$elec,
                     "Percent Republican" = list(counties$PERC_REPUBLICAN, "red3", "% Republican"),
                     "Percent Democrat" = list(counties$PERC_DEMOCRAT, "blue3", "% Democrat"),
                     "Percent Other" = list(counties$PERC_OTHER, "darkgreen", "% Other party"))
      
      args$min <- input$range[1]
      args$max <- input$range[2]
      
      do.call(percent_map, args)
    })
  }
)
