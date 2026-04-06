-- Query 10: Bounce Rate by Channel
-- Which channels have the highest bounce rates?
SELECT
  channelGrouping,
  COUNT(*) AS sessions,
  SUM(CASE WHEN totals.bounces = 1 THEN 1 ELSE 0 END) AS bounced_sessions,
  ROUND(SUM(CASE WHEN totals.bounces = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS bounce_rate_pct,
  ROUND(AVG(totals.pageviews), 1) AS avg_pageviews
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY channelGrouping
ORDER BY bounce_rate_pct DESC;