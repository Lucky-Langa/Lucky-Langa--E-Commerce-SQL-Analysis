SELECT
    strftime('%Y', orders.order_purchase_timestamp) AS Year,
    SUM(payment_value) AS Revenue
FROM order_payments
JOIN orders
    ON order_payments.order_id = orders.order_id
GROUP BY Year
ORDER BY Year;