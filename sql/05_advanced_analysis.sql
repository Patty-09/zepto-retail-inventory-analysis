
-- ADVANCED BUSINESS ANALYSIS


-- 1. Products priced above their category average

SELECT
    z.name,
    z.category,
    z.discountedsellingprice
FROM zepto z
WHERE z.discountedsellingprice >
(
    SELECT AVG(z2.discountedsellingprice)
    FROM zepto z2
    WHERE z2.category = z.category
)
ORDER BY z.category;


-- 2. Calculate actual discount amount per product

SELECT
    name,
    category,
    mrp,
    discountedsellingprice,
    ROUND(mrp - discountedsellingprice, 2) AS discount_amount
FROM zepto
ORDER BY discount_amount DESC;


-- 3. Categorize products based on discount

SELECT
    name,
    category,
    discountpercent,
    CASE
        WHEN discountpercent >= 50 THEN 'High Discount'
        WHEN discountpercent >= 20 THEN 'Medium Discount'
        WHEN discountpercent > 0 THEN 'Low Discount'
        ELSE 'No Discount'
    END AS discount_category
FROM zepto;


-- 4. Identify critical inventory products

SELECT
    name,
    category,
    availablequantity,
    CASE
        WHEN availablequantity = 0 THEN 'Out of Stock'
        WHEN availablequantity <= 5 THEN 'Critical'
        WHEN availablequantity <= 20 THEN 'Low Stock'
        ELSE 'Healthy Stock'
    END AS inventory_status
FROM zepto
ORDER BY availablequantity ASC;


-- 5. Compare MRP inventory value and selling inventory value

SELECT
    category,
    ROUND(SUM(mrp * availablequantity), 2) AS mrp_inventory_value,
    ROUND(
        SUM(discountedsellingprice * availablequantity), 2
    ) AS selling_inventory_value,
    ROUND(
        SUM((mrp - discountedsellingprice) * availablequantity), 2
    ) AS potential_discount_value
FROM zepto
GROUP BY category
ORDER BY selling_inventory_value DESC;


-- 6. Find products with the highest absolute discount

SELECT
    name,
    category,
    mrp,
    discountedsellingprice,
    ROUND(mrp - discountedsellingprice, 2) AS discount_amount
FROM zepto
ORDER BY discount_amount DESC
LIMIT 20;


-- 7. Identify products marked out of stock but having inventory

SELECT
    sku_id,
    name,
    category,
    availablequantity,
    outofstock
FROM zepto
WHERE outofstock = TRUE
  AND availablequantity > 0;


-- 8. Identify products with the highest inventory quantity

SELECT
    name,
    category,
    availablequantity
FROM zepto
ORDER BY availablequantity DESC
LIMIT 20;


-- 9. Find products with no discount

SELECT
    name,
    category,
    mrp,
    discountedsellingprice,
    discountpercent
FROM zepto
WHERE discountpercent = 0
ORDER BY mrp DESC;


-- 10. Calculate the percentage of products out of stock

SELECT
    COUNT(*) AS total_products,
    COUNT(*) FILTER (
        WHERE outofstock = TRUE
    ) AS out_of_stock_products,
    ROUND(
        COUNT(*) FILTER (WHERE outofstock = TRUE) * 100.0
        / NULLIF(COUNT(*), 0),
        2
    ) AS out_of_stock_percentage
FROM zepto;
