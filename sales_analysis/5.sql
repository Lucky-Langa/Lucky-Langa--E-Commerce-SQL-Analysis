SELECT sellers.seller_id AS SellerID,
    AVG(order_items.price) AS AverageRevenue
FROM sellers
    JOIN order_items ON sellers.seller_id = order_items.seller_id
GROUP BY SellerID
ORDER BY AverageRevenue DESC;