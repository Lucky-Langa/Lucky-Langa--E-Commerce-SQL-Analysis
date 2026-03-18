SELECT
    order_items.seller_id AS SellerID,
    order_reviews.review_score AS ReviewScore
FROM order_items
JOIN order_reviews
ON order_items.order_id = order_reviews.order_id
GROUP BY SellerID
ORDER BY ReviewScore DESC;