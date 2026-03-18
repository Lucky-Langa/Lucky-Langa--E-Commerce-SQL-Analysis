SELECT
    100.0 * SUM(CASE WHEN julianday(order_delivered_customer_date) - julianday(order_estimated_delivery_date) > 0 THEN 1 ELSE 0 END) / CASE WHEN COUNT(*) = 0 THEN NULL ELSE COUNT(*) END AS pct_orders_late
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;