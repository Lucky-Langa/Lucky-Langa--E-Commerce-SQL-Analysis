SELECT
    COUNT(products.product_category_name) AS category_count,
    order_items.seller_id AS seller_id
FROM products
JOIN order_items
ON products.product_id = order_items.product_id
GROUP BY seller_id
ORDER BY category_count DESC;