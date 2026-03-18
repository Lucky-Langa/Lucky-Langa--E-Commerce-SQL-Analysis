SELECT
    products.product_category_name AS ProductCategory,
    AVG(julianday(orders.order_delivered_customer_date) - julianday(o.order_purchase_timestamp)) AS AvgShippingDays,
    COUNT(*) AS OrderCount
FROM orders 
JOIN order_items 
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
WHERE orders.order_delivered_customer_date IS NOT NULL
 AND orders.order_purchase_timestamp IS NOT NULL
GROUP BY products.product_category_name
ORDER BY AvgShippingDays DESC;