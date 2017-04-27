---
title       : "Doggo Mappo"
subtitle    : "Developing Data Products, Week 4"
author      : "Marguerite Smith"
job         : ""
framework   : revealjs        # {io2012, html5slides, shower, dzslides, ...}
revealjs    :
      transition: slide
      theme: beige
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [shiny]            # {mathjax, quiz, bootstrap}
ext_widgets : {rCharts: [libraries/leaflet]}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

<style>
.reveal .slides {
    text-align: left;
}
.reveal .slides .content {
    font-size: small;
}
.left {
    float:left;
    width:30%
}
.right {
    float:right;
    width:70%
}

</style>

# Map some doggos!
<div style="float:bottom; width:100%">
<hr/>
<br/>
<h3>Developing Data Products</h3>
<h4>Week 4: Shiny App & Reproducible Pitch</h4>
<hr/>
<div style="float:right;width='100%'">
<small><em>Marguerite Smith</em><br/>
<em>27 April 2017</em></small>
</div>
</div>

---

## Why this app?

Sharing pictures of dogs on the internet is now incredibly popular. Some of the outcomes of this include:
<ul>
<li class="fragment">People, accounts, and groups who rate submitted dogs, like <a href="https://www.twitter.com/dog_rates">We Rate Dogs&trade;</a>
</li>
<li class="fragment">People, accounts, and groups who draw and/or share images of local dogs, as <a href="https://www.twitter.com/dogwatisaw">Dog Wat I Saw</a> does
</li>
<li class="fragment">DoggoLingo, an Internet language that was recently featured in <a href="http://www.npr.org/sections/alltechconsidered/2017/04/23/524514526/dogs-are-doggos-an-internet-language-built-around-love-for-the-puppers">this NPR article</a>
</li></ul>

<p/><p/>

<div class="fragment">
My app for Developing Data Products uses Leaflet to map a set of drawings done by <a href="https://twitter.com/dogwatisaw">@dogwatisaw</a>. 
<p/>

Links:
<ul>
<li><a href="https://emargsm.shinyapps.io/doggomap">Shiny app</a></li>
<li><a href="https://github.com/emargsm/doggomap">server.R and ui.R</a></li>
</ul>
</div>

---

<section>

## The world loves doggos

With the rise in dog pictures on the Internet, it becomes possible to process a variety of information about these "cute puppers", including mapping where they can be found. 

In my Shiny app, I parse and map a pre-cleaned CSV file containing approximately 90 tweets from [@dogwatisaw](https://twitter.com/dogwatisaw/). The user can choose how many tweets to display (*N*), and a random *N* entries are sampled and mapped with Leaflet.

<div style="float:bottom;float:right">
<br/>
<br/>
<br/>
<small>Navigate down to show a sample of ten tweets.</small>
</div>

---

## Sample output

<div class="left">
This is a sample of the output from the application, mapping 10 tweets from the dataset. 

It does not include the app's full UI, which is found <a href="https://emargsm.shinyapps.io/doggomap/">in the application itself</a>.
</div>
<div class="right">

<pre><iframe src="./assets/img/leaflet2.html" width="100%" height="500px" allowtransparency="true"> </iframe></pre>
</div>
</section>

---

## Next steps

In order to extend this and make it more useful, I plan to investigate the following:
- Using the Twitter Search API and appropriate token security, do a live search based on the user's input.
- Filter the data set (and later, the search) by date.
- Fix the character encoding in the popup, so that names like Lindholmsall&eacute;n display properly without manual intervention.
- Troubleshoot the popup embedding, so that the image shows within the map marker and not just a link to the tweet.
