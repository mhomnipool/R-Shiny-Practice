#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#



#interactive leaflet map
function (input, output, session){
    
    output$storemap = renderLeaflet({
        leaflet(SB_loc) %>% addTiles('http://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png',
                                    attribution='Map tiles by <a href="http://stamen.com">Stamen Design</a>, 
                                    <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; 
                                    Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>') %>% 
            setView(-98.483330, 38.712046, zoom = 4) %>% 
            addCircleMarkers(~Longitude, ~Latitude, popup=popup_content,
                             weight = 3, radius=2, color="#ffffff", stroke = F, fillOpacity = 0.8)  %>%
            addLegend("bottomleft", colors= "#ffffff", labels="Starbucks Stores")
            
    })
    
    popup_content = paste0("Starbucks ", "#", SB_w_income$Store.Number, "<br/>",
                           SB_w_income$Street.Address, "<br/>",
                           SB_w_income$City, ", ", SB_w_income$State, " ",
                           strtrim(as.character(SB_w_income$Postcode), 5),"<br/>",
                           "<br/>",
                           SB_w_income$State, 
                           " Discretionary Income: ",paste("$",format(SB_w_income$Income.Per.Capita, 
                                                     big.mark=","),'/y',sep=""), "<br/>",
                           SB_w_income$comp.statement, "<br/>",
                           "(adjusted for cost of living)")
    
    
    
}