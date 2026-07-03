-- Beginner
SELECT * FROM sales_raw;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM sales;

-- Total revenue
SELECT SUM(total_sales) AS total_revenue
FROM sales;

-- Total sales by channel
SELECT o.sales_channel, SUM(s.total_sales) AS total_sales
FROM sales s
JOIN orders o ON s.order_id = o.order_id
GROUP BY o.sales_channel;

-- Total sales by product type
SELECT p.product_type, SUM(s.total_sales) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_type;

-- Full report
SELECT
    o.order_code,
    o.sale_date,
    o.sales_channel,
    o.transaction_type,
    p.product_name,
    p.product_type,
    s.net_quantity,
    s.gross_sales,
    s.discounts,
    s.returns,
    s.net_sales,
    s.taxes,
    s.total_sales
FROM sales s
JOIN orders o ON s.order_id = o.order_id
JOIN products p ON s.product_id = p.product_id;

-- CASE example
SELECT
    sale_id,
    total_sales,
    CASE
        WHEN total_sales >= 1000 THEN 'High Sale'
        WHEN total_sales >= 500 THEN 'Medium Sale'
        ELSE 'Low Sale'
    END AS sale_category
FROM sales;

-- Subquery example
SELECT *
FROM sales
WHERE total_sales > (
    SELECT AVG(total_sales)
    FROM sales
);

-- View
CREATE VIEW sales_report AS
SELECT
    o.order_code,
    o.sale_date,
    o.sales_channel,
    p.product_name,
    s.net_sales,
    s.total_sales
FROM sales s
JOIN orders o ON s.order_id = o.order_id
JOIN products p ON s.product_id = p.product_id;

-- CTE example
WITH monthly_sales AS (
    SELECT
        YEAR(o.sale_date) AS sales_year,
        MONTH(o.sale_date) AS sales_month,
        SUM(s.total_sales) AS monthly_revenue
    FROM sales s
    JOIN orders o ON s.order_id = o.order_id
    GROUP BY YEAR(o.sale_date), MONTH(o.sale_date)
)
SELECT *
FROM monthly_sales
ORDER BY sales_year, sales_month;

-- Window function example
SELECT
    p.product_name,
    SUM(s.total_sales) AS total_revenue,
    RANK() OVER (ORDER BY SUM(s.total_sales) DESC) AS revenue_rank
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;
