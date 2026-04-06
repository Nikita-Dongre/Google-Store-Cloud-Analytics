-- Query 12: Top Products by Revenue with Rank
-- Which products generate the most revenue? Uses RANK() window function + UNNEST
WITH product_rev AS (
  SELECT
    product.v2ProductName AS product_name,
    SUM(product.productRevenue) / 1e6 AS total_revenue
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
    UNNEST(hits) AS hits,
    UNNEST(hits.product) AS product
  WHERE _TABLE_SUFFIX BETWEEN '20160801' AND '20170801'
    AND product.productRevenue IS NOT NULL
  GROUP BY product_name
)
SELECT
  product_name,
  total_revenue,
  RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank,
  ROUND(total_revenue / SUM(total_revenue) OVER () * 100, 2) AS pct_of_total_revenue
FROM product_rev
ORDER BY total_revenue DESC
LIMIT 15;