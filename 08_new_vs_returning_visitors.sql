-- Query 8: New vs Returning Visitors
-- Who spends more – first-time or repeat visitors?
SELECT
  CASE WHEN totals.newVisits = 1 THEN 'New Visitor' ELSE 'Returning Visitor' END AS visitor_type,
  COUNT(*) AS sessions,
  COUNT(DISTINCT fullVisitorId) AS unique_visitors,
  SUM(totals.transactionRevenue) / 1e6 AS total_revenue_usd,
  ROUND(SUM(totals.transactionRevenue) / 1e6 / COUNT(DISTINCT fullVisitorId), 2) AS revenue_per_user,
  ROUND(SUM(IF(totals.transactions > 0, 1, 0)) / COUNT(*) * 100, 2) AS conversion_rate_pct
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY visitor_type;