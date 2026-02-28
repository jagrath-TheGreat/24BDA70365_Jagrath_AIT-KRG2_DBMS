-- SandDisk (Product table)
CREATE TABLE sanddisk (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2)
);

-- JTG (Customer table)
CREATE TABLE jtg (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);

-- PayPal (Transaction table)
CREATE TABLE paypal (
    transaction_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES sanddisk(product_id),
    customer_id INT REFERENCES jtg(customer_id),
    quantity INT,
    transaction_date DATE,
    payment_amount NUMERIC(12,2)
);

-- Insert Products
INSERT INTO sanddisk (product_name, category, price)
SELECT 
    'Product_' || i,
    CASE WHEN i % 2 = 0 THEN 'Storage' ELSE 'Accessories' END,
    (RANDOM()*5000)::NUMERIC(10,2)
FROM generate_series(1, 10000) AS s(i);

-- Insert Customers
INSERT INTO jtg (customer_name, city)
SELECT 
    'Customer_' || i,
    CASE WHEN i % 3 = 0 THEN 'Delhi'
         WHEN i % 3 = 1 THEN 'Mumbai'
         ELSE 'Bangalore'
    END
FROM generate_series(1, 20000) AS s(i);

-- Insert Transactions (Large Dataset)
INSERT INTO paypal (product_id, customer_id, quantity, transaction_date, payment_amount)
SELECT 
    (RANDOM()*9999 + 1)::INT,
    (RANDOM()*19999 + 1)::INT,
    (RANDOM()*10 + 1)::INT,
    CURRENT_DATE - (RANDOM()*365)::INT,
    (RANDOM()*10000)::NUMERIC(12,2)
FROM generate_series(1, 1000000);

CREATE VIEW simple_view AS
SELECT transaction_id, product_id, customer_id, payment_amount
FROM paypal;

CREATE VIEW complex_view AS
SELECT 
    s.category,
    j.city,
    COUNT(p.transaction_id) AS total_transactions,
    SUM(p.payment_amount) AS total_revenue
FROM paypal p
JOIN sanddisk s ON p.product_id = s.product_id
JOIN jtg j ON p.customer_id = j.customer_id
GROUP BY s.category, j.city;

CREATE MATERIALIZED VIEW materialized_sales_summary AS
SELECT 
    s.category,
    j.city,
    COUNT(p.transaction_id) AS total_transactions,
    SUM(p.payment_amount) AS total_revenue
FROM paypal p
JOIN sanddisk s ON p.product_id = s.product_id
JOIN jtg j ON p.customer_id = j.customer_id
GROUP BY s.category, j.city;