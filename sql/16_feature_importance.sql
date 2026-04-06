-- Query 16: Feature Importance
-- Which factors most influence whether a customer will purchase?
SELECT
  *
FROM ML.WEIGHTS(MODEL `analytics.purchase_predictor`)
ORDER BY ABS(weight) DESC;