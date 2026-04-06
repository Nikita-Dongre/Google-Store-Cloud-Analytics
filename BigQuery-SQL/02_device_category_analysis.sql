SELECT
  device.deviceCategory,
  COUNT(*) AS sessions,
  COUNT(DISTINCT fullVisitorId) AS unique_visitors,
  SUM(totals.transactionRevenue) / 1e6 AS total_revenue_usd,
  ROUND(SUM(totals.transactionRevenue) / 1e6 / COUNT(*), 4) AS revenue_per_session
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY device.deviceCategory
ORDER BY total_revenue_usd DESC;