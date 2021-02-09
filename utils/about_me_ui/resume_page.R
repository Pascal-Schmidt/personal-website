resume_page <- function() {
  shiny::tagList(
    div(
      class = "container",
      div(
        class = "text-center",
        shiny::tags$h1(tags$strong("Pascal Schmidt"), class = "name"),
        shiny::tags$h3("Data Analyst",
          class = "subheading"
        )
      ),

      div(
        shiny::tags$hr(style = "margin-bottom: 50px;",
                       id = "Profile")
      ),

      div(
        class = "row",
        div(
          class = "col-sm-12",
          tags$h2("Profile",
            class = "res_header"
          )
        )
      ),

      div(
        class = "row profile-information",
        div(
          class = "col-sm-4",
          tags$h3("About Me",
            class = "text-center"
          ),
          tags$p("I am currently working as a data analyst, building dashboards, testing hypothesis, and doing all
                    different kinds of data analysis. The main tools I use are R, Shiny, Python, and SQL. When I am not
                    working my day job, I am blogging at thatdatatho.com and building web applications on my
                    personal website about data that interests me.")
        ),
        div(
          class = "col-sm-4 text-center",
          tags$img(
            src = "pascal-schmidt-circle.png",
            style = "width: 225px;"
          )
        ),
        div(
          class = "col-sm-4",
          tags$h3("Contact",
            class = "text-center"
          ),
          tags$p(icon("envelope"), "pascal.sfu@gmail.com", class = "text-center"),
          tags$a(
            href = "https://thatdatatho.com/", target = "_blank", style = "text-decoration: none;",
            tags$p(icon("globe"), "thatdatatho.com",
              class = "text-center my-website",
              style = "color: black;"
            )
          ),
          div(
            class = "text-center group",
            tags$a(
              href = "http://github.com/Pascal-Schmidt", target = "_blank",
              tags$img(src = "github.png", style = "width: 100px;", class = "github-img"),
            ),
            tags$a(
              href = "https://www.linkedin.com/in/pascal-data-science/", target = "_blank",
              tags$img(src = "linkedin.png", style = "width: 100px;", class = "linkedin-img")
            )
          )
        )
      ),
      div(
        shiny::tags$hr(id = "Experience",
                       style = "margin-bottom: 75px;")
      )
    )
  )
}
