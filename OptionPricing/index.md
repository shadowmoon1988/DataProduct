---
title: Option Pricing
author: Ying Baolong
framework   : revealjs       # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
ext_widgets : {rCharts: ["libraries/highcharts","libraries/nvd3", "libraries/morris", "libraries/leaflet", "libraries/rickshaw","libraries/polycharts"]}
mode        : selfcontained # {standalone, draft}
---

# Coursera Project: Shiny Application and Reproducible Pitch

Ying Baolong


---

## Overview

- This simple application was created to calculate the European Option price.
- This was built as part of a deliverable for the course **Developing Data Products** as part of the Coursera Data Science Specialization.
- Instructions on how to use this application may also be viewed on the left pane of the application.

--- 

## Introduction

- The packages are used in the application
    * `quantmod` to get information from Yahoo! Finance.
    * `RQuantLib` to calculate the price of the European option and the corresponding Greek value.
- The application is intend to 
    * capture the market data of the stock set by user, include close price and divendend from Yahoo
    * set your own strike price, risk-free rate, maturity of option
    * calculate the price of the European Option on the stock and the corresponding Greek Value


--- 

## Data Capture

Here is the example that we capture the stock price of 'AAPL' and shown in `rCharts`:

<iframe src="fig/n1.html" width=100%, height=600></iframe>


--- 

## Application

- The app developed for the first part of the assignment demo is avalilable at: [https://shadowmoon1988.shinyapps.io/European_Option_Calculator/](https://shadowmoon1988.shinyapps.io/European_Option_Calculator/)
- Source code for ui.R and server.R files are available on the GitHub repo: [https://github.com/shadowmoon1988/DataProduct](https://github.com/shadowmoon1988/DataProduct)


