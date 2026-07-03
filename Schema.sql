CREATE TABLE orders (
    order_id BIGINT PRIMARY KEY,
    order_code VARCHAR(30),
    sale_date DATETIME,
    transaction_type VARCHAR(30),
    sale_type VARCHAR(30),
    sales_channel VARCHAR(50)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_type VARCHAR(100),
    product_name VARCHAR(255),
    UNIQUE (product_type, product_name)
);

CREATE TABLE sales (
    sale_id BIGINT PRIMARY KEY,
    order_id BIGINT,
    product_id INT,
    net_quantity INT,
    gross_sales DECIMAL(12,2),
    discounts DECIMAL(12,2),
    returns DECIMAL(12,2),
    net_sales DECIMAL(12,2),
    shipping DECIMAL(12,2),
    taxes DECIMAL(12,2),
    total_sales DECIMAL(12,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
