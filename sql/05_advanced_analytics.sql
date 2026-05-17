-- =============================================
-- FILE: 05_advanced_analytics.sql
-- PURPOSE: Advanced Analytics
-- Project: SmartStock AI
-- =============================================

-- Query 12: Rolling 7-Day Sales Trend
WITH daily_sales AS (
    SELECT 
        order_date,
        COUNT(*) AS daily_orders,
        ROUND(SUM(order_amount)::NUMERIC, 2) AS daily_revenue
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY order_date
)
SELECT 
    order_date,
    daily_orders,
    daily_revenue,
    ROUND(AVG(daily_revenue) OVER(
        ORDER BY order_date 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    )::NUMERIC, 2) AS rolling_7day_avg
FROM daily_sales
ORDER BY order_date;

-- Query 13: Inventory Turnover by Category
WITH category_sales AS (
    SELECT 
        p.category,
        SUM(o.quantity) AS total_sold
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY p.category
),
category_inventory AS (
    SELECT 
        p.category,
        AVG(i.stock_available) AS avg_stock
    FROM inventory i
    JOIN products p ON i.product_id = p.product_id
    GROUP BY p.category
)
SELECT 
    cs.category,
    cs.total_sold,
    ROUND(ci.avg_stock::NUMERIC, 2) AS avg_stock,
    ROUND((cs.total_sold / ci.avg_stock)::NUMERIC, 2) AS inventory_turnover
FROM category_sales cs
JOIN category_inventory ci ON cs.category = ci.category
ORDER BY inventory_turnover DESC;

-- Query 14: Month over Month Revenue Growth
WITH monthly_revenue AS (
    SELECT 
        TO_CHAR(order_date, 'YYYY-MM') AS month,
        ROUND(SUM(order_amount)::NUMERIC, 2) AS total_revenue
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY TO_CHAR(order_date, 'YYYY-MM')
)
SELECT 
    month,
    total_revenue,
    LAG(total_revenue) OVER(ORDER BY month) AS prev_month_revenue,
    ROUND(100.0 * (total_revenue - LAG(total_revenue) OVER(ORDER BY month)) 
    / LAG(total_revenue) OVER(ORDER BY month)::NUMERIC, 2) AS mom_growth
FROM monthly_revenue
ORDER BY month;

-- Query 15: Products at Stockout Risk
SELECT 
    p.product_name,
    p.category,
    w.city,
    i.stock_available,
    i.reorder_level,
    ROUND(100.0 * i.stock_available / i.reorder_level::NUMERIC, 2) AS stock_vs_reorder,
    CASE 
        WHEN i.stock_available = 0 THEN 'Critical - Out of Stock'
        WHEN i.stock_available <= i.reorder_level THEN 'High Risk - Reorder Now'
        WHEN i.stock_available <= i.reorder_level * 2 THEN 'Medium Risk - Monitor'
        ELSE 'Safe'
    END AS risk_level
FROM inventory i
JOIN products p ON i.product_id = p.product_id
JOIN warehouses w ON i.warehouse_id = w.warehouse_id
ORDER BY stock_vs_reorder ASC
LIMIT 20;