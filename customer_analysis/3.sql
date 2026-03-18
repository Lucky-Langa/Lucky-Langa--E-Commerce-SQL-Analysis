SELECT
    COUNT(customer_state) AS NumberOfState,
    customer_state
FROM
    customers
GROUP BY customer_state
ORDER BY NumberOfState DESC;