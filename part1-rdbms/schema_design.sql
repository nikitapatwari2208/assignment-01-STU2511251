

CREATE TABLE customers (
    customer_id TEXT PRIMARY KEY,
    customer_name TEXT NOT NULL,
    customer_email TEXT NOT NULL UNIQUE,
    customer_city TEXT NOT NULL
);

CREATE TABLE products (
    product_id TEXT PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    unit_price REAL NOT NULL CHECK (unit_price > 0)
);

CREATE TABLE sales_reps (
    sales_rep_id TEXT PRIMARY KEY,
    sales_rep_name TEXT NOT NULL,
    sales_rep_email TEXT NOT NULL UNIQUE,
    office_address TEXT NOT NULL
);

CREATE TABLE orders (
    order_id TEXT PRIMARY KEY,
    order_date TEXT NOT NULL,
    customer_id TEXT NOT NULL,
    sales_rep_id TEXT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

CREATE TABLE order_items (
    order_id TEXT NOT NULL,
    product_id TEXT NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, customer_name, customer_email, customer_city) VALUES
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');

INSERT INTO products (product_id, product_name, category, unit_price) VALUES
('P001', 'Laptop', 'Electronics', 55000),
('P002', 'Mouse', 'Electronics', 800),
('P003', 'Desk Chair', 'Furniture', 8500),
('P004', 'Notebook', 'Stationery', 120),
('P005', 'Headphones', 'Electronics', 3200);

INSERT INTO sales_reps (sales_rep_id, sales_rep_name, sales_rep_email, office_address) VALUES
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001'),
('SR04', 'Meera Nair', 'meera@corp.com', 'Chennai Office, T Nagar, Chennai - 600017'),
('SR05', 'Karan Malhotra', 'karan@corp.com', 'Hyderabad Office, Banjara Hills, Hyderabad - 500034');

INSERT INTO orders (order_id, order_date, customer_id, sales_rep_id) VALUES
('ORD1000', '2023-05-21', 'C002', 'SR03'),
('ORD1001', '2023-02-22', 'C004', 'SR03'),
('ORD1002', '2023-01-17', 'C002', 'SR02'),
('ORD1003', '2023-09-16', 'C002', 'SR01'),
('ORD1004', '2023-11-29', 'C001', 'SR01');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
('ORD1000', 'P001', 2),
('ORD1001', 'P002', 5),
('ORD1002', 'P005', 1),
('ORD1003', 'P002', 5),
('ORD1004', 'P005', 5);

-- Q1: View all customers
SELECT * FROM customers;

-- Q2: View all products
SELECT * FROM products;

-- Q3: View all orders
SELECT * FROM orders;

-- Q4: View all order items
SELECT * FROM order_items;