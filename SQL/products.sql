-- Products Table
CREATE OR REPLACE TABLE project.dataset.products (
    product_id STRING NOT NULL,
    name STRING,
    category STRING,
    price FLOAT64,
    stock_quantity INT64,
    PRIMARY KEY (product_id)
);