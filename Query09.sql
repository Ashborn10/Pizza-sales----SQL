-- Group the orders by date and calculate the 
-- average number of pizzas ordered per day.

SELECT 
    round(AVG(total_quantity),0) AS average
FROM
    (SELECT 
        DATE(orders.order_date) AS dates,
            SUM(order_details.quantity) AS total_quantity
    FROM
        orders
    JOIN 
        order_details ON orders.order_id = order_details.order_id
    GROUP BY 
        dates) AS order_quantity
;
