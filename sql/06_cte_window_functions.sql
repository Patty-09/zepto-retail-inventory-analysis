
--  CTEs AND WINDOW FUNCTIONS


-- 1. Rank top 3 expensive products in each category

WITH product_ranking AS
(
    SELECT
        name,
        category,
        discountedsellingprice,
        DENSE_RANK() OVER(
            PARTITION BY category
            ORDER BY discountedsellingprice DESC
        ) AS product_rank
    FROM zepto
)
SELECT *
FROM product_ranking
WHERE product_rank <= 3
ORDER BY category, product_rank;


-- 2. Calculate category contribution to inventory value

WITH category_value AS
(
    SELECT
        category,
        SUM(discountedsellingprice * availablequantity) AS inventory_value
    FROM zepto
    GROUP BY category
)
SELECT
    category,
    ROUND(inventory_value, 2) AS inventory_value,
    ROUND(
        inventory_value * 100.0 /
        NULLIF(SUM(inventory_value) OVER(), 0),
        2
    ) AS contribution_percentage
FROM category_value
ORDER BY contribution_percentage DESC;


-- 3. Compare product selling price with category average

SELECT
    name,
    category,
    discountedsellingprice,

    ROUND(
        AVG(discountedsellingprice) OVER(
            PARTITION BY category
        ), 2
    ) AS category_average_price,

    ROUND(
        discountedsellingprice -
        AVG(discountedsellingprice) OVER(
            PARTITION BY category
        ), 2
    ) AS price_difference

FROM zepto;


-- 4. Rank products based on discount percentage

SELECT
    name,
    category,
    discountpercent,
    RANK() OVER(
        ORDER BY discountpercent DESC
    ) AS discount_rank
FROM zepto;


-- 5. Find top 3 products by inventory value in each category

WITH inventory_ranking AS
(
    SELECT
        name,
        category,
        availablequantity,
        discountedsellingprice,

        discountedsellingprice * availablequantity AS inventory_value,

        DENSE_RANK() OVER(
            PARTITION BY category
            ORDER BY discountedsellingprice * availablequantity DESC
        ) AS inventory_rank

    FROM zepto
)
SELECT *
FROM inventory_ranking
WHERE inventory_rank <= 3
ORDER BY category, inventory_rank;


-- 6. Calculate cumulative inventory value across categories

WITH category_value AS
(
    SELECT
        category,
        SUM(discountedsellingprice * availablequantity) AS inventory_value
    FROM zepto
    GROUP BY category
)
SELECT
    category,
    inventory_value,

    SUM(inventory_value) OVER(
        ORDER BY inventory_value DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_inventory_value

FROM category_value;


-- 7. Compare product discount with average category discount

SELECT
    name,
    category,
    discountpercent,

    ROUND(
        AVG(discountpercent) OVER(
            PARTITION BY category
        ), 2
    ) AS category_avg_discount,

    ROUND(
        discountpercent -
        AVG(discountpercent) OVER(
            PARTITION BY category
        ), 2
    ) AS discount_difference

FROM zepto;
