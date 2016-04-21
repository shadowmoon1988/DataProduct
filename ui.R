library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("European Option Calculator"),
    sidebarPanel(
        helpText("Select a stock to calculate. 
        the data will be collected from yahoo finance."),
        textInput("symb", "Symbol", 'AAPL'),
        helpText("Select the type of option: call or put"),
        selectInput("type","Option Type:",
                    choices = c("call","put"),
                    selected = "call"),
        helpText("Input the Strike price of the Option"),
        numericInput("strike", "Strike Price of the option",100),
        helpText("Set the risk-free rate"),
        numericInput("riskfreerate","Risk-free Rate",0.05,step=0.01),
        helpText("Set maturity of the option"),
        numericInput("maturity","Time to maturity(days)",7),

        submitButton('Submit')
        
    ),
    mainPanel(
        h3("Results of Option Calculation:"),
        h4("Option Value"),
        verbatimTextOutput("value"),
        h4("Delta:"),
        p("Sensitivity of the option value for a change in the underlying"),
        verbatimTextOutput("delta"),
        h4("Gamma: "),
        p("Sensitivity of the option delta for a change in the underlying"),
        verbatimTextOutput("gamma"),
        h4("Vega: "),
        p("Sensitivity of the option value for a change in the underlying's volatility"),
        verbatimTextOutput("vega"),
        h4("Theta: "),
        p("Sensitivity of the option value for a change in t, the remaining time to maturity"),
        verbatimTextOutput("theta"),
        h4("Rho: "),
        p("Sensitivity of the option value for a change in the risk-free interest rate"),
        verbatimTextOutput("rho"),
        h4("Dividend Rho: "),
        p("Sensitivity of the option value for a change in the dividend yield"),
        verbatimTextOutput("dividendRho"),
        h4("Historical price"),
        plotOutput("plot")
    )
))