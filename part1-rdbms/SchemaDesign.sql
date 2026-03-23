Select * from orders_flat;

-- 1.1 Insert, Update, Delete Anomaly.

-- Insert Anomaly---> Using Insert inconsistent Data has been stored which do not have any primary or foreign key. 

INSERT INTO orders_flat (
    product_id, product_name, category, unit_price
)
VALUES ('P999', 'Smart Watch', 'Electronics', 10000);

-- Update Anamoly---> There are two entries of same Order_Id hence the data is inconsistent.

select * from orders_flat
where order_id = 'ORD1159';

-- Delete Anamoly---> Deleting one of the entry leds to complete info gone forever.

SELECT order_id, COUNT(*) as count_orders
FROM orders_flat
GROUP BY order_id
HAVING COUNT(*) > 1;

DELETE FROM orders_flat
WHERE order_id = 'ORD1159';

-- 1.2 3NF Schema Design 

CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100),
    customer_city VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(20) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100),
    office_address VARCHAR(255)
);

CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    sales_rep_id VARCHAR(20),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

CREATE TABLE order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(20),
    product_id VARCHAR(20),
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
('C001','Amit Sharma','amit@gmail.com','Mumbai'),
('C002','Riya Singh','riya@gmail.com','Delhi'),
('C003','Rahul Verma','rahul@gmail.com','Mumbai'),
('C004','Sneha Jain','sneha@gmail.com','Pune'),
('C005','Karan Mehta','karan@gmail.com','Bangalore');

INSERT INTO products VALUES
('P001','Laptop','Electronics',50000),
('P002','Mobile','Electronics',20000),
('P003','Tablet','Electronics',30000),
('P004','Chair','Furniture',5000),
('P005','Desk','Furniture',8000);

INSERT INTO sales_reps VALUES
('S001','Raj','raj@gmail.com','Delhi Office'),
('S002','Anita','anita@gmail.com','Mumbai Office'),
('S003','Vikas','vikas@gmail.com','Pune Office'),
('S004','Neha','neha@gmail.com','Bangalore Office'),
('S005','Arjun','arjun@gmail.com','Chennai Office');

INSERT INTO orders VALUES
('O001','C001','S001','2024-01-01'),
('O002','C002','S002','2024-01-02'),
('O003','C003','S003','2024-01-03'),
('O004','C004','S004','2024-01-04'),
('O005','C005','S005','2024-01-05');

INSERT INTO order_details (order_id, product_id, quantity) VALUES
('O001','P001',2),
('O002','P002',3),
('O003','P003',1),
('O004','P004',4),
('O005','P005',2);