shinyUI(dashboardPage(skin='green',
    dashboardHeader(title = 'Starbucks'),
    dashboardSidebar(sidebarMenu(
        menuItem('Introduction', tabName = 'intro', icon = icon('info-circle')),
        menuItem('US Store Map', tabName = 'stores', icon = icon('globe-americas')),
        menuItem('Income vs Coffee', tabName = 'income', icon = icon('dollar-sign')),
        menuItem('About Me', tabName = 'about', icon = icon('user-circle'))
    )),
    dashboardBody(tabItems(
        tabItem(tabName = 'intro',
                fluidPage(
                    fluidRow(column(offset = 2, width = 8, align = 'center', h1(tags$b(tags$u("Starbucks Store Placement"))))),
                ),
                fluidPage(
                    fluidRow(column(offset = 2, width = 8, align = 'center', h3("Income per Capita vs. Expansion in the US"))),
                    
                ),
                br(),
                br(),
                fluidPage(
                    fluidRow(column(offset = 2, width = 8, align = 'left', 
                                    box(width = 12, h2(tags$u(tags$b('Hypothesis'))), background = 'olive',
                                        p("It is easy to theorize that income per capita would have a positive correlation with the 
                                          number of Starbucks stores in a given state, that Starbucks corporate would want to place
                                          stores near populations with higher disposable incomes and refrain from placing stores 
                                          near populations with lower disposable incomes.")
                                        ))),
                )),
        tabItem(tabName = 'stores',
                fluidPage(
                    fluidPage(
                        fluidRow(column(offset = 2, width = 8, align = 'left', h1(tags$b(tags$u("Starbucks Stores in the US"))))),
                    ),
                    br(),
                    br(),
                    fluidPage(
                        fluidRow(column(offset = 2, width = 8, align = 'left', h5("click a store to view store information and discretionary income level"))),
                    ),
                    leafletOutput('storemap', height = 500, width = 800)
                )),
        tabItem(tabName = 'about',
                fluidPage(
                    br(),
                    fluidRow(column(offset = 2, width = 8, align= 'center', img(src = "elbert1.jpg", height = 200))), 
                    br(),
                    br(),
                    fluidRow(column(offset = 2, width = 8, align = 'center',
                                    box(width = 12, h2(tags$u(tags$b('Matthew Harris'))), background = 'olive',
                        p("I graduated with undergraduate degrees in Business Administration and Business Economics in the
                          spring of 2011.  For nearly the next decade, I struggled to find a job that fulfilled both my 
                          interests and curiosity about the world."),
                        br(),
                        p("It's of no great surprise that I ended up back in the world of data modeling, this time,
                          incorporating coding techniques rather than the excel based modeling tools I had used in college. 
                          I am currently studying data science at the New York City Data Science Academy and laying the
                          foundations in R, Python, SQL, and machine learning that will allow me to pursue a career in 
                          data science in the coming year."),
                        br(),
                        p("In my spare time, I frequent the gym, and as a resident of Denver, I am looking forward to
                          once again being too busy for snowboarding this winter season."),
                        br(),
                        br(),
                    ))
                        
                    )
                    
                ))
    ))
))
