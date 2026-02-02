# Retail Sales Data Analysis & ETL Pipeline

## Project Overview

This project demonstrates a complete Data Engineering and Analysis workflow. It involves cleaning **1,000 records** of raw retail transaction data using **Python**, loading it into a **PostgreSQL** database, and performing advanced **SQL** analysis to derive actionable business insights regarding customer behavior and sales performance.

---

## Dataset Description

The dataset contains transaction records from a retail store, including:

* **Transaction ID** : Unique identifier for each sale.
* **Date** : Date of purchase.
* **Customer ID** : Unique identifier for the customer.
* **Demographics** : Gender and Age.
* **Product Details** : Category, Quantity, and Price per Unit.
* **Financials** : Total Amount spent.

---

## Tech Stack

* **Language:** Python 3.13
* **Libraries:** Pandas, SQLAlchemy
* **Database:** PostgreSQL

---

## Data Cleaning & ETL (Python)

The Python script handles the "Extraction" and "Transformation" phases of the ETL pipeline:

1. **Standardization** : Renames columns to lowercase and snake_case for easier SQL querying.
2. **Handling Duplicates** : Removes redundant records based on `transaction_id`.
3. **Missing Values** : Cleans the dataset by dropping null entries to ensure data integrity.
4. **Type Conversion** : Converts the `date` column to a proper datetime format.
5. **Data Export** :

* Saves a local version as `cleaned_retail_sales_dataset.csv`.
* Automatically creates a table and uploads data to a **PostgreSQL** database using `to_sql`.

**Python**

```
# Key transformation step
df['date'] = pd.to_datetime(df['date'], dayfirst=True)
df.to_sql('retail_sales', engine, if_exists='replace', index=False)
```

---

## Business Analysis (SQL)

Once the data is structured in PostgreSQL, we execute queries to answer key business questions:

### 1. Sales Performance

* **Monthly Revenue** : Aggregating sales by month to identify seasonal trends.
* **Category Contribution** : Calculating which product categories (Electronics, Clothing, Beauty) generate the highest revenue.
* **Top Transactions** : Identifying the highest-value individual sales.

### 2. Customer Insights

* **Gender Spending** : Comparing the average order value (AOV) between male and female customers.
* **Age Demographics** : Grouping customers into brackets (e.g., '20-29', '30-39') to see which age group has the highest purchasing power.
* **Customer Loyalty** : Ranking customers based on their total lifetime spending using SQL Window Functions (`RANK()`).

### 3. Advanced Metrics

* **Revenue Percentage** : Calculating the percentage contribution of each category to the total company revenue.
* **Pricing Analysis** : Determining the average price point per unit across different categories.
