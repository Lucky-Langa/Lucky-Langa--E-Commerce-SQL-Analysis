-- Which product categories receive the lowest ratings?
SELECT
    products.product_category_name AS ProductCategoryName,
    review_score AS ReviewScore
FROM products
JOIN order_items
ON products.product_id = order_items.product_id
JOIN order_reviews
ON order_items.order_id = order_reviews.order_id
GROUP BY ProductCategoryName
ORDER BY ReviewScore ASC;