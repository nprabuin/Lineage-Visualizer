-- Customers Table
CREATE OR REPLACE TABLE project.dataset.customers (
    customer_id STRING NOT NULL,
    name STRING,
    email STRING,
    phone STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY (customer_id)
);

-- Products Table
CREATE OR REPLACE TABLE project.dataset.products (
    product_id STRING NOT NULL,
    name STRING,
    category STRING,
    price FLOAT64,
    stock_quantity INT64,
    PRIMARY KEY (product_id)
);

-- Orders Table
CREATE OR REPLACE TABLE project.dataset.orders (
    order_id STRING NOT NULL,
    customer_id STRING NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    total_amount FLOAT64,
    status STRING,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES project.dataset.customers(customer_id)
);

-- Order Items Table
CREATE OR REPLACE TABLE project.dataset.order_items (
    order_item_id STRING NOT NULL,
    order_id STRING NOT NULL,
    product_id STRING NOT NULL,
    quantity INT64,
    price FLOAT64,
    PRIMARY KEY (order_item_id),
    FOREIGN KEY (order_id) REFERENCES project.dataset.orders(order_id),
    FOREIGN KEY (product_id) REFERENCES project.dataset.products(product_id)
);

-- Insert Statements
INSERT INTO project.dataset.customers (customer_id, name, email, phone)
VALUES ('CUST001', 'John Doe', 'john.doe@example.com', '+123456789');

INSERT INTO project.dataset.products (product_id, name, category, price, stock_quantity)
VALUES ('PROD001', 'Laptop', 'Electronics', 1200.99, 50);

INSERT INTO project.dataset.orders (order_id, customer_id, total_amount, status)
VALUES ('ORD001', 'CUST001', 1200.99, 'Pending');

INSERT INTO project.dataset.order_items (order_item_id, order_id, product_id, quantity, price)
VALUES ('ITEM001', 'ORD001', 'PROD001', 1, 1200.99);

-- Update Order Status
UPDATE project.dataset.orders
SET status = 'Shipped'
WHERE order_id = 'ORD001';

-- Merge New Product Data (Upsert Example)
MERGE INTO project.dataset.products AS target
USING (
    SELECT 'PROD002' AS product_id, 'Smartphone' AS name, 'Electronics' AS category, 899.99 AS price, 100 AS stock_quantity
) AS source
ON target.product_id = source.product_id
WHEN MATCHED THEN
    UPDATE SET name = source.name, category = source.category, price = source.price, stock_quantity = source.stock_quantity
WHEN NOT MATCHED THEN
    INSERT (product_id, name, category, price, stock_quantity)
    VALUES (source.product_id, source.name, source.category, source.price, source.stock_quantity);

-- Select Queries
SELECT o.order_id, c.name AS customer_name, o.order_date, o.total_amount, o.status
FROM project.dataset.orders o
JOIN project.dataset.customers c ON o.customer_id = c.customer_id;

SELECT oi.order_id, p.name AS product_name, oi.quantity, oi.price, o.status
FROM project.dataset.order_items oi
JOIN project.dataset.products p ON oi.product_id = p.product_id
JOIN project.dataset.orders o ON oi.order_id = o.order_id;

SELECT p.name AS product_name, SUM(oi.quantity * oi.price) AS total_revenue
FROM project.dataset.order_items oi
JOIN project.dataset.products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_revenue DESC;
