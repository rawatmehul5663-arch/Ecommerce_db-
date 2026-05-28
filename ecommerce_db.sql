CREATE DATABASE ecommerce_db;
DROP DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(100) UNIQUE,
    city        VARCHAR(50),
    join_date   DATE

);
CREATE TABLE Products (
    product_id  INT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    category    VARCHAR(50),
    price       DECIMAL(10,2),
    stock_qty   INT DEFAULT 0
);
CREATE TABLE Orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT,
    order_date   DATE,
    status       VARCHAR(20),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    item_id    INT PRIMARY KEY,
    order_id   INT,
    product_id INT,
    quantity   INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id)   REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Customers VALUES
(1, 'Rohit Verma',   'rohit@gmail.com',  'Mumbai',    '2023-02-10'),
(2, 'Sneha Patil',   'sneha@gmail.com',  'Pune',      '2023-04-05'),
(3, 'Karan Malhotra','karan@gmail.com',  'Delhi',     '2023-07-18'),
(4, 'Anjali Singh',  'anjali@gmail.com', 'Jaipur',    '2023-09-22'),
(5, 'Vikas Yadav',   'vikas@gmail.com',  'Lucknow',   '2024-01-03');
INSERT INTO Products VALUES
(1, 'Redmi Note 12',  'Electronics',  15999, 40),
(2, 'Boat Earphones', 'Electronics',   1299, 120),
(3, 'Woodland Shoes', 'Footwear',      3499, 60),
(4, 'Levi Jeans',     'Clothing',      2799, 85),
(5, 'Prestige Mixer', 'Kitchen',       2199, 35);
INSERT INTO Orders VALUES
(1, 1, '2024-01-15', 'Delivered', 15999),
(2, 2, '2024-02-10', 'Delivered',  6298),
(3, 3, '2024-03-05', 'Shipped',    1299),
(4, 4, '2024-03-20', 'Pending',    2199),
(5, 5, '2024-04-01', 'Cancelled',  2799),
(6, 1, '2024-04-10', 'Delivered',  1299),
(7, 2, '2024-05-02', 'Shipped',    3499);
INSERT INTO Order_Items VALUES
(1, 1, 1, 1, 15999),
(2, 2, 3, 1,  3499),
(3, 2, 4, 1,  2799),  
(4, 3, 2, 1,  1299),
(5, 4, 5, 1,  2199),
(6, 5, 4, 1,  2799),
(7, 6, 2, 1,  1299),
(8, 7, 3, 1,  3499);
show tables;
INSERT INTO Customers
VALUES
(6,'Amit','amit@gmail.com','Pune','2026-05-19');
select * from customers;
DELETE FROM Customers
WHERE customer_id = 6;
SELECT * FROM Customers
WHERE city = 'Mumbai';
select * from customers order by name asc;
select * from customers order by name desc;
SELECT COUNT(*) AS Total_Customers
FROM Customers;
SELECT * FROM Products;
SELECT * FROM Products
WHERE price > 3000;
SELECT * FROM Products
WHERE category = 'Electronics';

SELECT * FROM Products
ORDER BY price DESC
LIMIT 1;
SELECT * FROM Products
ORDER BY stock_qty ASC
LIMIT 1;
SELECT * FROM Orders
WHERE status = 'Delivered';
SELECT * FROM Orders
WHERE status = 'Pending';
SELECT SUM(total_amount) AS Total_Sales
FROM Orders;
SELECT AVG(total_amount) AS Average_Order
FROM Orders;
SELECT MAX(total_amount) AS Highest_Order
FROM Orders;
SELECT Customers.name,
       Orders.order_id,
       Orders.total_amount
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id;
SELECT Customers.name,
       Orders.status
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id;
SELECT Customers.name,
       Products.name AS Product_Name,
       Order_Items.quantity
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
JOIN Products
ON Order_Items.product_id = Products.product_id;
SELECT city,
       COUNT(*) AS Total_Customers
FROM Customers
GROUP BY city;
SELECT status,
       COUNT(*) AS Total_Orders
FROM Orders
GROUP BY status;
SELECT category,
       COUNT(*) AS Total_Products
FROM Products
GROUP BY category;
UPDATE Products
SET price = 17999
WHERE product_id = 1;
UPDATE Orders
SET status = 'Delivered'
WHERE order_id = 4;
DELETE FROM Products
WHERE product_id = 5;
SELECT * FROM Products
ORDER BY price DESC
LIMIT 3;
SELECT * FROM Orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31';
SELECT Customers.name,
       Orders.order_id
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE city = 'Pune';
SELECT Products.name,
       SUM(Order_Items.quantity) AS Total_Sold
FROM Products
JOIN Order_Items
ON Products.product_id = Order_Items.product_id
GROUP BY Products.name;
SELECT DISTINCT Customers.name
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id;
SELECT * FROM Products
-- WHERE stock_qty < 50;
