#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  data_path <- system.file("app/data", "fake_data_updated_via_cron_job.rda", package = "GolemTestApp")

  fake_data_updated_via_cron_job <- reactiveFileReader(
    intervalMillis = 1000*60,  # check every minute
    session = session,
    filePath = data_path,
    readFunc = function(path) {
      current_time <- Sys.time()
      message("[fake_data_updated_via_cron_job.rda] File checked at: ", format(current_time, "%Y-%m-%d %H:%M:%S"))

      e <- new.env()
      load(path, envir = e)
      e$fake_data_updated_via_cron_job  # actual loaded object returned
    }
  )

  observe({
    fake_data_updated_via_cron_job()

    #add module for main server code
    mod_main_server("mod_main_1", add_reactive_data = fake_data_updated_via_cron_job())
    })
}
