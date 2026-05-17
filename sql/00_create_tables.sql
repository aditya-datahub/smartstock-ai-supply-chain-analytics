-- Products table
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    selling_price NUMERIC,
    unit VARCHAR(20)
);

Select * from products;


-- Warehouses table
CREATE TABLE warehouses (
    warehouse_id VARCHAR(10) PRIMARY KEY,
    city VARCHAR(50),
    area VARCHAR(50),
    capacity INTEGER,
    utilization_rate NUMERIC
);

Select * from warehouses;


-- Inventory table
CREATE TABLE inventory (
    inventory_id VARCHAR(10) PRIMARY KEY,
    product_id VARCHAR(10),
    warehouse_id VARCHAR(10),
    stock_available INTEGER,
    reorder_level INTEGER,
    last_restock_date DATE
);

Select * from inventory;


-- Orders table
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    product_id VARCHAR(10),
    warehouse_id VARCHAR(10),
    quantity INTEGER,
    order_date DATE,
    order_amount NUMERIC,
    order_status VARCHAR(20)
);

Select * from orders;


-- Deliveries table
CREATE TABLE deliveries (
    delivery_id VARCHAR(10) PRIMARY KEY,
    order_id VARCHAR(10),
    expected_date DATE,
    delivery_date DATE,
    delivery_status VARCHAR(20),
    delay_days INTEGER
);

Select * from deliveries;