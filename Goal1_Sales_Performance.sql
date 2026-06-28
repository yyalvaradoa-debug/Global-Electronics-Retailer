/* =====================================================================
   GOAL 1 — Identify and Understand Sales Performance
   Author: Yisel Alvarado Ayala
   Project: Global Electronics Retailer — Sales and Revenue Trends 2024
   Focus : Identify high-margin vs. high-volume products, find profit
           drivers, and detect products that sell a lot but don't earn.
   ===================================================================== */


/* ---------------------------------------------------------------------
   Query 1: Top 5 products with high total sales but LOW profit margin
   (under 50%). Surfaces "workhorse" products that move volume but
   underperform on profitability.
   --------------------------------------------------------------------- */
SELECT TOP 5
       p.ProductName,
       SUM(s.Quantity * p.UnitPriceUSD) AS TotalRevenue,
       (SUM(s.Quantity * p.UnitPriceUSD) - SUM(s.Quantity * p.UnitCostUSD))
           / SUM(s.Quantity * p.UnitPriceUSD) AS MarginPercent
FROM Sales s
JOIN Products p ON s.ProductKey = p.ProductKey
GROUP BY p.ProductName
HAVING (SUM(s.Quantity * p.UnitPriceUSD) - SUM(s.Quantity * p.UnitCostUSD))
           / SUM(s.Quantity * p.UnitPriceUSD) < 0.50
ORDER BY TotalRevenue DESC;


/* ---------------------------------------------------------------------
   Query 2: Which product category earns us the most profit per unit
   sold? Compares average profit-per-unit across categories.
   --------------------------------------------------------------------- */
SELECT p.Category,
       COUNT(s.ProductKey) AS UnitsSold,
       AVG(p.UnitPriceUSD - p.UnitCostUSD) AS AvgProfitPerUnit
FROM Sales s
JOIN Products p ON s.ProductKey = p.ProductKey
GROUP BY p.Category
ORDER BY AvgProfitPerUnit DESC;


/* ---------------------------------------------------------------------
   Query 3: "Silent killers" — products that sell in high volume but
   rank poorly on profit. Uses a CTE with RANK() to compare quantity
   rank vs. profit rank for every product.
   --------------------------------------------------------------------- */
WITH ProductMetrics AS (
    SELECT p.ProductName,
           SUM(s.Quantity) AS TotalQty,
           SUM(s.Quantity * (p.UnitPriceUSD - p.UnitCostUSD)) AS TotalProfit,
           RANK() OVER (ORDER BY SUM(s.Quantity) DESC) AS QtyRank,
           RANK() OVER (ORDER BY SUM(s.Quantity * (p.UnitPriceUSD - p.UnitCostUSD)) DESC) AS ProfitRank
    FROM Sales s
    JOIN Products p ON s.ProductKey = p.ProductKey
    GROUP BY p.ProductName
)
SELECT ProductName,
       TotalQty,
       TotalProfit,
       QtyRank,
       ProfitRank
FROM ProductMetrics
WHERE QtyRank <= 10
  AND ProfitRank > 20;


/* ---------------------------------------------------------------------
   Query 4: Which high-revenue products take the LONGEST to deliver?
   Helps the logistics team identify profitable-but-slow SKUs.
   --------------------------------------------------------------------- */
SELECT TOP 10
       p.ProductName,
       SUM(s.Quantity * p.UnitPriceUSD) AS TotalRevenue,
       AVG(DATEDIFF(day, s.OrderDate, s.DeliveryDate)) AS AvgDeliveryDays
FROM Sales s
JOIN Products p ON s.ProductKey = p.ProductKey
WHERE s.DeliveryDate IS NOT NULL
GROUP BY p.ProductName
ORDER BY AvgDeliveryDays DESC;
