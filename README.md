
# **Data Engineering & ETL Portfolio**

A collection of **end-to-end Data Engineering projects** demonstrating ETL pipelines,  **Dimensional Modeling** , and **Automated Data Ingestion** into Cloud and Relational databases.

---

## **Project 1: Bank Transaction Fraud Detection (GCP)**

### **Overview**

Automated pipeline processing **200,000 banking records** to identify fraudulent patterns. Focused on high-volume transformation and cloud warehousing.

---

### **ETL Pipeline**

Banking Transaction Analytics/assets/etl_pipelines.png

---

### **Data Architecture (Star Schema)**

*Fact table:* `fact_transactions` – quantitative metrics & foreign keys

*Dimension tables:* `customer` (demographics), `merchant` (vendor details), `date` (time-series)

Banking Transaction Analytics/assets/fact_table.png
Banking Transaction Analytics/assets/customer.png
Banking Transaction Analytics/assets/date.png
Banking Transaction Analytics/assets/merchant.png

---

### **SQL Insights**

* **Regional Risk:** Identify high-loss cities
* **Merchant Profiling:** Fraud ratio by category
* **Demographic Vulnerability:** Age brackets & fraud susceptibility

Banking Transaction Analytics/assets/account_type_performance.png

---

### **Tech Stack**

* **Languages:** Python (Pandas), SQL (BigQuery Standard SQL)
* **Cloud:** Google Cloud Platform (BigQuery)
* **Database Design:** Star Schema, Data Integrity
* **Tools:** Git, VSCode

---

## **Project 2: Retail Sales Analysis & Pipeline (PostgreSQL)**

### **Overview**

Cleaned raw retail transaction data and performed SQL analytics to understand customer behavior and sales performance.

---

### **ETL Pipeline**

E-commerce Data Pipeline/assets/data_pipeline.png

---

### **Business Analytics**

* **Monthly Revenue Trends:** Line chart for overall revenue
* **Category Contribution:** Pie chart for Electronics, Clothing, Beauty
* **Customer Lifetime Value:** Window functions (`RANK()`, `SUM() OVER()`)

---

### **Tech Stack**

* **Languages:** Python (Pandas, SQLAlchemy), SQL (PostgreSQL)
* **Database Design:** Normalization, Data Integrity
* **Tools:** Git, VSCode

E-commerce Data Pipeline/assets/Revenue by product category sql graph.png
E-commerce Data Pipeline/assets/top5_transaction_product.png

---

## **Technical Skills Demonstrated**

* ETL Pipelines: Python, Pandas, SQL
* Database Design: Star Schema, Dimensional Modeling
* Cloud & Relational DB: BigQuery, PostgreSQL
* Data Cleaning & Transformation
* SQL Analytics & Window Functions
* Version Control & Development Tools
