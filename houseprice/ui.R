library(shiny)
library(leaflet)
source("readdata.R")

vars <- colnames(houseprice)

navbarPage("house price",
           
  tabPanel("Interactive map",
    leafletOutput("myMap", width="100%", height="1000"),
    absolutePanel(fixed = TRUE, draggable = TRUE, 
                  top = 200, left = 20, right = "auto", 
                  bottom = "auto", width = 330, height = "auto",
                  h2("Feature Selects"),
                  selectInput("feature", "Features", vars[3:7]),
                  sliderInput("bins", "",
                              min = 0, max = 100, value = 25),
                  plotOutput("histCentile", height = 200)
    )
  ),
  tabPanel("K means",
    selectInput("featureX", "x Features", vars[3:7]),
    selectInput("featureY", "Y Features", vars[3:7]),
    sliderInput("clusters", "",
               min = 1, max = 10, value = 5),
    plotOutput("kmeans")
  ),
  tabPanel(
    "render-table",
    fluidPage(
      fluidRow(
        column(12,
               #h2("Shiny Table Demo"),
               fluidRow(
                 column(4,
                        h3("Inputs"),
                        hr(),
                        fluidRow(
                          column(6, selectInput("dataset", "Data:", 
                                                c("rock", "pressure", "cars", "mock"))),
                          column(6,numericInput("obs", "Rows:", 6))
                        ),
                        br(),
                        fluidRow(
                          column(6, checkboxGroupInput("format", "Options:",
                                                       c("striped", "bordered", "hover"))),
                          column(6, radioButtons("spacing", "Spacing:",
                                                 c("xs", "s", "m", "l"), "s"))
                        ),
                        br(),
                        fluidRow(
                          column(6, selectInput("width", "Width:",
                                                c("auto", "100%", "75%",
                                                  "300", "300px", "10cm"), "auto")),
                          column(6, uiOutput("pre_align"))
                        ),
                        br(),
                        fluidRow(
                          column(6, radioButtons("rownames", "Include rownames:",
                                                 c("T", "F"), "F", inline=TRUE)),
                          column(6, radioButtons("colnames", "Include colnames:",
                                                 c("T", "F"), "T", inline=TRUE))
                        ),
                        br(),
                        fluidRow(
                          column(6, selectInput("digits", "Number of decimal places:",
                                                c("NULL", "3", "2", "0", "-2", "-3"))),
                          column(6, selectInput("na", "String for missing values:",
                                                c("NA", "missing", "-99"), "NA"))
                        )
                 ),
                 column(7, offset=1,
                        h3("Table and Code"),
                        br(),
                        tableOutput("view"),
                        br(),
                        h4("Corresponding R code:"),
                        htmlOutput("code")
                 )
               )
        )
      )
    )
    
  ),
  tabPanel("Selectize examples",
           
           fluidPage(
             title = 'Selectize examples',
             sidebarLayout(
               sidebarPanel(
                 selectInput(
                   'e0', '0. An ordinary select input', choices = state.name,
                   selectize = FALSE
                 ),
                 selectizeInput(
                   'e1', '1. A basic example (zero-configuration)',
                   choices = state.name
                 ),
                 selectizeInput(
                   'e2', '2. Multi-select', choices = state.name, multiple = TRUE
                 ),
                 selectizeInput(
                   'e3', '3. Item creation', choices = state.name,
                   options = list(create = TRUE)
                 ),
                 selectizeInput(
                   'e4', '4. Max number of options to show', choices = state.name,
                   options = list(maxOptions = 5)
                 ),
                 selectizeInput(
                   'e5', '5. Max number of items to select', choices = state.name,
                   multiple = TRUE, options = list(maxItems = 2)
                 ),
                 # I() indicates it is raw JavaScript code that should be evaluated, instead
                 # of a normal character string
                 selectizeInput(
                   'e6', '6. Placeholder', choices = state.name,
                   options = list(
                     placeholder = 'Please select an option below',
                     onInitialize = I('function() { this.setValue(""); }')
                   )
                 ),
                 selectInput(
                   'e7', '7. selectInput() does not respond to empty strings',
                   choices = state.name
                 )
               ),
               mainPanel(
                 helpText('Output of the examples in the left:'),
                 verbatimTextOutput('ex_out'),
                 # use Github instead
                 selectizeInput('github', 'Select a Github repo', choices = '', options = list(
                   valueField = 'url',
                   labelField = 'name',
                   searchField = 'name',
                   options = list(),
                   create = FALSE,
                   render = I("{
                              option: function(item, escape) {
                              return '<div>' +
                              '<strong><img src=\"http://brianreavis.github.io/selectize.js/images/repo-' + (item.fork ? 'forked' : 'source') + '.png\" width=20 />' + escape(item.name) + '</strong>:' +
                              ' <em>' + escape(item.description) + '</em>' +
                              ' (by ' + escape(item.username) + ')' +
                              '<ul>' +
                              (item.language ? '<li>' + escape(item.language) + '</li>' : '') +
                              '<li><span>' + escape(item.watchers) + '</span> watchers</li>' +
                              '<li><span>' + escape(item.forks) + '</span> forks</li>' +
                              '</ul>' +
                              '</div>';
                              }
                              }"),
        score = I("function(search) {
                  var score = this.getScoreFunction(search);
                  return function(item) {
                  return score(item) * (1 + Math.min(item.watchers / 100, 1));
                  };
        }"),
        load = I("function(query, callback) {
                 if (!query.length) return callback();
                 $.ajax({
                 url: 'https://api.github.com/legacy/repos/search/' + encodeURIComponent(query),
                 type: 'GET',
                 error: function() {
                 callback();
                 },
                 success: function(res) {
                 callback(res.repositories.slice(0, 10));
                 }
                 });
        }")
      )),
      helpText('If the above searching fails, it is probably the Github API limit
               has been reached (5 per minute). You can try later.'),
      verbatimTextOutput('github')
      )
                 )
                 )
  )
)