library(quantmod)
symbol <- "005930.KS"
start_date <- "2024-04-01"
end_date <- "2025-04-30"
getSymbols(symbol, src = "yahoo", from = start_date, to = end_date)

samsung <- get('005930.KS')
samsung
samsung <-ts(samsung$'005930.KS.Adjusted')
plot(samsung)

#Check Model
library(forecast)
tsdisplay(samsung)
auto.arima(samsung)
arima_samsung <- Arima(samsung, order=c(0,1,0))
checkresiduals(arima_samsung)
tsdisplay(diff(samsung))

#to show pacf plot for arch modeling 
tsdisplay(arima_samsung$residuals)
tsdisplay(arima_samsung$residuals^2)

#volatile Models use return values instead of original value 
samsung_rTS <- diff(samsung)   #this step is to find the return value, we cannot use ori value for ARCH/GARCH
library(FinTS)   #test for ARCH effect
ArchTest(samsung) #for ori data
ArchTest(samsung_rTS)
tsdisplay(samsung_rTS)

#proceed to ARCH modeling
install.packages("rugarch")
library(rugarch)
garchSpec <- ugarchspec(variance.model=list(model="sGARCH", garchOrder= c(1,0)),mean.model=list(arma0rder=c(0,0)), distribution.model="std")
garchFit_ARCH <-ugarchfit(spec=garchSpec, data=samsung_rTS)
garchFit_ARCH
