-- Which product categories are purchased the most?
SELECT
    products.product_category_name AS ProductCategoryName,
    COUNT(*) AS NumberOfProducts
FROM products
GROUP BY ProductCategoryName
ORDER BY NumberOfProducts DESC;