SELECT
  p.product_category_name AS CategoryName,
  SUM(op.payment_value) AS CategoryRevenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN order_payments op ON op.order_id = o.order_id
GROUP BY p.product_category_name
ORDER BY CategoryRevenue DESC
LIMIT 10;