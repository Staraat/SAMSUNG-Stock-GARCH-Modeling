# Volatility Modeling using GARCH in R (Samsung Stock)

This project demonstrates a GARCH-based time series volatility modeling workflow using R. 
We apply it to the adjusted closing prices of **Samsung Electronics Co., Ltd.** (Ticker: 005930.KS) for the period **April 1, 2024 to April 30, 2025**.
Data retrieved from Yahoo Finance.

---

## Project Overview

The objective of this project is to:
- Scrape historical stock price data
- Check for ARCH effects
- Fit a GARCH(1,0) model to forecast volatility
- Evaluate model diagnostics and residual behavior

---

## Tools & Libraries

- **R** programming language
- `quantmod` – for web scraping financial time series
- `forecast` – for ARIMA modeling
- `FinTS` – for ARCH testing
- `rugarch` – for GARCH model specification and fitting

---

## Methodology

1. **Data Collection**:
   - Retrieved Samsung Electronics stock data using `quantmod::getSymbols()` from Yahoo Finance.
   
2. **Data Preprocessing**:
   - Used the adjusted close price.
   - Differenced data to obtain return series for volatility modeling.

3. **Model Evaluation**:
   - Fit ARIMA model to the raw and differenced data.
   - Conducted residual diagnostics.
   - Performed ARCH test to justify GARCH modeling.

4. **GARCH Modeling**:
   - Modeled with `sGARCH(1,0)` and mean model `ARFIMA(1,0,1)` using Student's t-distribution.
   - Estimated parameters and tested model significance.
   - Performed Sign Bias, ARCH LM, and stability tests.

---

## Key Findings

- The **GARCH(1,0)** model showed strong volatility clustering in Samsung stock returns.
- **Log-likelihood**: -2269.43 with AIC = 17.37
- **Parameter Significance**: Most GARCH and ARMA parameters were significant.
- **ARCH LM Tests** showed **no remaining ARCH effects**, indicating good model fit.
- **Sign Bias Test** indicated significant negative and positive sign bias, implying some asymmetry in residuals.
- The **Nyblom stability test** suggests parameter instability (especially omega and alpha1), which may hint at structural changes in volatility behavior.

---
