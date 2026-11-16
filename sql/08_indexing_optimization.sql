
--  INDEXING AND QUERY OPTIMIZATION


-- 1. Create index on category

CREATE INDEX IF NOT EXISTS idx_zepto_category
ON zepto(category);


-- 2. Create index on stock status

CREATE INDEX IF NOT EXISTS idx_zepto_outofstock
ON zepto(outofstock);


-- 3. Create composite index

CREATE INDEX IF NOT EXISTS idx_zepto_category_stock
ON zepto(category, outofstock);


-- 4. Analyze table statistics

ANALYZE zepto;


-- 5. Check query execution plan

EXPLAIN ANALYZE
SELECT *
FROM zepto
WHERE category = 'Munchies';


-- 6. Check execution plan for stock filtering

EXPLAIN ANALYZE
SELECT *
FROM zepto
WHERE outofstock = TRUE;


-- 7. Check execution plan for price filtering

EXPLAIN ANALYZE
SELECT *
FROM zepto
WHERE mrp > 500;
