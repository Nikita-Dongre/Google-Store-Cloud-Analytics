-- Query 5: Monthly Revenue Trend
-- How does revenue change month over month?
SELECT
  SUBSTR(date, 1, 6) AS month,
  COUNT(*) AS sessions,
  SUM(totals.transactionRevenue) / 1e6 AS monthly_revenue_usd,
  SUM(totals.transactions) AS total_transactions,
  ROUND(SUM(totals.transactionRevenue) / 1e6 / SUM(totals.transactions), 2) AS avg_order_value
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
  AND totals.transactionRevenue IS NOT NULL
GROUP BY month
ORDER BY month;