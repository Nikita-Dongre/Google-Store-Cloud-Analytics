SELECT
  geoNetwork.country,
  COUNT(*) AS sessions,
  COUNT(DISTINCT fullVisitorId) AS unique_visitors,
  SUM(totals.transactionRevenue) / 1e6 AS total_revenue_usd,
  SUM(totals.transactions) AS total_transactions
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY geoNetwork.country
HAVING total_revenue_usd > 0
ORDER BY total_revenue_usd DESC
LIMIT 10;