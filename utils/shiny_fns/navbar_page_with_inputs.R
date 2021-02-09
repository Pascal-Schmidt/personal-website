navbar_page_with_inputs <- function(..., inputs) {
  navbar <- shiny::navbarPage(...)
  
  form <- tags$form(class = "navbar-form navbar-right", inputs)
  
  navbar[[3]][[1]]$children[[1]]$children[[2]] <- htmltools::tagAppendChild(
    navbar[[3]][[1]]$children[[1]]$children[[2]], form
  )
  
  return(navbar)
}