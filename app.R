library(shiny)
library(tidyverse)
library(here)
library(wordcloud2)
library(forcats)

all_files <- list.files("utils/about_me_ui") %>% 
    paste0("utils/about_me_ui/", .)
purrr::walk(all_files, ~ source(.))

all_files <- list.files("utils/shiny_fns") %>% 
    paste0("utils/shiny_fns/", .)
purrr::walk(all_files, ~ source(.))

source("utils/meta_data/app_data.R", local = TRUE)
source("utils/meta_data/blog_data.R", local = TRUE)
source("utils/meta_data/tutorials_data.R", local = TRUE)

# get number of reports in file
number_of_reports <- ls(pattern = "^app_") %>% 
    length()

n_reports <- paste0("app_", 1:number_of_reports)
app_catalog_tbl <- bind_rows(mget(n_reports), .id = "id")

# get number of reports in file
number_of_reports <- ls(pattern = "^tutorial_") %>% 
    length()

n_reports <- paste0("tutorial_", 1:number_of_reports)
tutorial_catalog_tbl <- bind_rows(mget(n_reports), .id = "id")


# Define UI for application that draws a histogram
ui <- shiny::bootstrapPage(

    shinyjs::useShinyjs(),
    shiny::includeCSS("styles.css"),

    navbar_page_with_inputs(
        id = "hello",
        title = "",
        collapsible = TRUE,
        position = "fixed-top",
        
        shiny::tabPanel(
            title = "About Me",
            tags$div(
                id = "active-buttons",
                class = "sidenav",
                style = "padding-top: 100px;",
                tags$ul(
                    class = "text-center",
                    tags$li(
                        tags$a(href = "#Profile", "Profile", class = "active-list")
                    ),
                    tags$li(
                        tags$a(href = "#Experience", "Experience")
                    ),
                    tags$li(
                        tags$a(href = "#Projects", "Projects")
                    ),
                    tags$li(
                        tags$a(href = "#Skills", "Skills")
                    )
                )
            ),
            resume_page(),
            work_experience(),
            projects(),
            skills(),
            div(
                style = "z-index: -1;",
                class = "col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center",
                div(
                    class = "panel panel-default",
                    div(
                        class = "panel-body",
                        wordcloud2::wordcloud2Output(outputId = "wordcloud")
                    )
                )
            )
        ),
        
        shiny::tabPanel(
            title = "Blog",
            value = "show_blog"
            
            
        ),
        
        shiny::tabPanel(
            title = "Projects",
            
            div(
                class = "container",
                style = "padding-top: 125px;",
                uiOutput(outputId = "output_cards")
            )
            
        ),
        
        shiny::tabPanel(
            title = "Shiny Tutorials",
            
            div(
                class = "container",
                style = "padding-top: 125px;",
                uiOutput(outputId = "output_cards_tuts")
            )
            
        ),
        
        inputs = div(
            class = "serach_box",
            id = "hide-show-box",
            style = " padding-top: 25px;",
            textInput(inputId = "search_box", label = NULL, placeholder = "Search", width = 200),
            actionButton(inputId = "search_button", label = "Submit", class = "btn-success"),
            actionButton(inputId = "clear_button", label = "Clear", class = "btn-danger")
        ) %>% shinyjs::hidden()
        
    ),
    

    shiny::includeScript("script.js")
    
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
    
    rv <- shiny::reactiveValues(data = app_catalog_tbl,
                                data_tut = tutorial_catalog_tbl)
    output$output_cards <- renderUI({
        
        print(rv$data)
        div(
            class = "container",
            div(
                class = "row",
                style = "display:-webkit-flex; flex-wrap:wrap",
                create_cards(rv$data)
                
            )
        )
        
    })
    
    output$output_cards_tuts <- renderUI({
        
        div(
            class = "container",
            div(
                class = "row",
                style = "display:-webkit-flex; flex-wrap:wrap",
                create_cards(rv$data_tut)
                
            )
        )
        
    })
    
    shiny::observe({
        
        shiny::req(input$hello != "About Me")
        shinyjs::show(id = "hide-show-box")
        
    })
    
    shiny::observe({
        
        shiny::req(input$hello == "About Me")
        shinyjs::hide(id = "hide-show-box")
    })

    shiny::observeEvent(input$vancouver, {
        
        
        raw <- tags$div(
            tags$h4(
                "Research Question"
            ),
            tags$ul(
                tags$li(
                    "Because I have been living in Vancouver for a long time and was contemplating about purchasing a property,
                     I wanted to thoroughly explore the Vancouver housing market. The questions I wanted to answer are if a certain
                     property sells below or above market value. I was also interested in exploring the price to rent ratios for
                     investment properties"
                )
            ),
            tags$br(),
            tags$h4(
                "Data Collection/Cleaning"
            ),
            tags$ul(
                tags$li(
                    "For this project, I collected all the data myself by scraping certain property features from real estate 
                     websites. I scraped four websites for rent prices and four websites for property prices. I obtained the data
                     with the help of the rvest library and RSelenium libraryin combination with Docker. To get a final and 
                     standardized data set ready for analysis, I made heavy use of the tidyverse libraries."
                ),
                tags$li(
                    "To explain the variation in hosuing prices and rent prices better, I augmented the data set with the help
                     of the Google Maps library. I added latitude and lognitude values, distances from properties to SkyTrain 
                     stations, supermatkets, parks, and schools, and added how many bars, coffe shops, and restaurants are
                     in a radius of the property as predictors."
                )
            ),
            tags$br(),
            tags$h4(
                "Machine Learning"
            ),
            tags$ul(
                tags$li(
                    "A random forest model with 10-fold cross validation for test set error prediction and hyperparameter tuning 
                     was used. The model explained 88% of the variation in hosuing prices and 78% of the variation in renting prices.
                     It turned out the the data augmentation was crucial and increased R-squared by quite a bit for the renting and
                     property price model."
                )
            ),
            tags$br(),
            tags$h4(
                "Application"
            ),
            tags$ul(
                tags$li(
                    "The application was developed in R Shiny. The first page includes a map which serves as a visualization tool
                     and has various filtering options for properties. The second page includes the random forest model and 
                     users can input property features and receive the market value and price to rent ratio for the property."
                )
            )
        )
        
        shiny::modalDialog(
            title = div(
                tags$img(
                    src = "city_van_logo.png",
                    width = "150",
                    height = "60",
                ),
                "Vancouver Housing Market",
                style = "font-size: 30pt;
                         color: #0279B1;
                         border-top-width: 10px;
                         padding-left: 10px;"
            ),
            raw,
            easyClose = TRUE,
            size = "l"
        ) %>% 
            shiny::showModal()
        
    })
    
    shiny::observeEvent(input$surrey, {
        
        raw <- div(
            tags$h4(
                "Research Question"
            ),
            tags$ul(
                tags$li(
                    "Surrey is known for its crime and violence, hence, I was interested in visualizing certain crime types
                     in the Surrey municipality. This projects serves a a visualization tool that shows where and when 
                     crimes are happening."
                )
            ),
            tags$h4(
                "Data Collection/Cleaning"
            ),
            tags$ul(
                tags$li(
                    "The data was collected from the City of Surrey. In order to visualize very single crime, I used the Google
                     Maps library to get latitude and longitude values as well as all the neighborhoods of where the crimes were
                     happening. With the help of the sf library, I was able to categorize the latitude and longitude values 
                     into the different neighborhoods of Surrey."
                )
            ),
            tags$h4(
                "Application"
            ),
            tags$ul(
                tags$li(
                    "The first page of the application shows a map of where the crimes are happening and what type of crimes
                     there are. There is also a crime count, visualized with the highcharter library."
                ),
                tags$li(
                    "On the second page, users are able to group certain variables by their choosing. A table is displayed that
                     shows how crimes have changed over time and plotly plots are being created for every single selected 
                     neighbourhood that shows the change in crimes over time."
                )
            )
        )
        
        shiny::modalDialog(
            title = div(
                tags$img(
                    src = "http://www.partnershipsbc.ca/gifs-4/sbpfp-project-highres-logo.png",
                    width = "150",
                    height = "60",
                    style = "-webkit-filter: drop-shadow(3px 3px 3px #222);"
                ),
                "City of Surrey Crime and Collision Incidents",
                style = "font-size: 30pt;
                 color: #427500;
                 border-top-width: 10px;
                 padding-left: 10px;"
            ),
            raw,
            easyClose = TRUE,
            size = "l"
        ) %>% 
            shiny::showModal()
        
    })
    
    shiny::observeEvent(input$twitter, {
        
        shiny::modalDialog(
            title = "Blog Posts",
            easyClose = TRUE,
            size = "l"
        ) %>% 
            shiny::showModal()
        
    })
    
    shiny::observeEvent(input$ships, {
        
        shiny::modalDialog(
            title = "Blog Posts",
            easyClose = TRUE,
            size = "l"
        ) %>% 
            shiny::showModal()
        
    })
    
    shiny::observeEvent(input$blog, {
        
        shiny::modalDialog(
            title = "Blog Posts",
            easyClose = TRUE,
            size = "l"
        ) %>% 
            shiny::showModal()
        
    })
    
    autoInvalidate <- reactiveTimer(5000, session)
    output$wordcloud <- wordcloud2::renderWordcloud2({


        # autoInvalidate()
        df <- data.frame(word = c("R", "RStudio", "R Shiny", "Python", "C++", "SQL", "Markdown", "CSS", "Docker", "AWS", "Version Control",
                                  "Statistical Analysis", "Machine Learning", "pandas", "tidyverse", "tidymodels", "shinyjs",
                                  "flexdashboard", "Rcpp", "RSelenium", "Web Scraping", "scikit-learn", "NumPy"),
                         freq = sample(x = 5:30, size = 23))
        wordcloud2::wordcloud2(data = df, color = "random-light", size = 0.5)

    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
