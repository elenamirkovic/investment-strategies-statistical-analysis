# Testing Investment Strategies in Financial Markets

### A Statistical Comparison of Momentum and Mean Reversion Strategies

**Authors:** Elena Mirković & Mila Milenić  
**Institution:** Faculty of Mathematics, University of Belgrade  
**Course:** Introduction to Statistics  
**Year:** 2026

## Project Overview

This project investigates the performance of two investment strategies, **Momentum** and **Mean Reversion**, across financial markets with different levels of volatility.

The main objective is to determine whether either strategy achieves statistically significantly higher daily logarithmic returns under stable or volatile market conditions.

The analysis combines financial time-series data, trading signal generation, descriptive statistics, and statistical hypothesis testing.

## Financial Markets Analyzed

Six financial instruments were examined:

**Stable markets:**
- S&P 500 Index
- Gold (GLD)
- EUR/USD

**Volatile markets:**
- Tesla (TSLA)
- Nvidia (NVDA)
- Bitcoin (BTC)

Historical market data was obtained from Yahoo Finance.

## Methodology

The analysis was conducted in **R** and included:

1. Retrieving and processing historical financial data.
2. Calculating daily logarithmic returns.
3. Measuring market volatility using rolling windows.
4. Generating trading signals for Momentum and Mean Reversion strategies.
5. Computing descriptive statistics and visualizing return distributions.
6. Testing hypotheses using parametric and non-parametric methods.

The statistical tests included:

- Welch's t-test
- Mann–Whitney U test
- Paired t-test
- Wilcoxon signed-rank test

The significance level was set at α = 0.05.

## Key Findings

The analysis did not identify a statistically significant performance advantage of either strategy across the examined market conditions.

The findings suggest that market volatility alone is insufficient to establish which of the two strategies will perform better.

These conclusions are limited to the selected financial instruments, observation period, and trading rules.

## Tools and Technologies

- **R** — data processing and statistical analysis
- **quantmod** — financial market data retrieval
- **Yahoo Finance** — historical financial data
- **Statistical hypothesis testing** — strategy performance evaluation
- **Data visualization** — distribution and descriptive analysis

## Project Report

The complete academic report, including theoretical background, methodology, statistical results, and conclusions, is available in the `report/` directory.

*The report is written in Serbian.*

## Authors

**Elena Mirković & Mila Milenić**  
Faculty of Mathematics, University of Belgrade

Academic project completed in June 2026.
