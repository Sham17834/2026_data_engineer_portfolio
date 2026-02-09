# Data Engineering & ETL Portfolio

A comprehensive collection of end-to-end data engineering implementations demonstrating proficiency in designing robust  **ETL/ELT pipelines** , implementing sophisticated  **dimensional modeling (Star/Snowflake Schema)** , and orchestrating **automated data ingestion** workflows across both cloud data warehouses and on-premise relational databases.

---

## Project 1: Bank Transaction Fraud Detection (GCP)

### Overview

Automated pipeline processing **200,000 banking records** to identify fraudulent patterns. This project focuses on high-volume cloud warehousing, data integrity, and dimensional modeling for analytical performance.

### ETL Pipeline & Architecture

The architecture follows a modular approach: extraction from source, transformation via Pandas, and loading into BigQuery.

<p align="center">
  <img src="Banking%20Transaction%20Analytics/assets/etl_pipelines.png" width="800" alt="ETL Pipeline Architecture">
</p>
**Pipeline Steps:**

1. **Extraction:** Raw CSV data with 200,000 transaction records
2. **Transformation:**
   * Standardized currency formats using regex (removed `RM`, `$` symbols)
   * Handled missing values in fraud flags (standardized to binary `0` and `1`)
   * Filtered invalid transactions (amounts ≤ 0)
   * Generated `date_key` for referential integrity
3. **Loading:** Automated ingestion to BigQuery with schema validation

### Data Modeling (Star Schema)

Implemented a **Star Schema** to reduce join complexity and improve query performance for BI tools.

<p align="center">
  <img src="Banking%20Transaction%20Analytics/assets/star_schema.png" width="800" alt="Star Schema Diagram">
</p>
**Fact Table:** `fact_transactions`

* Stores quantitative transaction metrics and foreign keys

<p align="center">
  <img src="Banking%20Transaction%20Analytics/assets/fact_table.png" width="800" alt="Fact Table Structure">
</p>
**Dimension Tables:**


<p align="center">
  <img src="Banking%20Transaction%20Analytics/assets/customer.png" width="800" alt="Customer Dimension">
  <img src="Banking%20Transaction%20Analytics/assets/merchant.png" width="800" alt="Merchant Dimension">
  <img src="Banking%20Transaction%20Analytics/assets/date.png" width="800" alt="Date Dimension">
</p>

* **Customer:** Demographic details (State, City, Account Type, Age, Gender)
* **Merchant:** Business categories and locations
* **Date:** Time-based attributes (Weekday, Month, Year) for time-series analysis

### Business Insights

Using BigQuery Standard SQL, I analyzed fraud susceptibility across various segments:

* **Regional Risk Analysis:** Identified high-loss cities and states for targeted fraud prevention
* **Demographic Vulnerability:** Analyzed fraud rates across age groups and genders
* **Temporal Patterns:** Detected fraud spikes during weekends and monthly trends
* **Merchant Profiling:** Ranked merchant categories by fraud-to-normal transaction ratios

<p align="center">
  <img src="Banking%20Transaction%20Analytics/assets/account_type_performance.png" width="700" alt="Account Performance Analysis">
</p>
**Tech Stack:** Python (Pandas) · GCP (BigQuery) · SQL · pandas-gbq · Git

**Key Files:**

* `scripts.py` - Data cleaning and transformation logic
* `gcp.py` - Automated BigQuery ingestion with schema enforcement
* `bank_transaction_sql.sql` - Business intelligence queries

---

## Project 2: Retail Sales Analysis & Pipeline (PostgreSQL)

### Overview

Engineered a local data warehouse solution processing **1,000 retail transaction records** to clean raw data and derive actionable business intelligence through advanced SQL modeling and analytics.

### Data Engineering Workflow

The pipeline ensures data quality through comprehensive cleaning and validation before ingestion into PostgreSQL.

<p align="center">
  <img src="E-commerce%20Data%20Pipeline/assets/data_pipeline.png" width="800" alt="E-commerce Data Pipeline">
</p>
**ETL Process:**

1. **Extraction:** Raw retail sales dataset with customer demographics and product details
2. **Transformation:**
   * Standardized column names to lowercase snake_case
   * Removed duplicate records based on `transaction_id`
   * Handled missing values to ensure data integrity
   * Converted date formats to proper datetime objects
3. **Loading:** Automated table creation and data upload using SQLAlchemy

python

```python
# Key transformation step
df['date']= pd.to_datetime(df['date'], dayfirst=True)
df.to_sql('retail_sales', engine, if_exists='replace', index=False)
```

### Business Analytics

Implemented complex SQL queries utilizing **window functions** (`RANK`, `SUM OVER`) and advanced aggregations to calculate:

**Sales Performance:**

* Monthly revenue trends for seasonal analysis
* Product category contribution to total revenue
* Top-performing individual transactions

**Customer Insights:**

* Gender-based spending patterns and average order value (AOV)
* Age demographic segmentation (20-29, 30-39, etc.)
* Customer lifetime value (CLV) rankings

**Advanced Metrics:**

* Revenue percentage contribution by category
* Average price per unit across product lines
* Customer loyalty scoring using window functions

<p align="center">
  <img src="E-commerce%20Data%20Pipeline/assets/Revenue%20by%20product%20category%20sql%20graph.png" width="400" alt="Revenue by Category">
  <img src="E-commerce%20Data%20Pipeline/assets/top5_transaction_product.png" width="400" alt="Top 5 Transactions">
</p>
**Tech Stack:** Python 3.13 · Pandas · SQLAlchemy · PostgreSQL · SQL · VSCode

**Dataset Attributes:**

* Transaction ID, Date, Customer ID
* Demographics (Gender, Age)
* Product details (Category, Quantity, Price per Unit)
* Financial metrics (Total Amount)

---

## Technical Skills Demonstrated

### ETL/ELT Pipelines

* Automated data movement using Python and SQL
* Schema validation and data quality enforcement
* Incremental loading strategies with replace/append logic

### Database Design

* Professional experience with **Star Schema** dimensional modeling
* Database normalization and denormalization strategies
* Referential integrity maintenance across fact and dimension tables

### Cloud & On-Premises

* **Google Cloud Platform:** BigQuery data warehousing
* **PostgreSQL:** Relational database design and optimization
* Hybrid architecture implementation

### Analytical SQL

* Advanced window functions (`RANK`, `ROW_NUMBER`, `SUM OVER`)
* Common Table Expressions (CTEs) for complex queries
* Data transformation and aggregation techniques

---



## Tech Stack

* **Languages:** Python
* **Libraries:** Pandas, SQLAlchemy, pandas-gbq
* **Databases:** Google BigQuery, PostgreSQL
* **Query Languages:** SQL (Standard & Advanced)
* **Tools:** VSCode, Git
