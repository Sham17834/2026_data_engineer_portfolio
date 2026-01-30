-- Monthly revenue 
select 
    to_char(date, 'dd/mm/yyyy') as month, 
    sum(total_amount) as revenue
from retail_sales
group by month
order by month;

--Rrevenue by product category
select 
    product_category, 
    sum(total_amount) as total_revenue
from retail_sales
group by product_category
order by total_revenue desc;

-- Average spending by gender
select 
    gender, 
    round(avg(total_amount), 2) as avg_spending
from retail_sales
group by gender;

-- Top 5 transactions by amount
select
    transaction_id,
    product_category,
    total_amount
from retail_sales
order by total_amount desc
limit 5;

-- Average price per unit by category
select
    product_category,
    round(avg(price_per_unit), 2) as avg_price
from retail_sales
group by product_category
order by avg_price desc;

-- Total spending by age group
select
    case
        when age < 20 then 'under 20'
        when age between 20 and 29 then '20-29'
        when age between 30 and 39 then '30-39'
        when age between 40 and 49 then '40-49'
        else '50+'
    end as age_group,
    sum(total_amount) as total_spent
from retail_sales
group by age_group
order by age_group desc;

-- Revenue percentage contribution per category
select
    product_category,
    sum(total_amount) as category_revenue,
    round(
        sum(total_amount) * 100.0 / 
        sum(sum(total_amount)) over (), 
        2
    ) as revenue_percentage
from retail_sales
group by product_category
order by revenue_percentage desc;

-- Customer spending rank
select
    customer_id,
    sum(total_amount) as total_spent,
    rank() over (order by sum(total_amount) desc) as spending_rank
from retail_sales
group by customer_id
order by spending_rank;