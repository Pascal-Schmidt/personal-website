projects <- function() {
  shiny::tagList(
    div(
      class = "container",
      div(
        class = "row project-pics",
        div(
          class = "col-sm-12",
          tags$h3("Projects", class = "text-center")
        )
      )
    ),
    div(
      class = "container profile-information",
      div(
        class = "row text-center",
        div(
          class = "col-lg-6 col-md-6 col-sm-12 col-xs-12",
          style = "padding-bottom: 2%",
          div(
            class = "hovereffect",
            tags$img(src = "vancouver.jpg", class = "img-responsive"),
            div(
              class = "overlay",
              tags$h2("Vancouver Housing Market"),
              div(
                class = "group",
                tags$a(class = "info", href = "#", "Link to Project", style = "color: black;"),
                tags$a(class = "info action-button", href = "#", "Description", style = "color: black;", id = "vancouver")
              )
            )
          )
        ),
        div(
          class = "col-lg-6 col-md-6 col-sm-12 col-xs-12",
          style = "padding-bottom: 2%",
          div(
            class = "hovereffect",
            tags$img(src = "surrey.jpg", class = "img-responsive"),
            div(
              class = "overlay",
              tags$h2("Surrey Crime Rates"),
              div(
                class = "group",
                tags$a(class = "info", href = "#", "Link to Project", style = "color: black;"),
                tags$a(class = "info action-button", href = "#", "Description", style = "color: black;", id = "surrey")
              )
            )
          )
        ),
        div(
          class = "col-lg-6 col-md-6 col-sm-12 col-xs-12",
          style = "padding-bottom: 2%",
          div(
            class = "hovereffect",
            tags$img(src = "twitter.jpg", class = "img-responsive"),
            div(
              class = "overlay",
              tags$h2("Twitter Keyword Analysis"),
              div(
                class = "group",
                tags$a(class = "info", href = "#", "Link to Project", style = "color: black;"),
                tags$a(class = "info action-button", href = "#", "Description", style = "color: black;", id = "twitter")
              )
            )
          )
        ),
        div(
          class = "col-lg-6 col-md-6 col-sm-12 col-xs-12",
          style = "padding-bottom: 2%",
          div(
            class = "hovereffect",
            tags$img(src = "marine.jpg", class = "img-responsive"),
            div(
              class = "overlay",
              tags$h2("Marine Ships"),
              div(
                class = "group",
                tags$a(class = "info", href = "#", "Link to Project", style = "color: black;"),
                tags$a(class = "info action-button", href = "#", "Description", style = "color: black;", id = "ships")
              )
            )
          )
        ),
        div(
          class = "col-lg-6 col-md-6 col-sm-12 col-xs-12",
          style = "padding-bottom: 2%",
          div(
            class = "hovereffect",
            tags$img(src = "marine.jpg", class = "img-responsive"),
            div(
              class = "overlay",
              tags$h2("Marine Ships"),
              div(
                class = "group",
                tags$a(class = "info", href = "#", "Link to Project", style = "color: black;", target = "_blank"),
                tags$a(class = "info action-button", href = "#", "Description", style = "color: black;", id = "blog")
              )
            )
          )
        )
      )
    ),
    div(
      shiny::tags$hr(id = "Skills",
                     style = "margin-bottom: 75px;")
    )
  )
}
