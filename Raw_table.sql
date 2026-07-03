CREATE TABLE sales_raw (
    order_id BIGINT,
    sale_id BIGINT,
    sale_date DATETIME,
    order_code VARCHAR(30),
    transaction_type VARCHAR(30),
    sale_type VARCHAR(30),
    sales_channel VARCHAR(50),
    product_type VARCHAR(100),
    product_name VARCHAR(255),
    net_quantity INT,
    gross_sales DECIMAL(12,2),
    discounts DECIMAL(12,2),
    returns DECIMAL(12,2),
    net_sales DECIMAL(12,2),
    shipping DECIMAL(12,2),
    taxes DECIMAL(12,2),
    total_sales DECIMAL(12,2)
);
