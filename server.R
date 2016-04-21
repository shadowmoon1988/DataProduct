library(shiny)
library(RQuantLib)
library(quantmod)

vol = function(ts){
    r=diff(log(ts))[-1]
    vol = sd(r)*sqrt(252)
    return(vol)
}

divrate = function(ts,close){
    return(log(prod(1+ts/close)))
}

shinyServer(
    function(input, output) {
        
        StockPrice <- reactive({
            getSymbols(input$symb, src = "yahoo", 
                       from = Sys.Date()-365,
                       to = Sys.Date(),
                       auto.assign = FALSE)
        })
        
        div <- reactive({
            getDividends(input$symb , src ="yahoo",
                         from = Sys.Date()-365,
                         to = Sys.Date())
        })
        
        price<- reactive({StockPrice()[dim(StockPrice())[1],4]})
        
        option <- reactive({
                EuropeanOption(input$type,price(),input$strike,divrate(div(),price()),input$riskfreerate, input$maturity/360,vol(StockPrice()[,4]))
        })

        output$value <- renderPrint({option()$value})
        output$delta <- renderPrint({option()$delta})
        output$gamma <- renderPrint({option()$gamma})
        output$vega  <- renderPrint({option()$vega})
        output$theta <- renderPrint({option()$theta})
        output$rho   <- renderPrint({option()$rho})
        output$dividendRho <- renderPrint({option()$divRho})
        
        output$plot <- renderPlot({    
            chartSeries(StockPrice(), theme = chartTheme("white"), 
                        type = "line", log.scale = FALSE, TA = NULL)
        })
    }
)