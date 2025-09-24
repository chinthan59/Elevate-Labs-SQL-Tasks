USE BookStore;

INSERT INTO Customers (first_name, last_name, email, registration_date)
VALUES 
('Alice', 'Johnson', 'alice.johnson@gmail.com', '2025-01-10'),
('Bob', 'Smith', 'bob.smith@gmail.com.com', '2025-02-15'),
('Charlie', 'Brown', 'charlie.brown@gmail.com.com', '2025-03-05'),
('Ben', 'Ten','ben10@gmail.com',NULL); #registration_date can be NULL
SELECT * FROM Customers;

INSERT INTO Books (title, author, price)
VALUES 
('The Great Gatsby', 'F. Scott Fitzgerald', 299.99),
('1984', 'George Orwell', 199.50),
('To Kill a Mockingbird', 'Harper Lee', 249.75);

SELECT * FROM Books;


INSERT INTO Orders (customer_id, order_date, status)
VALUES 
(1, '2025-09-01 10:30:00', 'Completed'),
(2, '2025-09-05 14:45:00', 'Pending'),
(3, '2025-09-10 09:15:00', 'Shipped');
INSERT INTO Orders (customer_id, order_date)
VALUES (4, '2025-09-11 13:15:00'); #status can be default 'Pending'

SELECT * FROM Orders;

INSERT INTO Order_Items (order_id, book_id, quantity, price_per_unit)
VALUES
(1, 1, 1, 299.99),
(1, 2, 2, 199.50),
(2, 3, 1, 249.75),
(3, 2, 1, 199.50),
(3, 3, 2, 249.75);

SELECT * FROM Order_Items;

#update with where
UPDATE Customers
SET registration_date='2025-04-15'
WHERE customer_id = 4;

UPDATE Orders
SET status = 'Completed'
WHERE order_date < '2025-09-05';

#delete with where
DELETE FROM Order_Items
WHERE book_id=1;
