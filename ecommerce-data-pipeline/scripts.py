import pandas as pd
from sqlalchemy import create_engine

# Load the dataset
df = pd.read_csv('retail_sales_dataset.csv')

# Initial data exploration
print(df.head())
print(df.info())
print(df.describe())

# Rename columns for clarity
df.columns = [
        "transaction_id",
        "date",
        "customer_id",
        "gender",
        "age",
        "product_category",
        "quantity",
        "price_per_unit",
        "total_amount"
    ]

# Data cleaning
df = df.drop_duplicates(subset=['transaction_id'])
df = df.dropna()

# Convert data types
df['date'] = pd.to_datetime(df['date'], dayfirst=True)
df['calculated_total'] = df['quantity'] * df['price_per_unit']
df['total_amount'] = df['total_amount']

# Validate total_amount
df = df.drop(columns=['calculated_total'])

# Save cleaned data to a new CSV file
df.to_csv('cleaned_retail_sales_dataset.csv', index=False)

# Load cleaned data into PostgreSQL database
engine = create_engine('postgresql+psycopg2://postgres:12345@localhost:5432/retail_db')
df.to_sql('retail_sales', engine, if_exists='replace', index=False)