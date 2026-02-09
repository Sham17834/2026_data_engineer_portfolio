# Bank Transaction Fraud Detection ETL Pipeline

## Project Overview

This project demonstrates a complete **End-to-End ETL (Extract, Transform, Load) Pipeline** designed to identify fraudulent banking activities. The pipeline ingests raw transaction data, performs rigorous cleaning using **Python (Pandas)** , organizes it into a **Star Schema** , and automates the loading process into **Google Cloud Platform (BigQuery)** .

## Data Architecture (Star Schema)

To optimize for analytical performance, the dataset of **200,000 raw records** was transformed into a dimensional model:

* **Fact Table:** `fact_transactions` (Stores quantitative transaction metrics and foreign keys).
* **Dimension Tables:**
  * `customer`: Demographic details (State, City, Account Type).
  * `merchant`: Business categories and locations.
  * `date`: Time-based attributes (Weekday, Month, Year) for time-series analysis.

## Tech Stack

* **Language:** Python
* **Data Manipulation:** Pandas
* **Cloud Warehouse:** Google BigQuery
* **Libraries:** `pandas-gbq`, `pandas`
* **Query Language:** BigQuery Standard SQL

## Pipeline Steps

### Data Cleaning & Transformation

The raw CSV contained inconsistencies such as currency symbols (`RM`, `$`) and mixed date formats. The `scripts.py` script:

* Standardized `Transaction_Amount` by removing non-numeric characters using **regex** .
* Handled missing values in the `Is_Fraud` flag (standardizing to binary `0` and `1`).
* Filtered out invalid transactions (amounts **$\le 0$**).
* Generated a specific `date_key` to maintain referential integrity between the Fact and Date tables.

### Cloud Data Loading

The `gcp.py` script automates the ingestion process to BigQuery:

* Iterates through all generated Star Schema CSVs in the output directory.
* Ensures **schema consistency** by casting columns to appropriate BigQuery types (e.g., `DATETIME`, `INTEGER`).
* Uses the `replace` method to ensure a clean, updated state in the data warehouse.

## Business Insights (BigQuery)

Using the processed data in BigQuery, several business-critical queries were developed (see `bank_transaction_sql.sql`):

* **Regional Risk:** Identified high-loss cities and states for targeted fraud prevention.
* **Demographic Vulnerability:** Analyzed fraud rates across age groups and genders.
* **Temporal Patterns:** Detected fraud spikes during weekends and calculated monthly trends.
* **Merchant Profiling:** Ranked merchant categories by their "Fraud vs. Normal" transaction ratios.
