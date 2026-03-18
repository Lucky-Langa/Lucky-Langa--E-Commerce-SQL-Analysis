	-- What categories generate high sales but low customer satisfaction?
SELECT
    products.product_category_name AS ProductCategoryName,
    SUM(order_payments.payment_value) ProductRevenue,
    order_reviews.review_score AS ReviewScore
FROM products
JOIN order_items
ON products.product_id = order_items.product_id
JOIN order_reviews
ON order_items.order_id = order_reviews.order_id
JOIN order_payments
ON order_reviews.order_id = order_payments.order_id
GROUP BY ProductCategoryName
ORDER BY ReviewScore ASC;