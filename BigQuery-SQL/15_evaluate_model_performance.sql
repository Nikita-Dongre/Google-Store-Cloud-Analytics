-- Query 15: Evaluate Model Performance
-- Shows accuracy, precision, recall, F1 score, and ROC AUC
SELECT
  *
FROM ML.EVALUATE(MODEL `analytics.purchase_predictor`);