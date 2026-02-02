import pandas as pd
import os

# 1Load the Data
file_path = "Bank_Transaction_Fraud_Detection.csv"
df = pd.read_csv(file_path)

# Data Cleaning
df['Transaction_Amount'] = df['Transaction_Amount'].astype(str).str.replace(r'[RM,$,]', '', regex=True)
df['Transaction_Amount'] = pd.to_numeric(df['Transaction_Amount'], errors='coerce')

# Handle Dates and Times
df["Transaction_Date"] = pd.to_datetime(df["Transaction_Date"], errors='coerce')
df["Transaction_Time"] = df["Transaction_Time"].astype(str)

# Drop duplicates and invalid rows
df = df.drop_duplicates()
df = df.dropna(subset=['Transaction_Amount', 'Transaction_Date'])
df = df[df["Transaction_Amount"] > 0]

# Fill missing fraud flags with 0
df["Is_Fraud"] = df["Is_Fraud"].fillna(0).astype(int)

# Create Dimension Tables
# Dim Customer
dim_customer = df[[
    "Customer_ID", "Customer_Name", "Gender", "Age", 
    "State", "City", "Account_Type", "Bank_Branch"
]].drop_duplicates()

# Dim Merchant
dim_merchant = df[[
    "Merchant_ID", "Merchant_Category", "Transaction_Location"
]].drop_duplicates()

# Dim Date
dim_date = df[["Transaction_Date"]].drop_duplicates().copy()
dim_date["date_key"] = dim_date["Transaction_Date"].dt.date
dim_date["day"] = dim_date["Transaction_Date"].dt.day
dim_date["month"] = dim_date["Transaction_Date"].dt.month
dim_date["year"] = dim_date["Transaction_Date"].dt.year
dim_date["weekday"] = dim_date["Transaction_Date"].dt.day_name()

# Create Fact Table
fact_transactions = df[[
    "Transaction_ID", "Customer_ID", "Merchant_ID", 
    "Transaction_Date", "Transaction_Time", "Transaction_Amount", "Is_Fraud"
]].copy()

# Rename for consistency with dim_date
fact_transactions.rename(columns={"Transaction_Date": "date_key"}, inplace=True)

# Export Data
dim_customer.to_csv("customer.csv", index=False)
dim_merchant.to_csv("merchant.csv", index=False)
dim_date.to_csv("date.csv", index=False)
fact_transactions.to_csv("fact_transactions.csv", index=False)
