-- 15.	Which products have the highest shipping costs relative to price?
SELECT
    freight_value AS ShippingValue,
    price AS ProductPrice
FROM
    order_items
ORDER BY ShippingValue DESC;