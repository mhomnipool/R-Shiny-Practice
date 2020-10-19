
function (input, output, session){
    
    #interactive leaflet map
    
    output$storemap = renderLeaflet({
        leaflet(SB_loc) %>% addProviderTiles(provider = providers$CartoDB.Positron) %>% 
            setView(-98.483330, 38.712046, zoom = 4) %>% 
            addCircleMarkers(~Longitude, ~Latitude, popup=popup_content,
                             weight = 3, radius=2, color="#3d9949", stroke = F, fillOpacity = 0.8)  %>%
            addLegend("bottomleft", colors= "#3d9949", labels="Starbucks Stores")
            
    })
    
    popup_content = paste0("Starbucks ", "#", SB_w_income$Store.Number, "<br/>",
                           SB_w_income$Street.Address, "<br/>",
                           SB_w_income$City, ", ", SB_w_income$State, " ",
                           strtrim(as.character(SB_w_income$Postcode), 5),"<br/>",
                           "<br/>",
                           "Disposable Income:  ", SB_w_income$comp.statement.inc, "<br/>",
                           "(adjusted for cost of living)", "<br/>",
                           "<br/>",
                           "Spending: ", SB_w_income$comp.statement.spending)
    #Histograms
    
    output$hist_stores = renderPlot(hist(SB_w_income$Count, breaks=20, main = "Distribution of 
                                         Stores per State"))
    
    output$hist_inc = renderPlot(hist(SB_w_income$Income.Per.Capita, breaks=20, main = 
                                          "Distribution of Disposable Income per Capita"))
    
    output$hist_spend = renderPlot(hist(SB_w_income$Spending, breaks=20, main = "Distribution 
                                        of Consumer Spending"))
    #Scatterplots
    
    output$store_v_inc = renderPlot(
        ggplot(SB_w_income, aes(Count,Income.Per.Capita)) + geom_point() +  geom_smooth(color='#3d9949') 
        + ggtitle("Store Count vs Disposable Income by State") + ylab("Disposable Income per Capita") 
        + xlab("Store Count"))
    
    output$store_v_spend = renderPlot(ggplot(SB_w_income, aes(Spending, Count)) + geom_point() + 
                                          geom_smooth(color='#3d9949'))

}