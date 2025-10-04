USE Ecom;

-- CREATE PROCEDURE with parameters and conditional logic
DELIMITER //

CREATE PROCEDURE GetCustomerOrders(IN cust_id INT)
BEGIN
    DECLARE total_orders INT;
    
    SELECT COUNT(*) INTO total_orders
    FROM Orders
    WHERE customer_id = cust_id;
    
    IF total_orders > 0 THEN
        SELECT 
            o.order_id, 
            o.order_date, 
            o.total_amount 
        FROM Orders o
        WHERE o.customer_id = cust_id;
    ELSE
        SELECT 'No orders found for this customer' AS message;
    END IF;
END //

DELIMITER ;

-- Call the procedure
CALL GetCustomerOrders(1);



-- CREATE FUNCTION with parameters and logic
DELIMITER //

CREATE FUNCTION GetTotalSpent(cust_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(total_amount) INTO total
    FROM Orders
    WHERE customer_id = cust_id;

    IF total IS NULL THEN
        SET total = 0;
    END IF;

    RETURN total;
END //

DELIMITER ;

-- Use the function
SELECT name, GetTotalSpent(customer_id) AS total_spent
FROM Customers;
