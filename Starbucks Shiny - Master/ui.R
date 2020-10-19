
shinyUI(dashboardPage(skin='green',
    dashboardHeader(title = 'Starbucks'),
    dashboardSidebar(sidebarMenu(
        menuItem('Introduction', tabName = 'intro', icon = icon('info-circle')),
        menuItem('US Store Map', tabName = 'stores', icon = icon('globe-americas')),
        menuItem('Analysis', tabName = 'analysis', icon = icon('dollar-sign')),
        menuItem('About Me', tabName = 'about', icon = icon('user-circle'))
    )),
    dashboardBody(tabItems(
        
        #Introduction tab
        
        tabItem(tabName = 'intro',
                fluidPage(
                    fluidRow(
                        column(offset = 2, width = 8, box(width = 12, align = 'center', background = 'olive', h1(tags$b(tags$u("Starbucks Store Placement"))))),
                        column(offset = 2, width = 8, align = 'center', h3("What are the Factors for Expansion in the US?"))),
                    br(),
                    br(),
                    fluidRow(
                        column(width = 6, box(width = 12, background = 'black',
                                              img(src = "beans2.jpg", height = 170), align = 'center')),
                        column(width = 6, box(width = 12, h2(tags$u(tags$b('Hypothesis'))), background = 'olive',
                                              p("It is easy to theorize that income per capita would have a positive correlation with the
                                          number of Starbucks stores in a given state, that Starbucks corporate would want to place
                                          stores near populations with higher disposable incomes and refrain from placing stores
                                          near populations with lower disposable incomes.")))),
                    fluidRow(
                        column(width = 6, box(width =12, h2(tags$u(tags$b('Analysis'))), background = 'olive',
                                              p("A simple comparison of disposable income per capita and the number of Starbucks stores in
                                                a given state revealed very little correlation. I thus expanded my dataset to
                                                include consumer spending, thinking that perhaps individuals that are used to a high cost of
                                                living might be more inclined to spend a greater percentage of their disposable income on coffee.
                                                Additionally, I hoped to capture some measure of spending related to travel, as Starbucks
                                                could easily attract travelers due to name recognition and consistency of product. As I hoped,
                                                consumer spending showed a strong positive correlation with the number of stores"))),
                        column(width = 6, box(width = 12, background = 'black',
                                              img(src = "grounds3.jpg", height = 225), align = 'center'))),
                    fluidRow(
                        column(width = 6, box(width = 12, background = 'black',
                                              img(src = "coffee.jpg", height = 255), align = 'center')),
                        column(width = 6, box(width = 12, h2(tags$u(tags$b('Conclusions'))), background = 'olive', 
                                              p("Perhaps in Starbucks' infancy, before they were a household name, it may have been preferable to
                                                place stores in affluent areas.  However, Starbucks coffee has become part of a daily routine for thousands
                                                of Americans, and something that travelers can rely on. Could Starbucks' proliferation could have shifted
                                                its store placement strategy to target consumer spending rather than disposable income?  Was disposable income
                                                ever a factor?  Possible avenues for future research would be to include the dates of store openings in the 
                                                US or to compare US data with emerging Starbucks markets in order to answer these questions.")))
                        
                    )
                        )
                    
                ),
        
        #Store map tab
        
        tabItem(tabName = 'stores',
                fluidPage(
                    fluidRow(
                        column(offset = 2, width = 8, box(width = 12, background = 'olive', align = 'center', h1(tags$b(tags$u("Starbucks Stores in the US")))))),
                    br(),
                    fluidRow(
                        column(offset = 2, width = 8, align = 'center', h5("click a store for store information and relevant state data"))),
                        column(width = 12, box(width = 12, background = 'olive', align = 'center', leafletOutput('storemap', height = 500, width = 800)))
                )),
        
        #Analysis tab

        tabItem(tabName = 'analysis',
                fluidPage(
                    fluidRow(
                        column(offset = 2, width = 8, box(width = 12, background = 'olive', align = 'center', h1(tags$u(tags$b("Starbucks Stores per State")))))),
                    fluidRow(    
                        column(offset = 0, width = 4, h4("Distributions"))),
                        br(),
                    fluidRow(    
                        tabBox(width = 6,
                               tabPanel("Stores", plotOutput("hist_stores")),
                               tabPanel("Income", plotOutput("hist_inc")),
                               tabPanel("Spending", plotOutput("hist_spend"))),
                        box(width = 6, p("In first looking at the distribution of the stores per state, I noted that the bulk
                                         of states have 500 or fewer stores. In addition, note that Califoria is responsible
                                         for the spike at the end, with over 2,800 stores."),
                                       br(),
                                       p("The income per capita data was obtained from the Tax Foundation and represents 
                                       disposable income corrected for cost of living. The popouts on the map page will reflect
                                         this correction as a comparison to the national average. Of note is that once cost of
                                         living is adjusted for, the range of disposable incomes reported by states is not very great."),
                                       br(),
                                       p("Finally, the consumer spending data was obtained from the BEA and represents gross revenue
                                         attributable to consumer spending, measured in millions of dollars. This data was not adjusted
                                         for cost of living.")),
                        br()),
                    fluidRow(
                        column(offset = 0, width = 4, h4("Scatter Plots"))),
                    br(),
                    fluidRow(
                        tabBox(width = 6,
                               tabPanel("vs Income", plotOutput("store_v_inc")),
                               tabPanel("vs Spending", plotOutput("store_v_spend"))),
                        box(width = 6, p("In clicking through a few of the map locations using the leaflet tool, I initially suspected that the number of stores
                                         in a given state would be quite positively correlated with disposable income, as many of the locations
                                         that I inspected seemed to reflect my hypothesis: states with few stores seemed to
                                         have a disposable income below the national average, and vic versa. However, as shown in the scatter plot comparing
                                         stores and income, this is hardly the case.  There is very little correlation whatsoever between
                                         these variables."),
                                       br(),
                                       p("However, when adjusting my analysis to reflect consumer spending, the correlation that I was searching
                                         for is evident.  Note that during this analysis, I did momentarily adjust for outliers, however, the
                                         results remained virtually unchanged.  All of the graphs reflected on this page are complete."))
                    )
                    
                )),
        
        #About me tab
        
        tabItem(tabName = 'about',
                fluidPage(
                    fluidRow(column(offset = 2, width = 8, box(width = 12, background = 'olive', align = 'center', h1(tags$b(tags$u("About Me")))))),
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
