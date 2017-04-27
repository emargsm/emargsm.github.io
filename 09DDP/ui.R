# ---
# title: "Geographical distribution of @dogwatisaw drawings, ui.R"
# subtitle: "Week 4 project for Developing Data Products"
# author: "Marguerite Smith"
# date: 23 April 2017
# ---

library(shiny)
library(leaflet)

shinyUI(
      fluidPage(
            titlePanel("Dogs wat @dogswatisaw saw"),
            fluidRow(
            sidebarLayout(
                 sidebarPanel(
                       sliderInput("numTweets",
                                   label="How many tweets to display?",
                                   min = 1,
                                   max = 90,
                                   value = 30),
                       submitButton("Map the pups!")
                  ),
                        mainPanel(leafletOutput('puppers', height = 350))
            )),
            hr(),
            fluidRow(
                  column(12,
                         div(HTML(
                         "<h2>Mapping tweets using Leaflet</h2>
                         <p>This page provides a simple interface to map tweets from
                           the Twitter user <a href='https://www.twitter.com/dogwatisaw/'>@dogwatisaw</a>.</p>
                         <p><h4>To use this page</h4> Move the slider under \"How many tweets to display\" to the desired value.
                           Press \"Map the pups!\" to map a new selection of tweets.<br/>
                           You can then zoom in or out on the map, including clicking on a marker cluster. When you get to the level of individual markers, you can click on a marker to see the tweet for that location.<br/>
                           If desired, you can also click on the link in the popup to show the original tweet and image.</p>
                         <p/><hr/>
                         <h4>How it works</h4>
                         <p>This page uses a pre-santized CSV file containing 91 tweets from @dogwatisaw.
                         <br/>The CSV was produced using the following steps:
                               <ol>
                                  <li>Use the Twitter search API to get up to 500 tweets from @dogwatisaw which are not retweets or replies</li>
                                  <li>Discard all tweets which do not contain the string \"https://t.co/\", which indicates that there is an image in the tweet</li>
                                  <li>Use Twitter's publishing API to get the embed code for each remaining tweet and store it in the column \"popups\"</li>
                                  <li>Use gsub() to pull out the location as written by the user, e.g. Kungportsplatsen</li>
                                  <li>Use geocode() with Google Maps to determine the latitude and longitude of each location, and store them in \"latitude\" and \"longitude\", respectively.</li>
                               </ol>
                        <br/>Once the CSV file is complete, the map is generated as follows:
                                  <ol>
                                  <li>Read in from the Shiny app how many tweets the user wants to display. Call this number <em>N</em>.
                                      <br>The initial default for <em>N</em> is 30.
                                      <br>Do not redraw the map until the user presses the submit button.</li>
                                  <li>Select <em>N</em> random tweets from the CSV without replacements.</li>
                                  <li>Use leaflet to render a map of the tweets, with the following characteristics:
                                       <ul><li>Use clustering</li>
                                           <li>Use \"latitude\" and \"longitude\" to determine where the markers go</li>
                                           <li>Use \"popups\" as the body of the marker popup.</li>
                                       </ul>
                                  </ol></p>"))
                         )
            )
      )
)
