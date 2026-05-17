-- =============================================
-- FILE: 04_warehouse_analysis.sql
-- PURPOSE: Warehouse Performance Analysis
-- Project: SmartStock AI
-- =============================================

-- Query 9: Warehouse Wise Revenue
SELECT 
    w.warehouse_id,
    w.city,
    w.area,
    COUNT(*) AS total_orders,
    ROUND(SUM(o.order_amount)::NUMERIC, 2) AS total_revenue,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS order_percentage
FROM orders o
JOIN warehouses w ON o.warehouse_id = w.warehouse_id
WHERE o.order_status = 'Delivered'
GROUP BY w.warehouse_id, w.city, w.area
ORDER BY total_revenue DESC;

-- Query 10: Top Underperforming Warehouses
SELECT 
    w.warehouse_id,
    w.city,
    w.area,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN o.order_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(100.0 * SUM(CASE WHEN o.order_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*), 2) AS cancellation_rate,
    w.utilization_rate
FROM orders o
JOIN warehouses w ON o.warehouse_id = w.warehouse_id
GROUP BY w.warehouse_id, w.city, w.area, w.utilization_rate
ORDER BY cancellation_rate DESC;

-- Query 11: Delivery Delay Analysis
SELECT 
    w.warehouse_id,
    w.city,
    w.area,
    COUNT(*) AS total_deliveries,
    SUM(CASE WHEN d.delivery_status = 'Delayed' THEN 1 ELSE 0 END) AS delayed_deliveries,
    ROUND(100.0 * SUM(CASE WHEN d.delivery_status = 'Delayed' THEN 1 ELSE 0 END) / COUNT(*), 2) AS delay_rate,
    ROUND(AVG(d.delay_days)::NUMERIC, 2) AS avg_delay_days
FROM deliveries d
JOIN orders o ON d.order_id = o.order_id
JOIN warehouses w ON o.warehouse_id = w.warehouse_id
GROUP BY w.warehouse_id, w.city, w.area
ORDER BY delay_rate DESC;
