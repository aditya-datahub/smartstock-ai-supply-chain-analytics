-- =============================================
-- FILE: 03_revenue_stockout.sql
-- PURPOSE: Revenue & Stockout Analysis
-- Project: SmartStock AI
-- =============================================

-- Query 6: Lost Revenue Due to Stockouts
SELECT 
    p.product_name,
    p.category,
    COUNT(*) AS stockout_orders,
    ROUND(SUM(o.order_amount)::NUMERIC, 2) AS lost_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.order_status = 'Cancelled'
GROUP BY p.product_name, p.category
ORDER BY lost_revenue DESC
LIMIT 10;

-- Query 7: Monthly Sales Trend
SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    COUNT(*) AS total_orders,
    ROUND(SUM(order_amount)::NUMERIC, 2) AS total_revenue,
    ROUND(SUM(CASE WHEN order_status = 'Cancelled' THEN order_amount ELSE 0 END)::NUMERIC, 2) AS lost_revenue
FROM orders
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY month;

-- Query 8: Weekend vs Weekday Sales
SELECT 
    CASE 
        WHEN EXTRACT(DOW FROM order_date) IN (0, 6) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(*) AS total_orders,
    ROUND(SUM(order_amount)::NUMERIC, 2) AS total_revenue,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS order_percentage
FROM orders
WHERE order_status = 'Delivered'
GROUP BY day_type
ORDER BY total_revenue DESC;