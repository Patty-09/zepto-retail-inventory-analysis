
-- DATA EXPLORATION

-- 1. Total records
SELECT COUNT(*) AS total_records
FROM zepto;

-- 2. Total unique product names
SELECT COUNT(DISTINCT name) AS unique_products
FROM zepto;

-- 3. Total categories
SELECT COUNT(DISTINCT category) AS total_categories
FROM zepto;

-- 4. Overall price statistics
SELECT
    ROUND(MIN(mrp), 2) AS minimum_mrp,
    ROUND(MAX(mrp), 2) AS maximum_mrp,
    ROUND(AVG(mrp), 2) AS average_mrp,
    ROUND(AVG(discountedsellingprice), 2) AS average_selling_price
FROM zepto;

-- 5. Category-wise product count
SELECT
    category,
    COUNT(*) AS total_skus,
    COUNT(DISTINCT name) AS unique_products
FROM zepto
GROUP BY category
ORDER BY total_skus DESC;

-- 6. Check duplicate product names
SELECT
    name,
    COUNT(*) AS duplicate_count
FROM zepto
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- 7. Check NULL values column-wise
SELECT
    COUNT(*) FILTER (WHERE name IS NULL) AS null_name,
    COUNT(*) FILTER (WHERE category IS NULL) AS null_category,
    COUNT(*) FILTER (WHERE mrp IS NULL) AS null_mrp,
    COUNT(*) FILTER (WHERE discountpercent IS NULL) AS null_discount,
    COUNT(*) FILTER (WHERE availablequantity IS NULL) AS null_available_quantity,
    COUNT(*) FILTER (WHERE discountedsellingprice IS NULL) AS null_selling_price,
    COUNT(*) FILTER (WHERE weightingms IS NULL) AS null_weight,
    COUNT(*) FILTER (WHERE outofstock IS NULL) AS null_stock_status,
    COUNT(*) FILTER (WHERE quantity IS NULL) AS null_quantity
FROM zepto;
