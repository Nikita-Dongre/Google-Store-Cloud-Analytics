# Executive Summary: Google Merchandise Store Analytics

**Prepared by:** Nikita Dongre  
**Date:** April 2026  
**Dataset:** 903,653 sessions | August 2016 – August 2017 | Google Merchandise Store

---

## Overview

Analyzed 12 months of Google Merchandise Store customer data (900K+ sessions, 714K+ unique visitors) to identify revenue drivers, customer behavior patterns, and predict future purchases using machine learning — all in Google BigQuery cloud environment.

---

## Key Metrics

| Metric | Value |
|--------|-------|
| **Total Sessions** | 903,653 |
| **Unique Visitors** | 714,167 |
| **Total Revenue** | $1,540,071 |
| **Total Transactions** | 12,115 |
| **Conversion Rate** | 1.3% |
| **Average Order Value** | ~$127 |

---

## Finding 1: Revenue Concentration on Desktop

- Desktop drives **96% of all revenue** ($1.48M) despite being 73% of sessions
- Mobile has 23% of sessions but only **3.2% of revenue** ($49,786)
- Desktop revenue per session ($2.23) is **9x higher** than mobile ($0.24)

**Recommendation:** Prioritize mobile UX optimization. A 50% improvement in mobile conversion could unlock ~$25K+ in additional revenue.

---

## Finding 2: Massive Conversion Opportunity

- Overall conversion rate is only **1.3%** — 98.7% of visitors leave without buying
- The purchase funnel shows significant drop-off at each stage
- Bouncing (leaving after one page) is the **#1 predictor of non-purchase**

**Recommendation:** Implement exit-intent popups, improve landing page relevance, and reduce page load times to decrease bounce rate.

---

## Finding 3: Channel Performance Varies Significantly

- **Referral** traffic generates the most revenue and has the strongest purchase intent
- **Social** and **Affiliates** have the lowest conversion rates
- **Direct** and **Organic Search** drive the most sessions but with lower conversion

**Recommendation:** Increase investment in referral partnerships. Re-evaluate social media and affiliate strategy for ROI.

---

## Finding 4: Geographic Revenue Distribution

- **United States** accounts for **94.3%** of total revenue ($1,452,440)
- **Canada** is a distant second at $32,824
- **222 countries** generated at least some traffic

**Recommendation:** Focus marketing spend on US market. Evaluate top international markets (Canada, Japan) for targeted campaigns.

---

## Finding 5: ML Purchase Prediction Model

Built a logistic regression model using BigQuery ML:

| Metric | Value |
|--------|-------|
| **Accuracy** | 93.9% |
| **ROC AUC** | 97.8% |
| **Recall** | 93.7% |

**Top predictors of purchase:**
1. Not bouncing (staying on the site)
2. Higher pageviews
3. More hit interactions
4. Referral traffic channel

**Recommendation:** Use model predictions to identify high-intent visitors for personalized marketing campaigns and retargeting.

---

## Summary of Recommendations

| Priority | Action | Expected Impact |
|----------|--------|----------------|
| 🔴 High | Optimize mobile experience | Unlock 3-5% revenue growth |
| 🔴 High | Reduce bounce rate | Improve conversion from 1.3% to 2%+ |
| 🟡 Medium | Invest in referral channels | Higher quality traffic with better conversion |
| 🟡 Medium | Target high-engagement visitors | Retarget visitors with 5+ pageviews |
| 🟢 Low | Expand to international markets | Incremental revenue from Canada, Japan |

---

## Tools & Methodology

- **Google BigQuery** — Cloud SQL analysis on 900K+ records
- **BigQuery ML** — Machine learning model built entirely in SQL
- **Looker Studio** — Live interactive dashboard
- **17 SQL queries** covering exploration, revenue analysis, customer behavior, window functions, and ML

---

*This analysis was conducted using Google Cloud Platform's BigQuery Sandbox (free tier) with real Google Merchandise Store data from the BigQuery public dataset.*
