#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic

      # golem::golem_welcome_page() # Remove this line to start building your UI
      shinydashboardPlus::dashboardPage(
        header = shinydashboardPlus::dashboardHeader(
          title = "Golem Test App"
        ),
        sidebar = shinydashboardPlus::dashboardSidebar(
          shinydashboard::sidebarMenu(
            # id = "tabs",
            shinydashboard::menuItem("Main", tabName = "main", icon = icon("home"))
          )
        ),
        body = shinydashboard::dashboardBody(
          #add easy CSS CBR global theme-- have one set for SACPAS colors too
          fresh::use_theme(CBRtheme),
          #add module for plot code using golem::add_module("main) for shortcut
          mod_main_ui("mod_main_1")
        )
        ),
        shinydashboardPlus::dashboardFooter(left = "add your footer here")
      )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "GolemTestApp"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
