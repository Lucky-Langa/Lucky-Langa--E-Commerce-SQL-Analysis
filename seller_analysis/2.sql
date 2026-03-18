-- 17. Which sellers deliver orders the fastest?
SELECT
    oi.seller_id AS SellerID,
    o.order_id AS OrderID,
    strftime('%Y-%m-%d', o.order_purchase_timestamp, o.order_delivered_customer_date) AS DeliveryDays,
    o.order_purchase_timestamp AS PurchaseDate,
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
ORDER BY DeliveryDays ASC;
