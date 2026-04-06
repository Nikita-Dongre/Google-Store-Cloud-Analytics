-- Query 4: Revenue by Traffic Channel
-- Which marketing channels drive the most revenue?
SELECT
  channelGrouping,
  COUNT(*) AS sessions,
  COUNT(DISTINCT fullVisitorId) AS unique_visitors,
  SUM(totals.transactionRevenue) / 1e6 AS total_revenue_usd,
  ROUND(SUM(totals.transactionRevenue) / 1e6 / COUNT(DISTINCT fullVisitorId), 2) AS revenue_per_user
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY channelGrouping
ORDER BY total_revenue_usd DESC;