-- Q1: Total sales revenue by product category for each month

Select 
	p.category,
    d.year,
    d.month,
    sum(fs.total_amount) as Total_Revenue
    from fact_sales fs
Join dim_product p
	ON 	p.product_id = fs.product_id
Join dim_date d 
	ON d.date_id = fs.date_id
Group by p.category,d.month,d.year
Order by d.year, d.month;

-- Q2: Top 2 performing stores by total revenue

Select 
	s.store_name,
    sum(fs.total_amount) as Total_Revenue
    from fact_sales fs
Join dim_store s 
	ON s.store_id = fs.store_id
    Group by s.store_name
    Order by Total_Revenue DESC;

-- Q3: Month-over-month sales trend across all stores

Select
    s.store_name,
    d.year,
    d.month,
    SUM(fs.total_amount) as Monthly_Sales
	from fact_sales fs
Join dim_store s
	ON s.store_id = fs.store_id
Join dim_date d 
	ON fs.date_id = d.date_id
Group by s.store_name, d.year, d.month
Order by d.year, d.month;
