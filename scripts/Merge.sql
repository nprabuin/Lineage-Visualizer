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

