CREATE TABLE Customers
(
customer_id int primary key auto_increment,
name VARCHAR(100),
email VARCHAR(100) UNIQUE,
address text
);

INSERT INTO Customers (name, email, address)
VALUES ('Alice Sharma', 'alice@example.com', 'Delhi, India'),
('Bob Verma', 'bob@example.com', 'Mumbai, India'),
('Charlie Singh', 'charlie@example.com', 'Bangalore, India'),
('Laila Sharma', 'laila@example.com', 'Banaras, India'),
('Sunaina Bhalla', 'sunaina@example.com', 'Pune, India'),
('Anshul Bansal', 'anshul@example.com', 'Nainital, India');

CREATE TABLE Categories
(
category_id int primary key auto_increment,
category_name varchar(100),
description text
);

INSERT INTO Categories (category_name, description)
VALUES ('Electronics', 'Devices and gadgets'),
('Clothing', 'Apparel and fashion'),
('Books', 'Printed and digital books'),
('Beauty', 'Cosmetics and skincare products'),
('Toys', 'Games, puzzles, and educational toys'),
('Stationery', 'School supplies');

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    stock_quantity INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

INSERT INTO Products (name, description, price, stock_quantity, category_id)
VALUES ('Smartphone', 'Latest Android smartphone', 29999.99, 50, 1),
('Bluetooth Headphones', 'Noise-cancelling headphones', 4999.99, 100, 1),
('Men\'s T-Shirt', 'Cotton round-neck', 799.99, 150, 2),
('Novel: The Alchemist', 'Famous fiction book', 399.99, 200, 3),
('Aloe Vera Face Gel', 'Soothing gel for all skin types', 299.00, 100, 4),
('Vitamin C Serum', 'Brightening serum for face', 699.00, 80, 4),
('Plush Teddy Bear', 'Soft and huggable teddy bear', 349.00, 80, 5),
('Sticky Notes (Pack of 3)', 'Colored sticky notes for quick reminders', 49.00, 180, 6);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (user_id, total_amount, status)
VALUES (1, 29999.99, 'Delivered'),
(2, 5799.98, 'Shipped'),
(3, 399.99, 'Processing'),
(4, 799.99, 'Cancelled'),
(5, 999.99, 'Delivered'),
(6, 2499.99, 'Delivered');

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Items (order_id, product_id, quantity, price)
VALUES (1, 1, 1, 29999.99),
(2, 2, 2, 4999.99),
(3, 3, 1, 399.99),
(4, 4, 1, 799.99),
(5, 6, 2, 999.99),
(6, 5, 1, 2499.99);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(50),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount_paid DECIMAL(10,2),
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Payments (order_id, payment_method, amount_paid, status)
VALUES (1, 'Credit Card', 29999.99, 'Success'),
(2, 'UPI', 5799.98, 'Success'),
(3, 'Cash on Delivery', 399.99, 'Pending'),
(4, 'Credit Card', 799.99, 'Failed'),
(5, 'UPI', 999.99, 'Success'),
(6, 'Debit Card', 2499.99, 'Success');