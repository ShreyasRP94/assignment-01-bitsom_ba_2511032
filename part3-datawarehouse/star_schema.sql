CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

INSERT INTO dim_date VALUES
('2023-08-29', 29, 8, 2023),
('2023-12-12', 12, 12, 2023),
('2023-02-05', 5, 2, 2023),
('2023-02-20', 20, 2, 2023),
('2023-01-15', 15, 1, 2023);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_city VARCHAR(50) NOT NULL
);

INSERT INTO dim_store VALUES
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Mumbai Central', 'Mumbai'),
(4, 'Bangalore East', 'Bangalore'),
(5, 'Hyderabad West', 'Hyderabad');

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

INSERT INTO dim_product VALUES
(101, 'Laptop', 'Electronics'),
(102, 'Mobile', 'Electronics'),
(103, 'Shirt', 'Clothing'),
(104, 'Rice Bag', 'Groceries'),
(105, 'Headphones', 'Electronics');

CREATE TABLE fact_sales (
    transaction_id VARCHAR(20) PRIMARY KEY,
    date_id DATE NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    units_sold INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_sales DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

INSERT INTO fact_sales VALUES
('TXN5000', '2023-08-29', 1, 101, 3, 49262.78, 147788.34),
('TXN5001', '2023-12-12', 1, 102, 11, 23226.12, 255487.32),
('TXN5002', '2023-02-05', 1, 101, 20, 48703.39, 974067.80),
('TXN5003', '2023-02-20', 2, 102, 14, 23226.12, 325165.68),
('TXN5004', '2023-01-15', 1, 101, 10, 58851.01, 588510.10),
('TXN5005', '2023-08-29', 3, 103, 5, 1500.00, 7500.00),
('TXN5006', '2023-12-12', 4, 104, 8, 900.00, 7200.00),
('TXN5007', '2023-02-05', 5, 105, 6, 2000.00, 12000.00),
('TXN5008', '2023-02-20', 2, 103, 9, 1400.00, 12600.00),
('TXN5009', '2023-01-15', 3, 104, 12, 850.00, 10200.00);