SELECT AVG(
        julianday(order_delivered_customer_date) -
        julianday(order_purchase_timestamp)
    ) AS AverageDeliveryDays
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
    AND order_purchase_timestamp IS NOT NULL;