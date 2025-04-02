
-- Insert Statements
INSERT INTO project.dataset.customers (customer_id, name, email, phone)
VALUES ('CUST001', 'John Doe', 'john.doe@example.com', '+123456789');

INSERT INTO project.dataset.products (product_id, name, category, price, stock_quantity)
VALUES ('PROD001', 'Laptop', 'Electronics', 1200.99, 50);

INSERT INTO project.dataset.orders (order_id, customer_id, total_amount, status)
VALUES ('ORD001', 'CUST001', 1200.99, 'Pending');

INSERT INTO project.dataset.order_items (order_item_id, order_id, product_id, quantity, price)
VALUES ('ITEM001', 'ORD001', 'PROD001', 1, 1200.99);
