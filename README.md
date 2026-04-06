# ☁️ Google Store Cloud Analytics & Revenue Prediction

<p align="center">
  <img src="https://img.shields.io/badge/Google%20BigQuery-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white" />
  <img src="https://img.shields.io/badge/BigQuery%20ML-FF6F00?style=for-the-badge&logo=google-cloud&logoColor=white" />
  <img src="https://img.shields.io/badge/Looker%20Studio-4285F4?style=for-the-badge&logo=looker&logoColor=white" />
  <img src="https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=postgresql&logoColor=white" />
</p>

<p align="center">
  <b>End-to-end cloud analytics project analyzing 900K+ real Google Merchandise Store sessions using Google BigQuery, BigQuery ML, and Looker Studio</b>
</p>

---

## 📌 Project Overview

Analyzed **12 months of real customer data** from Google's online merchandise store to uncover revenue drivers, customer behavior patterns, and build a machine learning model that predicts which visitors will make a purchase — **all using SQL in the cloud with zero local infrastructure.**

> **Role:** Data Analyst | **Tools:** Google BigQuery, BigQuery ML, Looker Studio, SQL  
> **Dataset:** 903,653 sessions | 714,167 unique visitors | $1.54M revenue

---

## 🔗 Live Dashboard

👉 **[View Interactive Looker Studio Dashboard](https://lookerstudio.google.com/reporting/d2947218-9dfd-487a-b696-a27f23b3eebd)**

---

## 🔑 Key Findings

| Finding | Impact |
|---------|--------|
| Only **1.3% conversion rate** — 98.7% of visitors leave without buying | Massive opportunity to optimize the purchase funnel |
| **Desktop drives 96% of revenue** ($1.48M) despite being 73% of sessions | Mobile experience needs urgent optimization |
| Desktop revenue per session is **9x higher** than mobile ($2.23 vs $0.24) | Mobile visitors browse but don't buy |
| **Bouncing is the #1 predictor** of not purchasing (weight: -0.493) | Reducing bounce rate = highest ROI action |
| Referral traffic has the **strongest purchase intent** | Expand referral partnerships and programs |
| ML model achieved **93.9% accuracy** and **97.8% ROC AUC** | Can reliably identify potential purchasers |

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **Google BigQuery** | Cloud data warehouse — SQL analysis at scale |
| **BigQuery ML** | Machine learning model using only SQL (logistic regression) |
| **Looker Studio** | Interactive cloud dashboard connected live to BigQuery |
| **SQL** | 17 analytical queries — CTEs, window functions, UNNEST, CASE, JOINs |

---

## 📁 Dataset

| Detail | Info |
|--------|------|
| **Source** | `bigquery-public-data.google_analytics_sample` |
| **Size** | 903,653 sessions across 714,167 unique visitors |
| **Period** | August 2016 — August 2017 (12 months) |
| **Type** | Real Google Merchandise Store customer data |
| **Revenue** | $1,540,071.24 from 12,115 transactions |
| **Fields** | Traffic source, device, geography, revenue, transactions, user behavior |

---

## 📊 Analysis Breakdown

### Phase 1: Data Exploration
| Query | What It Answers |
|-------|----------------|
| `01_dataset_overview.sql` | How big is the dataset? What's the total revenue? |
| `02_revenue_by_device.sql` | Which devices generate the most revenue? |
| `03_top_countries.sql` | Which countries drive the most sales? |

### Phase 2: Revenue & Traffic Analysis
| Query | What It Answers |
|-------|----------------|
| `04_revenue_by_channel.sql` | Which marketing channels are most profitable? |
| `05_monthly_revenue_trend.sql` | How does revenue change month over month? |
| `06_revenue_by_day.sql` | Which days of the week generate the most revenue? |
| `07_top_traffic_sources.sql` | Which specific traffic sources bring in the most money? |

### Phase 3: Customer Behavior
| Query | What It Answers |
|-------|----------------|
| `08_new_vs_returning.sql` | Do new or returning visitors spend more? |
| `09_purchase_funnel.sql` | Where do customers drop off in the buying journey? |
| `10_bounce_rate.sql` | Which channels have the highest bounce rates? |

### Phase 4: Advanced Analysis (Window Functions)
| Query | What It Answers |
|-------|----------------|
| `11_cumulative_revenue.sql` | How does revenue accumulate over time? (Running total) |
| `12_top_products.sql` | Which products generate the most revenue? (RANK) |
| `13_mom_growth.sql` | What's the month-over-month revenue growth? (LAG) |

### Phase 5: Machine Learning
| Query | What It Answers |
|-------|----------------|
| `14_ml_create_model.sql` | Train a purchase prediction model using logistic regression |
| `15_ml_evaluate.sql` | How accurate is the model? |
| `16_feature_importance.sql` | What factors most influence a purchase? |
| `17_purchase_predictions.sql` | Which new visitors are likely to buy? |

---

## 🤖 Machine Learning Results

Built a **logistic regression model** using BigQuery ML to predict whether a visitor will make a purchase.

### Model Performance
| Metric | Value | Meaning |
|--------|-------|---------|
| **Accuracy** | 93.9% | Correctly predicts 94 out of 100 visitors |
| **ROC AUC** | 97.8% | Excellent at distinguishing buyers from non-buyers |
| **Recall** | 93.7% | Catches 94% of actual buyers |
| **Precision** | 16.3% | Expected — only 1.3% of visitors actually buy |
| **Log Loss** | 0.238 | Low = high model confidence |

### Top Purchase Predictors
| Rank | Feature | Weight | Insight |
|------|---------|--------|---------|
| 1 | **Bounces** | -0.493 | Bouncing strongly reduces purchase chance |
| 2 | **Pageviews** | +0.105 | More pages viewed = more likely to buy |
| 3 | **Hits** | +0.059 | More interactions = more likely to buy |
| 4 | **Time on Site** | +0.001 | Slightly positive effect |

---

## 💡 Business Recommendations

1. **Optimize Mobile Experience** — Mobile has 23% of traffic but only 3.2% of revenue. Improving mobile UX could unlock significant revenue growth.

2. **Reduce Bounce Rate** — Bouncing is the #1 predictor of non-purchase. Implement exit-intent popups, improve landing page relevance, and speed up page load times.

3. **Invest in Referral Channels** — Referral traffic shows the strongest purchase intent. Expand referral partnerships and affiliate programs.

4. **Target High-Engagement Visitors** — Visitors with 5+ pageviews are significantly more likely to purchase. Use retargeting campaigns for engaged non-buyers.

5. **Leverage ML Predictions** — Use the purchase prediction model to identify high-intent visitors and target them with personalized offers.

---

## 💡 SQL Skills Demonstrated

- ✅ Common Table Expressions (CTEs)
- ✅ Window Functions — `RANK()`, `LAG()`, cumulative `SUM() OVER()`
- ✅ `UNNEST` for nested/repeated fields (BigQuery-specific)
- ✅ Aggregations with `HAVING`, `CASE`, `IF`
- ✅ BigQuery ML — `CREATE MODEL`, `ML.EVALUATE`, `ML.PREDICT`, `ML.WEIGHTS`
- ✅ Wildcard table queries (`ga_sessions_*` with `_TABLE_SUFFIX`)
- ✅ Date parsing (`PARSE_DATE`, `FORMAT_DATE`, `EXTRACT`)
- ✅ Revenue and funnel metrics calculation

---

## 📂 Project Structure

```
Google-Store-Cloud-Analytics/
├── BigQuery-SQL/                 # 17 SQL analysis queries
│   ├── 01_dataset_overview.sql
│   ├── 02_revenue_by_device.sql
│   ├── 03_top_countries.sql
│   ├── 04_revenue_by_channel.sql
│   ├── 05_monthly_revenue_trend.sql
│   ├── 06_revenue_by_day.sql
│   ├── 07_top_traffic_sources.sql
│   ├── 08_new_vs_returning.sql
│   ├── 09_purchase_funnel.sql
│   ├── 10_bounce_rate.sql
│   ├── 11_cumulative_revenue.sql
│   ├── 12_top_products.sql
│   ├── 13_mom_growth.sql
│   ├── 14_ml_create_model.sql
│   ├── 15_ml_evaluate.sql
│   ├── 16_feature_importance.sql
│   └── 17_purchase_predictions.sql
├── Results-CSV/                  # Query results data
├── Screenshots/                  # Query result screenshots
├── docs/
│   └── business_memo.md          # Executive summary
└── README.md
```

---

## 🤝 Author

**Nikita Dongre**  
📧 nikitadongre1430@gmail.com  
🔗 [LinkedIn](https://linkedin.com/in/YOUR-LINKEDIN)  
💻 [GitHub](https://github.com/Nikita-Dongre)

---

*Built with ☁️ Google Cloud Platform (BigQuery Sandbox — completely free)*
