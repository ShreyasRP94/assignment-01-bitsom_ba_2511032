-- 3NF Schema Design

CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL UNIQUE,
    customer_city VARCHAR(50) NOT NULL
);

INSERT INTO customers VALUES
('C001', 'John Doe', 'john@example.com', 'Mumbai'),
('C002', 'Jane Smith', 'jane@example.com', 'Delhi'),
('C003', 'Amit Kumar', 'amit@example.com', 'Pune'),
('C004', 'Sara Khan', 'sara@example.com', 'Mumbai'),
('C005', 'Rohit Sharma', 'rohit@example.com', 'Bangalore');

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

INSERT INTO products VALUES
('P001', 'Laptop', 'Electronics', 55000.00),
('P002', 'Mobile', 'Electronics', 20000.00),
('P003', 'Tablet', 'Electronics', 30000.00),
('P004', 'Headphones', 'Accessories', 2000.00),
('P005', 'Keyboard', 'Accessories', 1500.00);


CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL UNIQUE,
    office_address VARCHAR(150) NOT NULL
);

INSERT INTO sales_reps VALUES
('S001', 'Raj Malhotra', 'raj@company.com', 'Mumbai HQ'),
('S002', 'Neha Kapoor', 'neha@company.com', 'Delhi Office'),
('S003', 'Arjun Nair', 'arjun@company.com', 'Bangalore Office'),
('S004', 'Pooja Shah', 'pooja@company.com', 'Pune Office'),
('S005', 'Karan Patel', 'karan@company.com', 'Chennai Office');

CREATE TABLE orders (
    order_id VARCHAR(15) PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

INSERT INTO orders VALUES
('ORD1001', '2024-01-10', 'C001', 'S001'),
('ORD1002', '2024-01-12', 'C002', 'S002'),
('ORD1003', '2024-01-15', 'C003', 'S003'),
('ORD1004', '2024-01-18', 'C004', 'S001'),
('ORD1005', '2024-01-20', 'C005', 'S004');

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id VARCHAR(15) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1, 'ORD1001', 'P001', 1),
(2, 'ORD1001', 'P004', 2),
(3, 'ORD1002', 'P002', 1),
(4, 'ORD1003', 'P003', 1),
(5, 'ORD1004', 'P005', 3);

