
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