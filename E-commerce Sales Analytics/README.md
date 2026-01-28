# E-commerce Sales Analysis & Insights (Malaysia Market)

## Project Overview

This project analyzes **10,000+ e-commerce transactions** in the Malaysian market for the year 2024. The goal was to transform raw, unoptimized data into actionable business intelligence. I handled the end-to-end pipeline: from **SQL-based data cleaning** to building an **interactive Power BI dashboard** that tracks KPIs across platforms like Shopee, Lazada, and TikTok Shop.

---

## Tech Stack

* **Database:** SQL (PostgreSQL) for EDA and Data Cleaning
* **Visualization:** Power BI (DAX, Interactive Filtering)
* **Tools:** VS Code, Excel
* **Dataset:** 10,000 Sales Records (Malaysia-specific cities and platforms)

---

## Data Pipeline & SQL Cleaning

Before visualization, I performed rigorous data cleaning to ensure "Single Version of Truth".

### 1. Data Integrity & Quality Control

* **Duplicate Removal:** Verified `OrderID` uniqueness to prevent revenue inflation.
* **Null Handling:** Screened for missing values in `Product`, `Price`, and `Date`.
* **Whitespace Scrubbing:** Used `TRIM()` on product names to ensure accurate grouping.

### 2. Business Logic Implementation

* **Anomaly Detection:** Filtered out negative quantities and prices that would skew profit margins.
* **Feature Engineering:** Recalculated `TotalAmount` (**$Price \times Quantity$**) to ensure data consistency.
* **Date Filtering:** Restricted the dataset scope to the 2024 fiscal year.

> **Key SQL Snippet: Top 10 Products by Revenue**

**SQL**

```
SELECT 
    product, 
    SUM(quantity) AS total_units_sold, 
    SUM(totalamount) AS total_sales
FROM ecommerce_sales
GROUP BY product
ORDER BY total_sales DESC
LIMIT 10;
```

---

## Power BI Dashboard Insights

The final dashboard provides a 360-degree view of the Malaysian e-commerce landscape.

### Key Performance Indicators (KPIs)

* **Total Revenue:** RM 302 Million.
* **Average Order Value (AOV):** RM 30.20K.
* **Top Performing Product:** *Xiaomi Redmi Note 12* (~RM 34M revenue).

### Market Observations

* **Seasonal Trends:** Sales peaked in  **May, July, and September** , indicating high consumer activity during mid-year sales cycles.
* **Category Dominance:** **Electronics** and **Fashion** lead the market share.
* **Geographic Spread:** Strong sales performance identified in  **Kuala Terengganu, Petaling Jaya, and Kota Bharu** .
* **Platform Analysis:** Sales are evenly distributed across  **Shopee, Lazada, and TikTok Shop** , suggesting a highly fragmented and competitive platform landscape in Malaysia.

---

## Strategic Recommendations

1. **Platform Diversification:** Businesses should maintain a multi-channel presence (Shopee + TikTok Shop) as no single platform dominates 2024 sales.
2. **Inventory Planning:** Prioritize stock for high-velocity electronics (Xiaomi, Samsung) leading into the Q2 and Q3 peak periods.
3. **Regional Marketing:** Allocate ad-spend toward high-performing cities like Petaling Jaya where purchasing power is concentrated.
