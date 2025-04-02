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
