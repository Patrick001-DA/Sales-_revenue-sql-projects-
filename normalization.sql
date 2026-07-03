-- 1) Load unique orders
INSERT INTO orders (
    order_id,
    order_code,
    sale_date,
    transaction_type,
    sale_type,
    sales_channel
)
SELECT DISTINCT
    order_id,
    order_code,
    sale_date,
    transaction_type,
    sale_type,
    sales_channel
FROM sales_raw;

-- 2) Load unique products
INSERT INTO products (
    product_type,
    product_name
)
SELECT DISTINCT
    product_type,
    product_name
FROM sales_raw;

-- 3) Load sales rows by matching raw rows to products
INSERT INTO sales (
    sale_id,
    order_id,
    product_id,
    net_quantity,
    gross_sales,
    discounts,
    returns,
    net_sales,
    shipping,
    taxes,
    total_sales
)
SELECT
    sr.sale_id,
    sr.order_id,
    p.product_id,
    sr.net_quantity,
    sr.gross_sales,
    sr.discounts,
    sr.returns,
    sr.net_sales,
    sr.shipping,
    sr.taxes,
    sr.total_sales
FROM sales_raw sr
JOIN products p
    ON sr.product_type = p.product_type
   AND sr.product_name = p.product_name;
