# Global Electronics Retailer — Sales and Revenue Trends 2016-2020

A comprehensive analysis of sales performance, store performance, and customer trends for the **Global Electronics Retailer**, a fictional global company specializing in electronic devices, home appliances, and technology solutions.

---

## Project Overview

The purpose of this project is to estimate sales performance across the company's global store network and identify trends or patterns throughout the years 2016–2020.

## Team

| Member | Role |
|---|---|
| Yisel Alvarado Ayala | Goal 1 — Sales Performance |
| Daniel Cedeno | Goal 2 — Store Performance |
| Jose Alfaro | Goal 3 — Trends Over Time |

## Analysis Goals

**Goal 1 — Identify and Understand Sales Performance**
Determine which products drive the most "take-home" profit versus which ones just create warehouse activity. Surface high-volume / low-profit items and identify delivery bottlenecks on high-revenue SKUs.

**Goal 2 — Evaluate Store Performance**
Rank stores by total revenue, examine whether store size in square meters correlates with sales, and classify each store as High, Medium, or Low performer using a stored procedure with conditional logic.

**Goal 3 — Identify Trends Over Time**
Analyze customer demographics, geographic distribution, seasonal sales patterns, and year-over-year growth across the global customer base.

---

## Process

1. Downloaded the Global Electronics Retailer dataset from [Maven Analytics](https://mavenanalytics.io/data-playground/global-electronics-retailer)
2. Created an Azure SQL Database using the Azure for Students free tier
3. Created all database tables in Azure SQL using the Query Editor
4. Loaded CSV data into Azure SQL using a custom Python script (`load_data.py`) with the `pyodbc` library and ODBC Driver 17 for SQL Server
5. Exported the completed database as a `.bacpac` file for backup and sharing
6. Connected Azure SQL Database to VS Code using the mssql and DBCode extensions
7. Wrote 12 T-SQL queries across three analysis goals, including joins, CTEs, window functions, subqueries, and a stored procedure with IF/ELSE logic
8. Built visualizations using DBCode's charting feature
9. Collaborated via GitHub with a shared repository

---

## Repository Structure

```
Global-Electronics-Retailer/
├── Database File/
│   └── GlobalElectronicsRetailer.bacpac    Backup of the Azure SQL database
├── SQL/
│   ├── Goal1_Sales_Performance.sql          4 queries — Yisel
│   ├── Goal2_Store_Performance.sql          4 queries + stored procedure — Daniel
│   └── Goal3_Trends_Over_Time.sql           4 queries — Jose
├── Visualizations/
│   ├── Goal1_ProfitPerCategory.png
│   ├── Goal1_SilentKillers.png
│   ├── Goal2_StorePerformanceCategories.png
│   ├── Goal2_StoreRankingsByRevenue.png
│   ├── Goal3_MonthlySalesTrend.png
│   └── Goal3_CustomersByCountry.png
└── README.md
```

---

## Key Findings

**Sales Performance (Goal 1)**
- **Home Appliances** lead average profit per unit sold despite not being the highest-volume category
- Identified 8 "silent killer" products — high sales volume but ranked outside the top 20 on profit
- **Computers** and **Cell phones** sell the most units but rank mid-tier on profitability

**Store Performance (Goal 2)**
- Top revenue stores are concentrated in Canada and the United States
- Store size (square meters) does not strongly correlate with revenue — Wyoming has only 840 sq meters but ranks #14 in total revenue
- **18 stores** are classified as High Performers, **7** as Medium Performers, and **32** as Low Performers
- European stores (France, Netherlands, Germany) consistently underperform compared to North American stores

**Trends Over Time (Goal 3)**
- Sales peak in **January and February**, drop sharply in March and April, then stabilize through the rest of the year with a December uptick
- Customer base is concentrated in a handful of countries
- Year-over-year unit growth shows the business is expanding

---

## Recommendations

1. **Reevaluate pricing on silent-killer products** — their high volume means even small margin improvements compound quickly
2. **Study what makes top-performing stores successful** and apply those lessons to Low Performer locations
3. **Align marketing budget with seasonal peaks** — concentrate promotions around the January/February and December windows
4. **Expand in underserved high-population countries** where the customer count is low relative to market size

---

## Tools & Technologies

- **Azure SQL Database** — cloud-hosted relational database
- **Python (pyodbc)** — CSV data loading into Azure SQL Database
- **VS Code + mssql + DBCode extension** — query development and visualization
- **T-SQL** — all analysis queries, including CTEs, window functions, and stored procedures
- **GitHub** — version control and team collaboration

---

## References

- Dataset: [Maven Analytics — Global Electronics Retailer](https://mavenanalytics.io/data-playground/global-electronics-retailer)
- Azure SQL Database documentation
- DBCode extension for Visual Studio Code
- Google Gemini — assistance with documentation 
- Claude AI - assistance with customizing Python script with the `pyodbc` library to upload CSVs
- Gamma — AI-powered presentation tool used for slide deck creation
