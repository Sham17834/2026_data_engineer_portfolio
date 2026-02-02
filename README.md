# Data Engineering & ETL Portfolio

This repository contains a collection of end-to-end Data Engineering projects focused on **ETL (Extract, Transform, Load)** pipelines, **Dimensional Modeling** , and **Automated Data Ingestion** into both Cloud and Relational databases.

---

## Project 1: Bank Transaction Fraud Detection (GCP)

### Overview

An automated pipeline designed to process **200,000 banking records** and identify fraudulent patterns. This project focuses on high-volume data transformation and cloud warehousing.

### Data Architecture

The data is structured using a **Star Schema** to optimize query performance in BigQuery:

* **Fact Table:** `fact_transactions` (Quantitative metrics & foreign keys).
* **Dimension Tables:** `dim_customer` (Demographics), `dim_merchant` (Vendor details), and `dim_date` (Time-series analysis).

### Pipeline Flow

1. **Transformation (Python/Pandas):** * Standardized `Transaction_Amount` using Regex to remove currency symbols (`RM`, `$`).
   * Converted `Transaction_Date` to datetime objects and generated `date_key` for referential integrity.
2. **Ingestion (BigQuery):** * Developed `gcp.py` to automate the loading of CSVs into BigQuery using `pandas-gbq`.
   * Ensured schema consistency by casting dtypes to `DATETIME` and `INTEGER`.

### Key SQL Insights

* **Regional Risk:** Identified high-loss cities to target fraud prevention.
* **Merchant Profiling:** Ranked categories by "Fraud vs. Normal" transaction ratios.
* **Demographic Vulnerability:** Analyzed fraud susceptibility across age brackets.

---

## Project 2: Retail Sales Analysis & Pipeline (PostgreSQL)

### Overview

A comprehensive workflow focused on retail business intelligence. It involves cleaning raw transaction data and performing advanced SQL analytics to derive insights into customer behavior.

### ETL Process

* **Extraction:** Ingested 1,000 raw retail records.
* **Standardization:** Converted columns to `snake_case` and handled `datetime` conversions (dayfirst logic).
* **Integrity:** Removed redundant records based on `transaction_id` and dropped null entries.
* **Loading:** Utilized `SQLAlchemy` to automate data exports to a **PostgreSQL** instance.

### Business Analytics (PostgreSQL)

* **Sales Performance:** Calculated monthly revenue trends and category contributions (Electronics vs. Clothing vs. Beauty).
* **Customer Demographics:** Grouped customers into age brackets to identify the highest purchasing power groups.
* **Advanced Window Functions:** Implemented `RANK()` and `SUM() OVER()` to calculate Customer Lifetime Value (CLV) and category-wise revenue percentages.

---

## Technical Skills Demonstrated

* **Languages:** Python (Pandas, SQLAlchemy), SQL (PostgreSQL, BigQuery Standard SQL).
* **Cloud:** Google Cloud Platform (BigQuery).
* **Database Design:** Star Schema, Normalization, Data Integrity.
* **Tools:** Git, Regex, Data Ingestion APIs.
