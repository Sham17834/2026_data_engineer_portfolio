-- checking for potential duplicate entry errors
select transaction_id, customer_id, count(*) as duplicate_count
from `data-engineer-484410.122026.fact_transactions`
group by transaction_id, customer_id
having count(*) > 1
order by duplicate_count desc;

-- fraud geography identification
select c.city,c.state,count(f.transaction_id) as fraud_count,sum(f.transaction_amount) as total_loss
from `data-engineer-484410.122026.fact_transactions` as f
join `data-engineer-484410.122026.dim_customer` as c on f.customer_id = c.customer_id
where f.is_fraud = 1
group by c.city, c.state
order by total_loss desc;

-- account type performance audit
select c.account_type,count(*) as total_transactions,sum(f.is_fraud) as fraud_cases,round(avg(f.transaction_amount), 2) as average_spend
from `data-engineer-484410.122026.fact_transactions` as f
join `data-engineer-484410.122026.dim_customer` as c on f.customer_id = c.customer_id
group by c.account_type;

-- merchant category risk profiling
select m.merchant_category,
    sum(case when f.is_fraud = 0 then 1 else 0 end) as normal_tx,
    sum(case when f.is_fraud = 1 then 1 else 0 end) as fraud_tx
from `data-engineer-484410.122026.fact_transactions` as f
join `data-engineer-484410.122026.dim_merchant` as m on f.merchant_id = m.merchant_id
group by m.merchant_category
order by fraud_tx desc;

-- weekend fraud detection
select d.weekday,count(f.transaction_id) as transaction_volume,sum(f.is_fraud) as fraud_detected
from `data-engineer-484410.122026.fact_transactions` as f
join `data-engineer-484410.122026.dim_date` as d on f.date_key = d.date_key
where d.weekday in ('saturday', 'sunday')
group by d.weekday;

-- analyzing fraud by customer demographics
select c.gender,
    case 
        when c.age < 25 then 'under 25'
        when c.age between 25 and 50 then '25-50'
        else 'over 50' 
    end as age_group,
    sum(f.is_fraud) as total_fraud_cases,
    sum(f.transaction_amount) as total_loss_amount
from `data-engineer-484410.122026.fact_transactions` as f
join `data-engineer-484410.122026.dim_customer` as c on f.customer_id = c.customer_id
where f.is_fraud = 1
group by 1, 2
order by total_loss_amount desc;

-- monthly fraud trends (time series)
select d.year,d.month,sum(f.is_fraud) as fraud_cases,sum(f.transaction_amount) as monthly_fraud_value
from `data-engineer-484410.122026.fact_transactions` as f
join `data-engineer-484410.122026.dim_date` as d on f.date_key = d.date_key
group by d.year, d.month
order by d.year, d.month;