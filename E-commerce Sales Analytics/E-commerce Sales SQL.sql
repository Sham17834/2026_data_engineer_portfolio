select * from ecommerce_sales;

-- find duplicates based on order id
select orderid, count(*)
from ecommerce_sales
group by orderid
having count(*) > 1;

-- check for missing values
select 
    sum(case when product is null then 1 else 0 end) as missing_product,
    sum(case when price is null then 1 else 0 end) as missing_price,
    sum(case when orderdate is null then 1 else 0 end) as missing_date
from ecommerce_sales;

-- trim spaces
update ecommerce_sales
set product = trim(product);

-- find negative quantities or prices
select * from ecommerce_sales
where quantity < 0 or price < 0;

-- find orders outside 2024
select *
from ecommerce_sales
where orderdate < '2024-01-01' or orderdate > '2024-12-31';

-- recalculate total price
update ecommerce_sales
set totalamount = price * quantity;

-- sales summary by category & brand
select category, brand, sum(totalamount) as total_sales
from ecommerce_sales
group by category, brand
order by total_sales desc;

-- top selling products
select product, sum(quantity) as total_units_sold, sum(totalamount) as total_sales
from ecommerce_sales
group by product
order by total_sales desc
limit 10;

-- sales by city / platform
select city, platform, sum(totalamount) as total_sales
from ecommerce_sales
group by city, platform
order by total_sales desc;

-- monthly sales trend
select to_char(orderdate, 'Month') as month, sum(totalamount) as monthly_sales
from ecommerce_sales
group by month
order by min(orderdate)
