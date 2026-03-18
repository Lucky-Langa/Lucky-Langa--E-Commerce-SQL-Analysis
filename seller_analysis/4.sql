SELECT order_items.seller_id AS seller_id,
    COUNT(orders.order_status) AS order_count
FROM order_items
    JOIN orders ON order_items.order_id = orders.order_id
WHERE orders.order_status = 'canceled'
GROUP BY seller_id
ORDER BY order_count DESC;