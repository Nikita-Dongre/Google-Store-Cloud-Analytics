-- Query 1: Dataset Overview
-- Total sessions, unique visitors, date range, and total revenue
SELECT
  COUNT(*) AS total_sessions,
  COUNT(DISTINCT fullVisitorId) AS unique_visitors,
  MIN(date) AS first_date,
  MAX(date) AS last_date,
  SUM(totals.transactionRevenue) / 1e6 AS total_revenue_usd,
  SUM(totals.transactions) AS total_transactions
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801';

