create_cards <- function(data) {
  
  data %>%
    dplyr::mutate(id = forcats::as_factor(id)) %>%
    dplyr::group_split(id) %>%
    purrr::map(~
                 
                 # Cards
                 div(
                   class = "col-sm-4",
                   style = "display:flex;",
                   div(
                     class = "panel panel-default",
                     div(
                       class = "panel-heading",
                       h4(.$title, br(), tags$small(.$subtitle))
                     ),
                     div(
                       class = "panel-body",
                       tags$img(
                         class = "img img-thumbnail text-center",
                         src   = .$img
                       ),
                       tags$br(), tags$br(),
                       p(.$description),
                       a(
                         type   = "button",
                         class  = "btn btn-default",
                         target = "_blank",
                         href   = .$sub_directory,
                         "Open"
                       )
                     )
                   )
                 ) 
               
    ) %>%
    shiny::tagList()
  
}