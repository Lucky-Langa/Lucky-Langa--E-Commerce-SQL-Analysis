	-- 16.	Which sellers have the highest total revenue?
SELECT
    seller_id,
    SUM(price) as Revenue
FROM 
    order_items
GROUP BY seller_id
ORDER BY Revenue DESC;