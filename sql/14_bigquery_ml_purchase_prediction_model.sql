-- Query 14: BigQuery ML – Train a Purchase Prediction Model
-- Predicts whether a visitor will make a purchase using logistic regression
CREATE OR REPLACE MODEL `analytics.purchase_predictor`
OPTIONS(
  model_type='LOGISTIC_REG',
  input_label_cols=['will_purchase'],
  auto_class_weights=TRUE
) AS
SELECT
  IF(totals.transactionRevenue > 0, 1, 0) AS will_purchase,
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
WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170401';