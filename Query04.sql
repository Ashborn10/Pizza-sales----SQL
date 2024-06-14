-- Identify the most common pizza size ordered.

SELECT 
    pizzas.size, COUNT(order_details.order_id) AS order_count
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC
LIMIT 1;
