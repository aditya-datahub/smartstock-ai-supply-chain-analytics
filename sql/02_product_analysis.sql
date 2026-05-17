-- =============================================
-- FILE: 02_product_analysis.sql
-- PURPOSE: Product Performance Analysis
-- Project: SmartStock AI
-- =============================================

-- Query 3: Top 10 Selling Products
SELECT 
    p.product_name,
    p.category,
    COUNT(*) AS total_orders,
    SUM(o.quantity) AS total_quantity_sold,
    ROUND(SUM(o.order_amount)::NUMERIC, 2) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 10;

-- Query 4: Category Wise Revenue
SELECT 
    p.category,
    COUNT(*) AS total_orders,
    SUM(o.quantity) AS total_quantity_sold,
    ROUND(SUM(o.order_amount)::NUMERIC, 2) AS total_revenue,
    ROUND(100.0 * SUM(o.order_amount) / SUM(SUM(o.order_amount)) OVER(), 2) AS revenue_percentage
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Query 5: Stockout Rate by Product
SELECT 
    p.product_name,
    p.category,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN o.order_status = 'Cancelled' THEN 1 ELSE 0 END) AS stockout_orders,
    ROUND(100.0 * SUM(CASE WHEN o.order_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*), 2) AS stockout_rate
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name, p.category
ORDER BY stockout_rate DESC
LIMIT 10;