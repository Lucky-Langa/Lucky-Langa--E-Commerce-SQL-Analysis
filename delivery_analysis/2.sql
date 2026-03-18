SELECT
    customers.customer_state,
    MAX(julianday(orders.order_delivered_customer_date) - julianday(orders.order_purchase_timestamp)) AS LongestDeliveryDays
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
WHERE orders.order_delivered_customer_date IS NOT NULL
  AND orders.order_purchase_timestamp IS NOT NULL
GROUP BY customers.customer_state
ORDER BY LongestDeliveryDays DESC;
