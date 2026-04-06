-- Query 11: Cumulative Monthly Revenue (Running Total)
-- Shows how revenue builds up over time using window functions
WITH monthly_rev AS (
  SELECT
    SUBSTR(date, 1, 6) AS month,
    SUM(totals.transactionRevenue) / 1e6 AS monthly_revenue
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
    AND totals.transactionRevenue IS NOT NULL
  GROUP BY month
)
SELECT
  month,
  monthly_revenue,
  SUM(monthly_revenue) OVER (ORDER BY month) AS cumulative_revenue
FROM monthly_rev
ORDER BY month;