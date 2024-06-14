-- Analyze the cumulative revenue generated over time.

SELECT dates, 
       sum(revenue) over(ORDER BY dates) AS cum_revenue
FROM
	(SELECT 
		orders.order_date AS dates,
		ROUND(SUM(order_details.quantity * pizzas.price),
				2) AS revenue
	FROM
		orders
			JOIN
		order_details ON orders.order_id = order_details.order_id
			JOIN
		pizzas ON pizzas.pizza_id = order_details.pizza_id
	GROUP BY dates
	ORDER BY dates) AS sales
; 
