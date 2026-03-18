SELECT AVG(order_count) AS avg_orders_per_customer
FROM (
  SELECT
   customer_id,
    COUNT(*) AS order_count
  FROM orders
  GROUP BY customer_id
);