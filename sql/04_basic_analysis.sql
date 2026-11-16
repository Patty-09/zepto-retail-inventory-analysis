
-- BASIC BUSINESS ANALYSIS


-- 1. Top 10 products offering highest discounts
SELECT DISTINCT
    name,
    category,
    mrp,
    discountpercent
FROM zepto
ORDER BY discountpercent DESC
LIMIT 10;


-- 2. High MRP products that are out of stock
SELECT
    name,
    category,
    mrp,
    outofstock
FROM zepto
WHERE outofstock = TRUE
  AND mrp > 300
ORDER BY mrp DESC;


-- 3. Estimated inventory selling value by category
SELECT
    category,
    ROUND(
        SUM(discountedsellingprice * availablequantity), 2
    ) AS estimated_inventory_value
FROM zepto
GROUP BY category
ORDER BY estimated_inventory_value DESC;


-- 4. Products with MRP above 500 and discount below 10%
SELECT DISTINCT
    name,
    category,
    mrp,
    discountpercent
FROM zepto
WHERE mrp > 500
  AND discountpercent < 10
ORDER BY mrp DESC;


-- 5. Top 5 categories offering highest average discounts
SELECT
    category,
    ROUND(AVG(discountpercent), 2) AS average_discount
FROM zepto
GROUP BY category
ORDER BY average_discount DESC
LIMIT 5;


-- 6. Best value products based on price per gram
SELECT
    name,
    category,
    discountedsellingprice,
    weightingms,
    ROUND(
        discountedsellingprice / NULLIF(weightingms, 0), 4
    ) AS price_per_gram
FROM zepto
WHERE weightingms >= 100
ORDER BY price_per_gram ASC
LIMIT 20;


-- 7. Product weight classification
SELECT
    name,
    weightingms,
    CASE
        WHEN weightingms < 1000 THEN 'Low'
        WHEN weightingms < 5000 THEN 'Medium'
        ELSE 'Bulk'
    END AS weight_category
FROM zepto;


-- 8. Total inventory weight by category
SELECT
    category,
    SUM(weightingms * availablequantity) AS total_inventory_weight_gms
FROM zepto
GROUP BY category
ORDER BY total_inventory_weight_gms DESC;


-- 9. Total products in stock vs out of stock
SELECT
    CASE
        WHEN outofstock = TRUE THEN 'Out of Stock'
        WHEN outofstock = FALSE THEN 'In Stock'
        ELSE 'Unknown'
    END AS stock_status,
    COUNT(*) AS total_skus
FROM zepto
GROUP BY stock_status;


-- 10. Average selling price by category
SELECT
    category,
    ROUND(AVG(discountedsellingprice), 2) AS avg_selling_price,
    ROUND(AVG(mrp), 2) AS avg_mrp
FROM zepto
GROUP BY category
ORDER BY avg_selling_price DESC;
