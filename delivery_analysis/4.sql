SELECT
    CASE WHEN orders.order_delivered_customer_date > orders.order_estimated_delivery_date THEN 'Late' ELSE 'On time' END AS DeliveryStatus,
    AVG(order_reviews.review_score) AS AvgReviewScore,
    COUNT(*) AS OrderCount
FROM orders 
JOIN order_reviews 
    ON o.order_id = orv.order_id
WHERE orders.order_delivered_customer_date IS NOT NULL
  AND orders.order_estimated_delivery_date IS NOT NULL
GROUP BY DeliveryStatus
ORDER BY DeliveryStatus;