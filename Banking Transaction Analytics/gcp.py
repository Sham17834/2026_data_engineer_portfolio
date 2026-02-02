import pandas as pd
from pandas_gbq import to_gbq

# Google BigQuery configuration
PROJECT_ID = "data-engineer-484410"
DATASET_ID = "122026"

# Mapping of CSV files to BigQuery tables
tables = {
    "fact_transactions.csv": "fact_transactions",
    "customer.csv": "dim_customer",
    "merchant.csv": "dim_merchant",
    "date.csv": "dim_date"
}

for csv_file, table_name in tables.items():
    df = pd.read_csv(csv_file)
    
    if 'date_key' in df.columns:
        df['date_key'] = pd.to_datetime(df['date_key'])
    
    try:
        to_gbq(df, f"{DATASET_ID}.{table_name}", project_id=PROJECT_ID, if_exists='replace')
    except Exception as e:
        print(f"Failed to upload {table_name}: {e}")
