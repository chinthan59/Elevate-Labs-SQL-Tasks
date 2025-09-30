CREATE DATABASE Ecom;
USE Ecom;

CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
name VARCHAR(50),
city VARCHAR(50)
);


INSERT INTO Customers (customer_id, name, city) VALUES
(1, 'Rahul', 'Bangalore'),
(2, 'Sneha', 'Delhi'),
(3, 'Arjun', 'Mumbai'),
(4, 'Priya', 'Bangalore');

CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
total_amount DECIMAL(10,2),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2025-09-01', 8000),
(102, 2, '2025-09-02', 2000),
(103, 1, '2025-09-05', 5000),
(104, 3, '2025-09-07', 12000),
(105, 4, '2025-09-08', 1500);

CREATE TABLE Products (
product_id INT PRIMARY KEY,
name VARCHAR(50),
category VARCHAR(50),
price DECIMAL(10,2)
);


INSERT INTO Products (product_id, name, category, price) VALUES
(11, 'Laptop', 'Electronics', 60000),
(12, 'Phone', 'Electronics', 30000),
(13, 'T-Shirt', 'Fashion', 1500),
(14, 'Shoes', 'Fashion', 4000);

SELECT name
FROM Customers
WHERE customer_id = (
    SELECT customer_id
    FROM Orders
    ORDER BY total_amount DESC
    LIMIT 1
);

SELECT o.order_id, o.customer_id, o.total_amount
FROM Orders o
WHERE o.total_amount > (
    SELECT AVG(total_amount)
    FROM Orders
    WHERE customer_id = o.customer_id
);

SELECT name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    WHERE total_amount > 7000
);

SELECT name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);

SELECT category
FROM Products
WHERE product_id = (
    SELECT product_id
    FROM Products
    ORDER BY price DESC
    LIMIT 1
);






