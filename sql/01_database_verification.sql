
--  DATABASE AND TABLE VERIFICATION

SELECT current_database();

SELECT *
FROM zepto
LIMIT 10;

-- Check total records
SELECT COUNT(*) AS total_records
FROM zepto;

-- Check table structure
SELECT
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'zepto'
ORDER BY ordinal_position;

-- Check distinct categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- Check stock distribution
SELECT
    outofstock,
    COUNT(*) AS total_products
FROM zepto
GROUP BY outofstock;
