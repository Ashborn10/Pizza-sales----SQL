-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pizza_types.name,
    ROUND(SUM(pizzas.price * order_details.quantity),
            2) AS revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3
;
