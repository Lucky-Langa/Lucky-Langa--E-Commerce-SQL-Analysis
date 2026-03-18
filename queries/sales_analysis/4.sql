SELECT 
    c.customer_state AS State,
    c.customer_city,
    ROUND(SUM(p.payment_value),2) AS total_revenue
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN order_payments p
ON o.order_id = p.order_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;