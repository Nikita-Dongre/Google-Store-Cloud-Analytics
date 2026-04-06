-- Query 6: Revenue by Day of Week
-- Which days generate the most revenue?
SELECT
  FORMAT_DATE('%A', PARSE_DATE('%Y%m%d', date)) AS day_of_week,
  EXTRACT(DAYOFWEEK FROM PARSE_DATE('%Y%m%d', date)) AS day_num,
  COUNT(*) AS sessions,
  SUM(totals.transactionRevenue) / 1e6 AS total_revenue_usd,
  SUM(totals.transactions) AS total_transactions
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
GROUP BY day_of_week, day_num
ORDER BY day_num;