-- Which product category receive the highest average review score?
SELECT
   products.product_category_name AS ProductCategoryName,
   AVG(review_score) AS HighestAverageReviewScore
FROM
    products
JOIN order_items
ON products.product_id = order_items.product_id
JOIN order_reviews
ON order_reviews.order_id = order_items.order_id
GROUP BY ProductCategoryName
ORDER BY HighestAverageReviewScore DESC;