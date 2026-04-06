-- Query 7: Top Traffic Sources Driving Revenue
-- Which specific sources bring in the most money?
SELECT
  trafficSource.source,
  trafficSource.medium,
  COUNT(*) AS sessions,
  SUM(totals.transactionRevenue) / 1e6 AS total_revenue_usd,
  ROUND(SUM(totals.transactionRevenue) / 1e6 / COUNT(*) * 1000, 2) AS revenue_per_1000_sessions
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY trafficSource.source, trafficSource.medium
HAVING total_revenue_usd > 0
ORDER BY total_revenue_usd DESC
LIMIT 15;