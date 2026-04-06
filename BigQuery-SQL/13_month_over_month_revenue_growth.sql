-- Query 13: Month-over-Month Revenue Growth
-- Uses LAG() window function to compare each month vs previous month
WITH monthly_rev AS (
  SELECT
    SUBSTR(date, 1, 6) AS month,
    SUM(totals.transactionRevenue) / 1e6 AS revenue
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
    AND totals.transactionRevenue IS NOT NULL
  GROUP BY month
)
SELECT
  month,
  revenue,
  LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
  ROUND((revenue - LAG(revenue) OVER (ORDER BY month)) / LAG(revenue) OVER (ORDER BY month) * 100, 2) AS mom_growth_pct
FROM monthly_rev
ORDER BY month;