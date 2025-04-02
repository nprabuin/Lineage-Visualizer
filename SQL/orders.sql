
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