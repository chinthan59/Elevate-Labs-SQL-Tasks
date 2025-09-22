CREATE DATABASE Bookstore;
USE BookStore;

CREATE TABLE Customers (
customer_id INT AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
registration_date DATE,
PRIMARY KEY (customer_id)
);

CREATE TABLE Books (
book_id INT AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
author VARCHAR(100) NOT NULL,
price DECIMAL(10, 2) NOT NULL,
PRIMARY KEY (book_id)
);

CREATE TABLE Orders (
order_id INT AUTO_INCREMENT,
customer_id INT,
order_date DATETIME NOT NULL,
status VARCHAR(50) DEFAULT 'Pending',
PRIMARY KEY (order_id),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
order_item_id INT AUTO_INCREMENT,
order_id INT,
book_id INT,
quantity INT NOT NULL,
price_per_unit DECIMAL(10, 2) NOT NULL, -- Price at the time of purchase
PRIMARY KEY (order_item_id),
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);