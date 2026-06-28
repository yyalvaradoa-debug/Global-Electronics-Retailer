/* =====================================================================
   GOAL 3 — Identify Trends Over Time (Customer Behavior)
   Author: Jose Alfaro
   Project: Global Electronics Retailer — Sales and Revenue Trends 2024
   Focus : Analyze customer demographics, geographic distribution,
           seasonal sales patterns, and year-over-year growth.
   ===================================================================== */


/* ---------------------------------------------------------------------
   Query 1: Customer Distribution by Country
   Counts total customers per country to identify the company's
   strongest international markets.
   --------------------------------------------------------------------- */
SELECT
    Country,
    COUNT(CustomerKey) AS TotalCustomers
FROM Customers
GROUP BY Country
ORDER BY TotalCustomers DESC;


/* ---------------------------------------------------------------------
   Query 2: Average Customer Age
   Uses DATEDIFF on the Birthday column to compute each customer's
   age, then averages across the customer base.
   --------------------------------------------------------------------- */
SELECT
    AVG(DATEDIFF(YEAR, CAST(Birthday AS DATE), GETDATE())) AS AverageAge
FROM Customers
WHERE Birthday IS NOT NULL;


/* ---------------------------------------------------------------------
   Query 3: Monthly Sales Trend
   Aggregates total units sold by calendar month to reveal seasonal
   peaks and slow periods across the year.
   --------------------------------------------------------------------- */
SELECT
    MONTH(CAST(OrderDate AS DATE)) AS SaleMonth,
    DATENAME(MONTH, CAST(OrderDate AS DATE)) AS MonthName,
    SUM(Quantity) AS TotalUnitsSold
FROM Sales
GROUP BY
    MONTH(CAST(OrderDate AS DATE)),
    DATENAME(MONTH, CAST(OrderDate AS DATE))
ORDER BY SaleMonth;


/* ---------------------------------------------------------------------
   Query 4: Year-over-Year Sales Growth
   Rolls up total units sold per calendar year to test whether the
   business is growing, flat, or declining over time.
   --------------------------------------------------------------------- */
SELECT
    YEAR(CAST(OrderDate AS DATE)) AS SaleYear,
    SUM(Quantity) AS TotalUnitsSold
FROM Sales
GROUP BY YEAR(CAST(OrderDate AS DATE))
ORDER BY SaleYear;
