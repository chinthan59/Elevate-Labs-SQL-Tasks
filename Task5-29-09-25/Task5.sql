CREATE DATABASE Customers;
USE Customers;

CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(100),
City VARCHAR(50)
);

CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
OrderDate DATE,
CustomerID INT,
Amount DECIMAL(10,2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, CustomerName, City) VALUES
(1, 'Alice', 'Bangalore'),
(2, 'Bob', 'Chennai'),
(3, 'Charlie', 'Mumbai'),
(4, 'David', 'Delhi');

INSERT INTO Orders (OrderID, OrderDate, CustomerID, Amount) VALUES
(101, '2025-09-01', 1, 2500.00),
(102, '2025-09-05', 2, 1800.00),
(103, '2025-09-10', 1, 3200.00),
(104, '2025-09-12', 3, 1500.00);

SELECT c.CustomerID, c.CustomerName, o.OrderID, o.Amount
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

SELECT c.CustomerID, c.CustomerName, o.OrderID, o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

SELECT c.CustomerID, c.CustomerName, o.OrderID, o.Amount
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;

SELECT c.CustomerID, c.CustomerName, o.OrderID, o.Amount
FROM Customers c
CROSS JOIN Orders o
ON c.CustomerID = o.CustomerID;

SELECT c.CustomerID, c.CustomerName, o.OrderID, o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, c.CustomerName, o.OrderID, o.Amount
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;







