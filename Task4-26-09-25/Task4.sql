CREATE DATABASE Shop;
USE Shop;

CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50),
product VARCHAR(50),
category VARCHAR(30),
quantity INT,
price DECIMAL(10,2),
order_date DATE
);

INSERT INTO Orders (order_id, customer_name, product, category, quantity, price, order_date) VALUES
(1, 'Alice', 'Laptop', 'Electronics', 1, 60000, '2025-01-05'),
(2, 'Bob', 'Headphones', 'Electronics', 2, 2000, '2025-01-06'),
(3, 'Charlie', 'Table', 'Furniture', 1, 12000, '2025-01-07'),
(4, 'Alice', 'Chair', 'Furniture', 4, 1500, '2025-01-08'),
(5, 'Eve', 'T-shirt', 'Clothing', 3, 800, '2025-01-10'),
(6, 'David', 'Mobile', 'Electronics', 1, 25000, '2025-01-12'),
(7, 'Charlie', 'Jacket', 'Clothing', 2, 3000, '2025-01-15'),
(8, 'Bob', 'Shoes', 'Clothing', 1, 2500, '2025-01-16'),
(9, 'Alice', 'Tablet', 'Electronics', 1, 15000, '2025-01-18'),
(10, 'Eve', 'Bed', 'Furniture', 1, 30000, '2025-01-20');

SELECT * FROM Orders;

SELECT category,SUM(quantity) AS Items_per_category FROM Orders
GROUP BY category; 

SELECT customer_name,COUNT(*) AS Customers_buy_more_than_one FROM ORDERS 
GROUP BY customer_name HAVING count(*)>1 ORDER BY COUNT(*) DESC;

SELECT customer_name,AVG(price*quantity) AS Avg_spend_per_customer FROM ORDERS 
GROUP BY customer_name ORDER BY AVG(price*quantity) DESC;

SELECT category,MIN(price) AS Min_price_per_category,MAX(price) AS Max_price_per_category 
FROM Orders
GROUP BY category; 



