#' main UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @param add_reactive_data reactive data frame rendered via cron job, and found within inst/app/data/ folder
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_main_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h3("Main Module UI"),
    plotOutput(ns("main_plot_reactive")),
  )
}

#' main Server Functions
#'
#' @noRd
mod_main_server <- function(id, add_reactive_data){
  moduleServer(id, function(input, output, session){
    ns <- session$ns


    #Uses reactive file reader data generated in app_server.R
    output$main_plot_reactive <- renderPlot({
      x <- add_reactive_data$x
      y <- add_reactive_data$y
      date <- unique(add_reactive_data$date)
      # Example plot code
      plot(x,y, main = paste("Simulated data\nlast updated:", date), xlab = "x", ylab = "y")
    })

  })
}

## To be copied in the UI
# mod_main_ui("main_1")

## To be copied in the server
# mod_main_server("main_1")
