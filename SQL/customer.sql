-- Customers Table
CREATE OR REPLACE TABLE project.dataset.customers (
    customer_id STRING NOT NULL,
    name STRING,
    email STRING,
    phone STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY (customer_id)
);
