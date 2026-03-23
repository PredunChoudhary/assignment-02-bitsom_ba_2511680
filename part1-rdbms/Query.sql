-- 1.3 SQL Queries.

-- Q.1 List all customers from Mumbai along with their total order value.

select 
	c.customer_name as Customer, 
	sum(p.unit_price * od.quantity) as Total_price
from customers c 
join orders o ON c.customer_id = o.customer_id
join order_details od ON o.order_id = od.order_id
join products p ON p.product_id = od.product_id 
where c.customer_city = 'Mumbai'
group by c.customer_name;

-- Q.2 Find the top 3 products by total quantity sold.

select p.product_name,
       SUM(od.quantity) as total_quantity
from order_details od
join products p ON od.product_id = p.product_id
group by p.product_name
order by total_quantity desc
limit 3;

-- Q.3 List all sales representatives and the number of unique customers they have handled.

select sr.sales_rep_name,
       count(distinct o.customer_id) as unique_customers
from sales_reps sr
join orders o ON sr.sales_rep_id = o.sales_rep_id
group by sr.sales_rep_name;

-- Q.4 Find all orders where the total value exceeds 10,000, sorted by value descending.

select o.order_id,
       sum(p.unit_price * od.quantity) as total_value
from orders o
join order_details od ON o.order_id = od.order_id
join products p ON od.product_id = p.product_id
group by o.order_id
having total_value > 10000
order by total_value desc;

-- Q.5 Identify any products that have never been ordered.

select p.product_name
from products p
left join order_details od ON p.product_id = od.product_id
where od.product_id is null;