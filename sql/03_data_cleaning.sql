
-- DATA CLEANING


-- 1. Find records containing NULL values
SELECT *
FROM zepto
WHERE
    name IS NULL
    OR category IS NULL
    OR mrp IS NULL
    OR discountpercent IS NULL
    OR availablequantity IS NULL
    OR discountedsellingprice IS NULL
    OR weightingms IS NULL
    OR outofstock IS NULL
    OR quantity IS NULL;

-- 2. Find zero or negative prices
SELECT *
FROM zepto
WHERE mrp <= 0
   OR discountedsellingprice <= 0;

-- 3. Find negative quantities
SELECT *
FROM zepto
WHERE availablequantity < 0
   OR quantity < 0;

-- 4. Find invalid discount percentages
SELECT *
FROM zepto
WHERE discountpercent < 0
   OR discountpercent > 100;

-- 5. Selling price greater than MRP
SELECT *
FROM zepto
WHERE discountedsellingprice > mrp;

-- 6. Find zero or negative product weight
SELECT *
FROM zepto
WHERE weightingms <= 0;

-- 7. Identify stock inconsistencies
SELECT *
FROM zepto
WHERE
    (outofstock = TRUE AND availablequantity > 0)
    OR
    (outofstock = FALSE AND availablequantity = 0);

-- 8. Check exact duplicate records
SELECT
    category,
    name,
    mrp,
    discountpercent,
    availablequantity,
    discountedsellingprice,
    weightingms,
    outofstock,
    quantity,
    COUNT(*) AS duplicate_count
FROM zepto
GROUP BY
    category,
    name,
    mrp,
    discountpercent,
    availablequantity,
    discountedsellingprice,
    weightingms,
    outofstock,
    quantity
HAVING COUNT(*) > 1;
