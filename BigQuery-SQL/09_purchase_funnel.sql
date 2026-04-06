-- Query 9: Purchase Funnel (Visit → Product View → Add to Cart → Purchase)
-- Where do customers drop off in the buying journey?
SELECT
  COUNT(DISTINCT fullVisitorId) AS total_visitors,
  COUNT(DISTINCT CASE WHEN hits.eCommerceAction.action_type = '2' THEN fullVisitorId END) AS product_viewers,
  COUNT(DISTINCT CASE WHEN hits.eCommerceAction.action_type = '3' THEN fullVisitorId END) AS add_to_cart,
  COUNT(DISTINCT CASE WHEN hits.eCommerceAction.action_type = '6' THEN fullVisitorId END) AS purchasers,
  ROUND(COUNT(DISTINCT CASE WHEN hits.eCommerceAction.action_type = '6' THEN fullVisitorId END) /
    COUNT(DISTINCT fullVisitorId) * 100, 2) AS overall_conversion_pct
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801';