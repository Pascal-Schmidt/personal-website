work_experience <- function() {
  shiny::tagList(
    div(
      class = "container",
      div(
        class = "row",
        div(
          class = "col-sm-12",
          tags$h3("Work Experience", class = "text-center")
        )
      )
    ),
    div(
      class = "container profile-information",
      div(
        class = "row",
        div(
          class = "col-sm-1"
        ),
        div(
          class = "col-sm-5 text-center",
          tags$strong("LBC Studios"),
          tags$br(),
          tags$p("November 2020 - Current"),
          tags$br(),
          tags$img(src = "lbc.png", style = "width: 200px;
                                             border-radius: 25px;")
        ),
        div(
          class = "col-sm-5",
          tags$strong("Data Analyst"),
          tags$br(),
          tags$br(),
          tags$ul(
            style = "padding-inline-start: 0px;",
            tags$li("Investigated returns on bundle purchases by testing multiple hypotheses and
                     recommended different price points that led to increased revenue for the analyzed
                     bundles."),
            tags$li("Provided dashboards and reports to the marketing team to better understand
                     marketing campaigns and revenue flow."),
            tags$li("Created an R Shiny application that serves as an index page for our data analysis reports,
                    making it easier for various teams to get access to all reports in an easy way.")
          ),
          tags$br(),
          tags$span(
            style = "display: block;",
            tags$span(
              shiny::icon(name = "map-marker"), "Vancouver, BC | "
            ), tags$span(
              shiny::icon(name = "link"), tags$a("https://lbcstudios.ca/", href = "https://lbcstudios.ca/", target = "_blank")
            )
          ),
          div(
            class = "col-sm-1"
          )
        )
      ),


      div(
        style = "padding-top: 5%",
        class = "row",
        div(
          class = "col-sm-1"
        ),
        div(
          class = "col-sm-5 text-center",
          tags$strong("samdesk"),
          tags$br(),
          tags$p("June 2020 - November 2020"),
          tags$br(),
          tags$img(src = "samdesk.png", style = "width: 200px;
                                                 border-radius: 25px;")
        ),
        div(
          class = "col-sm-5",
          tags$strong("Data Analyst"),
          tags$br(),
          tags$br(),
          tags$ul(
            style = "padding-inline-start: 0px;",
            tags$li("Deployed and dockerized a web application on AWS with R Shiny that analyzed realtime
                   Twitter data, which led to increased productivity of employees who used the
                   application for research purposes."),
            tags$li("Queried, cleaned, and visualized data with the help of pandas, NumPy, and Python
                   plotting libraries to update teams about machine learning model performances."),
            tags$li("Developed automated interactive dashboards with plotly and flexdashboard to
                   inform teams about the internal data usage and to improve the client experience by
                   sending out quality information.")
          ),
          tags$br(),
          tags$span(
            style = "display: block;",
            tags$span(
              shiny::icon(name = "map-marker"), "Edmonton, AB | "
            ), tags$span(
              shiny::icon(name = "link"), tags$a("https://www.samdesk.io/", href = "https://www.samdesk.io/", target = "_blank")
            )
          ),
          div(
            class = "col-sm-1"
          )
        )
      ),



      div(
        style = "padding-top: 5%",
        class = "row",
        div(
          class = "col-sm-1"
        ),
        div(
          class = "col-sm-5 text-center",
          tags$strong("Statistics Canada"),
          tags$br(),
          tags$p("May 2019 - August 2019"),
          tags$br(),
          tags$img(src = "profil_picture.jpg", style = "width: 200px;
                                               border-radius: 25px;")
        ),
        div(
          class = "col-sm-5",
          tags$strong("Data Analyst (co-op)"),
          tags$br(),
          tags$br(),
          tags$ul(
            style = "padding-inline-start: 0px;",
            tags$li("Developed R scripts for cleaning multiple data sets and used SQL joins to build a
                   usable data set for analysis."),
            tags$li("Built an R markdown report with tables and graphs for a better understanding of
                   why people’s addresses on administrative data match that on census data."),
            tags$li("Created data visualization plots in Power BI to supplement the R markdown report."),
            tags$li("Presented data and conclusions to my team, which used the results to gain
                   actionable insights into the Census Program Transformation Project and improved
                   the population coverage for admin data.")
          ),
          tags$br(),
          tags$span(
            style = "display: block;",
            tags$span(
              shiny::icon(name = "map-marker"), "Ottawa, ON | "
            ), tags$span(
              shiny::icon(name = "link"), tags$a("https://www.statcan.gc.ca/eng/start", href = "https://www.statcan.gc.ca/eng/start", target = "_blank")
            )
          ),
          div(
            class = "col-sm-1"
          )
        )
      ),



      div(
        style = "padding-top: 5%",
        class = "row",
        div(
          class = "col-sm-1"
        ),
        div(
          class = "col-sm-5 text-center",
          tags$strong("BC Cancer Agency"),
          tags$br(),
          tags$p("May 2018 - December 2018"),
          tags$br(),
          tags$img(src = "bc_cancer.png", style = "width: 200px;
                                                 border-radius: 25px;")
        ),
        div(
          class = "col-sm-5",
          tags$strong("Data Scientist (co-op)"),
          tags$br(),
          tags$br(),
          tags$ul(
            style = "padding-inline-start: 0px;",
            tags$li("Designed reports and conducted an explanatory data analysis, which led to a
                   successful publication, by visualizing the key characteristics of patients with
                   endometrial cancer."),
            tags$li("Produced interactive dashboards to communicate data to physicians who used my
                   work for presentations."),
            tags$li("Independently researched and applied previously unknown statistical libraries for
                   improved data representation."),
            tags$li("Composed a bi-annual report by cleaning, reshaping, and joining multiple
                   unstructured data sources, working extensively with R tidyverse packages such as
                   dplyr, ggplot, purrr, tidyr, and stringr."),
            tags$li("Implemented a meta-analysis of individual patient data and a cox-regression model
                   to determine if endometrial cancer patients need additional treatment plans and to
                   improve their quality of life.")
          ),
          tags$br(),
          tags$span(
            style = "display: block;",
            tags$span(
              shiny::icon(name = "map-marker"), "Vancouver, BC | "
            ), tags$span(
              shiny::icon(name = "link"), tags$a("http://www.bccancer.bc.ca/", href = "http://www.bccancer.bc.ca/", target = "_blank")
            )
          ),
          div(
            class = "col-sm-1"
          )
        )
      ),
      div(
        shiny::tags$hr(id = "Projects",
                       style = "margin-bottom: 75px;")
      )
    )
  )
}
