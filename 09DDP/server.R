# ---
# title: "Geographical distribution of @dogwatisaw drawings, server.R"
# subtitle: "Week 4 project for Developing Data Products"
# author: "Marguerite Smith"
# date: 27 April 2017
# ---

require(shiny)
require(data.table)
require(leaflet)

tweets <- as.data.frame(read.csv("tweets_big.csv"))


shinyServer(function(input, output) {

  output$puppers <- renderLeaflet({
        display <- tweets[sample(nrow(tweets), input$numTweets),]
        puppers_popups <- display[,"popups"]
        puppers_latlong <- display[,c("latitude","longitude")]


        p <-
              puppers_latlong %>%
              leaflet() %>%
              setView(lat = 57.6987865, lng = 11.9745282, zoom=4) %>%
              addTiles() %>%
              addMarkers(popup = puppers_popups,
                         clusterOptions = markerClusterOptions())

        return(p)
        })

})
