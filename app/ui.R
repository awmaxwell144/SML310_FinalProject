library(shiny)

shinyUI(fluidPage(
  titlePanel("Compare Demographic Data with Election Data in 2020"),
  
  fluidRow(
    column(6,
           h3("Demographic Data"),
           selectInput("dem", 
                       label = "Choose a variable to display",
                       choices = c("Percent White", "Percent Black",
                                   "Percent Indigenous", "Percent Asian",
                                   "Percent Two or More",
                                   "Percent Hispanic", "Percent Male",
                                   "Percent Female",
                                   "Percent Minority"),
                       selected = "Percent White"),
           plotOutput("dem_map")
    ),
    column(6,
           h3("Election Data"),
           selectInput("elec", 
                       label = "Choose a variable to display",
                       choices = c("Percent Republican", "Percent Democrat",
                                   "Percent Other"),
                       selected = "Percent Republican"),
           plotOutput("elec_map")
    )
  )
))
