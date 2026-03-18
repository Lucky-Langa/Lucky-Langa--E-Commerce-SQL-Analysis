WITH customer_orders AS (
  SELECT customer_id, COUNT(*) AS order_count
  FROM orders
  GROUP BY customer_id
),
repeat_customers AS (
  SELECT COUNT(*) AS repeat_count
  FROM customer_orders
  WHERE order_count > 1
),
total_customers AS (
  SELECT COUNT(*) AS total_count
  FROM customer_orders
)
SELECT
  rc.repeat_count,
  tc.total_count,
  100.0 * rc.repeat_count / tc.total_count AS pct_repeat_buyers
FROM repeat_customers rc
CROSS JOIN total_customers tc;