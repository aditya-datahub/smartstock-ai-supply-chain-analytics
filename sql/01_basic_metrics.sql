-- =============================================
-- FILE: 01_basic_metrics.sql
-- PURPOSE: Basic Business KPI Metrics
-- Project: SmartStock AI
-- =============================================

-- Query 1: Total Revenue
SELECT 
    ROUND(SUM(order_amount)::NUMERIC, 2) AS total_revenue,
    COUNT(*) AS total_orders
FROM orders
WHERE order_status = 'Delivered';

-- Query 2: Total Orders & Cancellations
SELECT 
    order_status,
    COUNT(*) AS total_orders,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;