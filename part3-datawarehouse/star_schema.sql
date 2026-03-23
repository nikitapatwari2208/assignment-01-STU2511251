DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_date;
DROP TABLE IF EXISTS dim_store;
DROP TABLE IF EXISTS dim_product;

CREATE TABLE dim_date (
    date_id INTEGER PRIMARY KEY,
    full_date TEXT NOT NULL,
    day INTEGER NOT NULL,
    month INTEGER NOT NULL,
    month_name TEXT NOT NULL,
    year INTEGER NOT NULL
);

CREATE TABLE dim_store (
    store_id INTEGER PRIMARY KEY,
    store_name TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL
);

CREATE TABLE dim_product (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE fact_sales (
    sales_id INTEGER PRIMARY KEY,
    date_id INTEGER NOT NULL,
    store_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price REAL NOT NULL,
    total_revenue REAL NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

INSERT INTO dim_date (date_id, full_date, day, month, month_name, year) VALUES
(20240101, '2024-01-01', 1, 1, 'January', 2024),
(20240102, '2024-01-02', 2, 1, 'January', 2024),
(20240103, '2024-01-03', 3, 1, 'January', 2024),
(20240201, '2024-02-01', 1, 2, 'February', 2024),
(20240202, '2024-02-02', 2, 2, 'February', 2024);

INSERT INTO dim_store (store_id, store_name, city, state) VALUES
(1, 'Store A', 'Mumbai', 'Maharashtra'),
(2, 'Store B', 'Delhi', 'Delhi'),
(3, 'Store C', 'Bangalore', 'Karnataka');

INSERT INTO dim_product (product_id, product_name, category) VALUES
(1, 'Laptop', 'Electronics'),
(2, 'T-Shirt', 'Clothing'),
(3, 'Rice Bag', 'Groceries'),
(4, 'Mobile Phone', 'Electronics');

INSERT INTO fact_sales (sales_id, date_id, store_id, product_id, quantity, unit_price, total_revenue) VALUES
(1, 20240101, 1, 1, 1, 55000, 55000),
(2, 20240101, 1, 2, 3, 800, 2400),
(3, 20240102, 2, 3, 5, 900, 4500),
(4, 20240102, 3, 4, 1, 30000, 30000),
(5, 20240103, 2, 2, 4, 800, 3200),
(6, 20240201, 1, 3, 3, 900, 2700),
(7, 20240201, 3, 1, 1, 55000, 55000),
(8, 20240202, 2, 4, 2, 30000, 60000),
(9, 20240202, 3, 2, 5, 800, 4000),
(10, 20240202, 1, 3, 2, 900, 1800);