USE Ecom;

CREATE VIEW CustomerOrderSummary AS
SELECT 
c.customer_id,
c.name,
COUNT(o.order_id) AS total_orders,
SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

SELECT * FROM CustomerOrderSummary;

SELECT name, total_spent
FROM CustomerOrderSummary
WHERE total_spent > 5000;

-- security
CREATE VIEW HighValueCustomers AS
SELECT 
    c.name,
    SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING SUM(o.total_amount) > 5000;





