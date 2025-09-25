USE BookStore;
SELECT * FROM Customers;
SELECT * FROM Books;
SELECT * FROM Orders;
SELECT * FROM Order_Items;

SELECT first_name,email FROM Customers;

SELECT * FROM Orders WHERE status="Pending";

SELECT DISTINCT book_id FROM Order_Items
WHERE quantity <=2 AND price_per_unit <200.00;

SELECT * FROM Orders WHERE status="Completed" OR status="Shipped";

SELECT * FROM Books WHERE title LIKE "T%";

SELECT * FROM Books ORDER BY price DESC LIMIT 1;
SELECT * FROM Books ORDER BY price ASC LIMIT 1;

SELECT * FROM Orders 
WHERE order_date BETWEEN "2025-09-01" AND "2025-09-10";
