-- Update Order Status
UPDATE project.dataset.orders
SET status = 'Shipped'
WHERE order_id = 'ORD001';

