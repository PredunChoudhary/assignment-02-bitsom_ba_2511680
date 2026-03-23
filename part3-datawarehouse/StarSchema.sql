-- Created database. 

Create database datawarehouse;
use datawarehouse;

-- Creating table to extract raq data from retail_transactions.

CREATE TABLE staging_transactions (
    transaction_id VARCHAR(50),
    raw_date VARCHAR(50),
    store_name VARCHAR(100),
    store_city VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(50),
    units_sold INT,
    unit_price DECIMAL(10,2),
    customer_id VARCHAR(50)
);

select * from staging_transactions;

-- Formatting the mixed date in raw data.

SELECT DISTINCT raw_date FROM staging_transactions;

ALTER TABLE staging_transactions
ADD COLUMN cleaned_date DATE;

UPDATE staging_transactions
SET cleaned_date = STR_TO_DATE(raw_date, '%d-%m-%Y')
WHERE raw_date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$';

UPDATE staging_transactions
SET cleaned_date = STR_TO_DATE(raw_date, '%Y-%m-%d')
WHERE raw_date REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';

UPDATE staging_transactions
SET cleaned_date = STR_TO_DATE(raw_date, '%d/%m/%Y')
WHERE raw_date REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$';

UPDATE staging_transactions
SET cleaned_date = STR_TO_DATE(raw_date, '%m/%d/%y')
WHERE raw_date REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{2}$';

alter table staging_transactions
drop column raw_date;

select * from staging_transactions;

-- Filling NULL values as per data.

select distinct store_name, store_city
from staging_transactions;

update staging_transactions
set store_city = 'Mumbai'
where store_name = 'Mumbai Central';

update staging_transactions
set store_city = 'Chennai'
where store_name = 'Chennai Anna';

update staging_transactions
set store_city = 'Delhi'
where store_name = 'Delhi South';

update staging_transactions
set store_city = 'Pune'
where store_name = 'Pune FC Road';

-- Updating the category inconsistnecy. 

select category from staging_transactions 
order by category;

update staging_transactions
set category = 'Electronics'
where category = 'electronics';

update staging_transactions
set category = 'Grocery'
where category = 'Groceries';

-- Creating tables for star schema. 

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT,
    month INT,
    year INT);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50));

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50));

CREATE TABLE fact_sales (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),
	FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id));

-- Inserting cleaned data from staging_transactions into dimensions (dim_date, dim_product, dim_store, fact_sales). 

INSERT INTO dim_date (full_date, day, month, year)
SELECT DISTINCT 
    cleaned_date,
    DAY(cleaned_date),
    MONTH(cleaned_date),
    YEAR(cleaned_date)
FROM staging_transactions
WHERE cleaned_date IS NOT NULL;

INSERT INTO dim_store (store_name, city)
SELECT DISTINCT 
    store_name,
    store_city
FROM staging_transactions;

INSERT INTO dim_product (product_name, category)
SELECT DISTINCT 
    product_name,
    category
FROM staging_transactions;

INSERT INTO fact_sales (date_id, store_id, product_id, quantity, total_amount)
SELECT 
    d.date_id,
    s.store_id,
    p.product_id,
    st.units_sold,
    st.unit_price
FROM staging_transactions st
JOIN dim_date d 
    ON st.cleaned_date = d.full_date
JOIN dim_store s 
    ON st.store_name = s.store_name
JOIN dim_product p 
    ON st.product_name = p.product_name
LIMIT 10;

select * from dim_date;
select * from dim_store;
select * from dim_product;
select * from fact_sales;