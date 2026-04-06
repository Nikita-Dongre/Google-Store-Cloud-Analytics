-- Query 17: Predict Purchases on New Data (Apr-Aug 2017)
-- Uses the trained model to predict which visitors will purchase
SELECT
  fullVisitorId,
  predicted_will_purchase,
  predicted_will_purchase_probs
FROM ML.PREDICT(MODEL `analytics.purchase_predictor`,
  (SELECT
    fullVisitorId,
    IFNULL(totals.visits, 0) AS visits,
    IFNULL(totals.hits, 0) AS hits,
    IFNULL(totals.pageviews, 0) AS pageviews,
    IFNULL(totals.bounces, 0) AS bounces,
    IFNULL(totals.timeOnSite, 0) AS time_on_site,
    channelGrouping,
    device.deviceCategory,
    geoNetwork.country,
    trafficSource.medium
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE _TABLE_SUFFIX BETWEEN '20170401' AND '20170801')
)
LIMIT 20;