/*
  22i-2068
  23i-7611
  Azan Shahzad
  Saifullah
  */

Create Database E_Commerce_System

Use E_Commerce_System;

CREATE TABLE Sellers (
    Seller_ID INT PRIMARY KEY NOT NULL,
    S_Name varchar(55) NOT NULL,
    S_Rating INT NOT NULL,
);

CREATE TABLE Products(
    Product_ID INT PRIMARY KEY NOT NULL,
    P_Name varchar(55) NOT NULL,
    P_Status varchar(55) NOT NULL,
    P_Price INT NOT NULL,
	P_Category Varchar(55) NOT NULL,
	SellerID INT,
    FOREIGN KEY (SellerID) REFERENCES Sellers(Seller_ID)
    ON DELETE CASCADE
);

CREATE TABLE Customers(
    C_ID INT PRIMARY KEY NOT NULL,
    C_Name varchar(55) NOT NULL,
    C_Email varchar(55) NOT NULL,
);

CREATE TABLE Orders(
    O_ID INT PRIMARY KEY NOT NULL,
    O_Number INT NOT NULL Unique,
    O_Time DateTime NOT NULL,
    O_TotalPrice INT NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(C_ID)
    ON DELETE CASCADE
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY NOT NULL,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    OI_Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(O_ID),
    FOREIGN KEY (ProductID) REFERENCES Products(Product_ID)
);

CREATE TABLE ShoppingCarts(
    SC_ID INT PRIMARY KEY NOT NULL,
    SC_Time DateTime NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(C_ID)
    ON DELETE CASCADE
);

CREATE TABLE CartItems(
    CI_ID INT PRIMARY KEY NOT NULL,
    CI_Quantity INT NOT NULL,
    ShoppingCartID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (ShoppingCartID) REFERENCES ShoppingCarts(SC_ID),
    FOREIGN KEY (ProductID) REFERENCES Products(Product_ID)
);

CREATE TABLE Payments(
    P_ID INT PRIMARY KEY NOT NULL,
    P_Time DateTime NOT NULL,
    P_Amount INT NOT NULL,
    PaymentMethod varchar(55) NOT NULL,
    OrderID INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(O_ID)
    ON DELETE CASCADE
);

CREATE TABLE ProductReviews(
    R_ID INT PRIMARY KEY NOT NULL,
    ReviewText varchar(255) NOT NULL,
	ProductRating INT NOT NULL,
    ProductID INT NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(Product_ID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(C_ID)
);


CREATE TABLE Address(
    A_ID INT PRIMARY KEY NOT NULL,
    Address_Line varchar(255) NOT NULL,
    A_City varchar(55) NOT NULL,
    A_State varchar(55) NOT NULL,
    A_Country varchar(55) NOT NULL,
    A_ZipCode INT NOT NULL,
    IsBilling BIT NOT NULL,
    IsShipping BIT NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(C_ID)
    ON DELETE CASCADE
);

CREATE TABLE Inventory(
    Invent_ID INT PRIMARY KEY NOT NULL,
    StockQuantity INT NOT NULL,
    LastStock Datetime NOT NULL,
    ReOrder INT NOT NULL,
    UnitCost INT NOT NULL,
    ProductID INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(Product_ID)
    ON DELETE CASCADE
);

------------------------------Inserstion------------------------------

INSERT INTO Sellers (Seller_ID, S_Name, S_Rating) VALUES
(1, 'ABC Electronics', 4),
(2, 'Tech Haven', 5),
(3, 'Gadget Galaxy', 4),
(4, 'Digital World', 3),
(5, 'Epic Gadgets', 5),
(6, 'Infinite Electronics', 4),
(7, 'Smart Buy', 3),
(8, 'Tech Universe', 5),
(9, 'Future Tech', 4),
(10, 'Quick Electronics', 3),
(11, 'Global Gadgets', 4),
(12, 'Superior Electronics', 5),
(13, 'Tech Innovators', 4),
(14, 'Mega Electronics', 3),
(15, 'Pro Gadgets', 5),
(16, 'Prime Electronics', 4),
(17, 'Tech Experts', 4),
(18, 'Gizmo Guru', 3),
(19, 'Digital Dreams', 5),
(20, 'Ultimate Electronics', 4);

INSERT INTO Products (Product_ID, P_Name, P_Status, P_Price, P_Category, SellerID) VALUES
(1, 'Laptop', 'In Stock', 800, 'Electronics', 1),
(2, 'Smartphone', 'In Stock', 400, 'Electronics', 2),
(3, 'Tablet', 'In Stock', 300, 'Electronics', 3),
(4, 'Smart TV', 'In Stock', 600, 'Electronics', 4),
(5, 'Digital Camera', 'In Stock', 350, 'Electronics', 5),
(6, 'Gaming Console', 'In Stock', 450, 'Electronics', 6),
(7, 'Wireless Earbuds', 'In Stock', 150, 'Electronics', 7),
(8, 'Bluetooth Speaker', 'In Stock', 100, 'Electronics', 8),
(9, 'Fitness Tracker', 'In Stock', 80, 'Electronics', 9),
(10, 'Home Security Camera', 'In Stock', 200, 'Electronics', 10),
(11, 'Headphones', 'In Stock', 70, 'Electronics', 11),
(12, 'Computer Monitor', 'In Stock', 250, 'Electronics', 12),
(13, 'Printers', 'In Stock', 180, 'Electronics', 13),
(14, 'External Hard Drive', 'In Stock', 120, 'Electronics', 14),
(15, 'Keyboard and Mouse Combo', 'In Stock', 50, 'Electronics', 15),
(16, 'Gaming Mouse', 'In Stock', 40, 'Electronics', 16),
(17, 'USB Flash Drive', 'In Stock', 20, 'Electronics', 17),
(18, 'Smart Home Hub', 'In Stock', 300, 'Electronics', 18),
(19, 'Wireless Router', 'In Stock', 80, 'Electronics', 19),
(20, 'Graphic Tablet', 'In Stock', 150, 'Electronics', 20),
(21, 'Smartwatch', 'In Stock', 200, 'Electronics', 1),
(22, 'Portable Printer', 'In Stock', 250, 'Electronics', 2),
(23, 'VR Headset', 'In Stock', 300, 'Electronics', 3),
(24, 'Wireless Keyboard', 'In Stock', 80, 'Electronics', 4),
(25, 'External Battery Pack', 'In Stock', 50, 'Electronics', 5),
(26, 'Running Shoes', 'In Stock', 80, 'Footwear', 6),
(27, 'Backpack', 'In Stock', 40, 'Bags', 7),
(28, 'Sunglasses', 'In Stock', 60, 'Accessories', 8),
(29, 'Digital Watch', 'In Stock', 90, 'Watches', 9),
(30, 'Dress Shirt', 'In Stock', 70, 'Apparel', 10),
(31, 'Cookware Set', 'In Stock', 120, 'Kitchen', 11),
(32, 'Coffee Maker', 'In Stock', 100, 'Appliances', 12),
(33, 'Wall Clock', 'In Stock', 30, 'Home Decor', 13),
(34, 'Yoga Mat', 'In Stock', 20, 'Fitness', 14),
(35, 'Gardening Tools', 'In Stock', 50, 'Outdoor', 15);


INSERT INTO Customers (C_ID, C_Name, C_Email) VALUES
(1, 'Alice Johnson', 'alice.j@example.com'),
(2, 'Bob Smith', 'bob.smith@example.com'),
(3, 'Charlie Brown', 'charlie.b@example.com'),
(4, 'David Lee', 'david.lee@example.com'),
(5, 'Eva Davis', 'eva.d@example.com'),
(6, 'Frank White', 'frank.w@example.com'),
(7, 'Grace Wilson', 'grace.w@example.com'),
(8, 'Henry Clark', 'henry.c@example.com'),
(9, 'Ivy Hall', 'ivy.h@example.com'),
(10, 'Jack Turner', 'jack.t@example.com'),
(11, 'Kelly Miller', 'kelly.m@example.com'),
(12, 'Liam Harris', 'liam.h@example.com'),
(13, 'Mia Anderson', 'mia.a@example.com'),
(14, 'Noah Martinez', 'noah.m@example.com'),
(15, 'Olivia Lopez', 'olivia.l@example.com'),
(16, 'Pamela Young', 'pamela.y@example.com'),
(17, 'Quinn Moore', 'quinn.m@example.com'),
(18, 'Ryan Hall', 'ryan.h@example.com'),
(19, 'Sara Green', 'sara.g@example.com'),
(20, 'Tyler Adams', 'tyler.a@example.com'),
(21, 'John Doe', 'john.doe@example.com'),
(22, 'Jane Smith', 'jane.smith@example.com'),
(23, 'Michael Johnson', 'michael.j@example.com'),
(24, 'Alice Johnson', 'alice.j@example.com'),
(25, 'Bob Smith', 'bob.smith@example.com'),
(26, 'Charlie Brown', 'charlie.b@example.com'),
(27, 'David Lee', 'david.lee@example.com'),
(28, 'Sophia Moore', 'sophia.m@example.com'),
(29, 'Daniel Anderson', 'daniel.a@example.com'),
(30, 'Olivia Brown', 'olivia.b@example.com'),
(31, 'Max Johnson', 'max.j@example.com');

INSERT INTO Orders (O_ID, O_Number, O_Time, O_TotalPrice, CustomerID) VALUES
(1, 1001, '2023-10-22 12:00:00', 1200, 1),
(2, 1002, '2023-10-23 14:30:00', 800, 2),
(3, 1003, '2023-10-24 10:15:00', 500, 3),
(4, 1004, '2023-10-25 16:45:00', 900, 4),
(5, 1005, '2023-10-26 09:30:00', 700, 5),
(6, 1006, '2023-10-27 13:20:00', 1100, 6),
(7, 1007, '2023-10-28 15:45:00', 950, 7),
(8, 1008, '2023-10-29 11:10:00', 600, 8),
(9, 1009, '2023-10-30 14:00:00', 750, 9),
(10, 1010, '2023-10-31 10:30:00', 850, 10),
(11, 1011, '2023-11-01 12:45:00', 980, 11),
(12, 1012, '2023-11-02 09:15:00', 1100, 12),
(13, 1013, '2023-11-03 16:00:00', 640, 13),
(14, 1014, '2023-11-04 14:30:00', 780, 14),
(15, 1015, '2023-11-05 11:20:00', 900, 15),
(16, 1016, '2023-11-06 10:00:00', 720, 16),
(17, 1017, '2023-11-07 13:10:00', 880, 17),
(18, 1018, '2023-11-08 15:30:00', 950, 18),
(19, 1019, '2023-11-09 12:45:00', 1100, 19),
(20, 1020, '2023-11-10 10:20:00', 750, 20),
(21, 1021, '2023-11-11 14:30:00', 600, 3),
(22, 1022, '2023-11-11 15:45:00', 900, 3),
(23, 1023, '2023-11-11 17:00:00', 750, 3),
(24, 1024, '2023-11-11 18:15:00', 800, 3),
(25, 1025, '2023-11-11 19:30:00', 950, 3),
(26, 1026, '2023-11-11 20:45:00', 700, 3),
(27, 1027, '2023-11-11 14:00:00', 600, 5),
(28, 1028, '2023-11-12 09:30:00', 750, 5),
(29, 1029, '2023-11-13 11:45:00', 850, 5),
(30, 1030, '2023-11-14 13:15:00', 980, 5),
(31, 1031, '2023-11-15 10:45:00', 1100, 5),
(32, 10032, '2023-10-22 12:00:00', 250, 1),
(33, 10033, '2023-10-23 14:30:00', 320, 2),
(34, 10034, '2023-10-24 10:15:00', 150, 3),
(35, 10035, '2023-10-25 16:45:00', 200, 4),
(36, 10036, '2023-08-22 12:00:00', 1200, 1),
(37, 10037, '2023-09-23 14:30:00', 800, 2),
(38, 10038, '2023-09-24 10:15:00', 500, 3),
(39, 1039, '2023-11-16 14:30:00', 620, 28),
(40, 1040, '2023-11-17 15:45:00', 540, 29),
(41, 1041, '2023-11-18 10:15:00', 430, 30),
(42, 1042, '2023-11-19 09:00:00', 2150, 31);

INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, OI_Quantity) VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 3),
(4, 2, 4, 1),
(5, 3, 5, 2),
(6, 3, 6, 1),
(7, 4, 7, 2),
(8, 4, 8, 1),
(9, 5, 9, 1),
(10, 5, 10, 3),
(11, 6, 11, 2),
(12, 6, 12, 1),
(13, 7, 13, 1),
(14, 7, 14, 4),
(15, 8, 15, 2),
(16, 8, 16, 1),
(17, 9, 17, 3),
(18, 9, 18, 1),
(19, 10, 19, 2),
(20, 10, 20, 1),
(21, 1, 1, 2),
(22, 1, 2, 1),
(23, 2, 3, 3),
(24, 2, 4, 2),
(25, 3, 5, 1),
(26, 4, 1, 1),
(27, 33, 7, 1),
(28, 34, 8, 2),
(29, 34, 9, 1),
(30, 35, 10, 3),
(31, 35, 11, 2),
(32, 42, 1, 1),
(33, 42, 2, 1),
(34, 42, 3, 1),
(35, 42, 4, 1),
(36, 42, 5, 1),
(37, 42, 6, 1),
(38, 42, 7, 1),
(39, 42, 8, 1),
(40, 42, 9, 1),
(41, 42, 10, 1),
(42, 42, 11, 1),
(43, 42, 12, 1),
(44, 42, 13, 1),
(45, 42, 14, 1),
(46, 42, 15, 1),
(47, 42, 16, 1),
(48, 42, 17, 1),
(49, 42, 18, 1),
(50, 42, 19, 1),
(51, 42, 20, 1);

INSERT INTO ShoppingCarts (SC_ID, SC_Time, CustomerID) VALUES
(1, '2023-10-22 10:00:00', 1),
(2, '2023-10-23 11:30:00', 2),
(3, '2023-10-24 14:15:00', 3),
(4, '2023-10-25 16:45:00', 4),
(5, '2023-10-26 09:30:00', 5),
(6, '2023-10-27 13:20:00', 6),
(7, '2023-10-28 15:45:00', 7),
(8, '2023-10-29 11:10:00', 8),
(9, '2023-10-30 14:00:00', 9),
(10, '2023-10-31 10:30:00', 10),
(11, '2023-11-01 12:45:00', 11),
(12, '2023-11-02 09:15:00', 12),
(13, '2023-11-03 16:00:00', 13),
(14, '2023-11-04 14:30:00', 14),
(15, '2023-11-05 11:20:00', 15),
(16, '2023-11-06 10:00:00', 16),
(17, '2023-11-07 13:10:00', 17),
(18, '2023-11-08 15:30:00', 18),
(19, '2023-11-09 12:45:00', 19),
(20, '2023-11-10 10:20:00', 20);

INSERT INTO CartItems (CI_ID, CI_Quantity, ShoppingCartID, ProductID, Quantity) VALUES
(1, 2, 1, 1, 3),
(2, 1, 1, 2, 1),
(3, 3, 2, 3, 2),
(4, 2, 2, 4, 1),
(5, 1, 3, 5, 4),
(6, 2, 3, 6, 2),
(7, 1, 4, 7, 3),
(8, 3, 4, 8, 1),
(9, 1, 5, 9, 2),
(10, 2, 5, 10, 1),
(11, 1, 6, 11, 3),
(12, 2, 6, 12, 1),
(13, 3, 7, 13, 2),
(14, 1, 7, 14, 1),
(15, 2, 8, 15, 4),
(16, 1, 8, 16, 2),
(17, 3, 9, 17, 1),
(18, 2, 9, 18, 3),
(19, 1, 10, 19, 2),
(20, 2, 10, 20, 1);

INSERT INTO Payments (P_ID, P_Time, P_Amount, PaymentMethod, OrderID) VALUES
(1, '2023-10-22 13:30:00', 1200, 'Credit Card', 1),
(2, '2023-10-23 15:00:00', 800, 'PayPal', 2),
(3, '2023-10-24 14:45:00', 500, 'Credit Card', 3),
(4, '2023-10-25 17:15:00', 900, 'Google Pay', 4),
(5, '2023-10-26 10:00:00', 700, 'Apple Pay', 5),
(6, '2023-10-27 13:50:00', 1100, 'Credit Card', 6),
(7, '2023-10-28 16:15:00', 950, 'PayPal', 7),
(8, '2023-10-29 12:30:00', 600, 'Google Pay', 8),
(9, '2023-10-30 14:45:00', 750, 'Credit Card', 9),
(10, '2023-10-31 11:00:00', 850, 'Apple Pay', 10),
(11, '2023-11-01 13:15:00', 980, 'Credit Card', 11),
(12, '2023-11-02 10:45:00', 1100, 'PayPal', 12),
(13, '2023-11-03 16:30:00', 640, 'Google Pay', 13),
(14, '2023-11-04 15:00:00', 780, 'Credit Card', 14),
(15, '2023-11-05 11:45:00', 900, 'Apple Pay', 15),
(16, '2023-11-06 10:30:00', 720, 'Credit Card', 16),
(17, '2023-11-07 13:45:00', 880, 'PayPal', 17),
(18, '2023-11-08 16:00:00', 950, 'Google Pay', 18),
(19, '2023-11-09 12:15:00', 1100, 'Credit Card', 19),
(20, '2023-11-10 10:45:00', 750, 'PayPal', 20),
(21, '2023-11-19 09:30:00', 2150, 'Credit Card', 42);

INSERT INTO ProductReviews (R_ID, ReviewText, ProductRating, ProductID, CustomerID) VALUES
(1, 'Excellent product! Very satisfied with the quality and performance.', 5, 1, 1),
(2, 'Fast shipping and great customer service. Will buy again!', 4, 1, 2),
(3, 'The smartphone is amazing! It exceeded my expectations.', 5, 2, 3),
(4, 'Superb camera quality. Worth every penny.', 5, 2, 4),
(5, 'Highly recommended! The tablet is lightweight and easy to use.', 5, 3, 5),
(6, 'Gaming console arrived in perfect condition. Kids love it!', 4, 6, 6),
(7, 'Good sound quality. The earbuds fit comfortably in my ears.', 4, 7, 7),
(8, 'Affordable and good battery life. Happy with my purchase.', 3, 8, 8),
(9, 'Accurate fitness tracking features. Helps me stay motivated.', 4, 9, 9),
(10, 'Easy setup and clear video. Great for home security.', 4, 10, 10),
(11, 'These headphones are amazing! Comfortable and great sound.', 5, 11, 11),
(12, 'The monitor has vibrant colors and sharp resolution.', 5, 12, 12),
(13, 'Fast and reliable printer. Perfect for my home office.', 4, 13, 13),
(14, 'Compact and portable external hard drive. Works like a charm.', 5, 14, 14),
(15, 'The keyboard and mouse combo are responsive and durable.', 4, 15, 15),
(16, 'Love the design and performance of this gaming mouse.', 5, 16, 16),
(17, 'Reliable USB flash drive. Great for transferring files.', 3, 17, 17),
(18, 'Smart home hub is easy to set up and integrates well with devices.', 4, 18, 18),
(19, 'Stable wireless connection. Improved my internet speed.', 5, 19, 19),
(20, 'Great graphic tablet for digital art. Highly recommended.', 5, 20, 20);

INSERT INTO Address (A_ID, Address_Line, A_City, A_State, A_Country, A_ZipCode, IsBilling, IsShipping, CustomerID) VALUES
(1, '123 Main St', 'Cityville', 'Stateville', 'Countryland', 12345, 1, 1, 1),
(2, '456 Elm St', 'Townsville', 'Stateville', 'Countryland', 54321, 1, 0, 2),
(3, '789 Oak St', 'Villageland', 'Stateville', 'Countryland', 67890, 1, 1, 3),
(4, '101 Pine St', 'Hamletville', 'Stateville', 'Countryland', 10101, 1, 1, 4),
(5, '202 Cedar St', 'Burgville', 'Stateville', 'Countryland', 20202, 1, 1, 5),
(6, '303 Maple St', 'Woodland', 'Stateville', 'Countryland', 30303, 1, 1, 6),
(7, '404 Birch St', 'Groveville', 'Stateville', 'Countryland', 40404, 1, 1, 7),
(8, '505 Spruce St', 'Orchardville', 'Stateville', 'Countryland', 50505, 1, 1, 8),
(9, '606 Ash St', 'Riverville', 'Stateville', 'Countryland', 60606, 1, 1, 9),
(10, '707 Walnut St', 'Harborville', 'Stateville', 'Countryland', 70707, 1, 1, 10),
(11, '808 Pineapple St', 'Beachville', 'Stateville', 'Countryland', 80808, 1, 1, 11),
(12, '909 Banana St', 'Tropicalville', 'Stateville', 'Countryland', 90909, 1, 1, 12),
(13, '1010 Orange St', 'Citrusville', 'Stateville', 'Countryland', 10100, 1, 1, 13),
(14, '1111 Lemon St', 'Fruitville', 'Stateville', 'Countryland', 11111, 1, 1, 14),
(15, '1212 Cherry St', 'Berryville', 'Stateville', 'Countryland', 12121, 1, 1, 15),
(16, '1313 Grape St', 'Vineville', 'Stateville', 'Countryland', 13131, 1, 1, 16),
(17, '1414 Plum St', 'Orchardville', 'Stateville', 'Countryland', 14141, 1, 1, 17),
(18, '1515 Fig St', 'Fruitland', 'Stateville', 'Countryland', 15151, 1, 1, 18),
(19, '1616 Pear St', 'Treeville', 'Stateville', 'Countryland', 16161, 1, 1, 19),
(20, '1717 Raspberry St', 'Berryland', 'Stateville', 'Countryland', 17171, 1, 1, 20);

INSERT INTO Inventory (Invent_ID, StockQuantity, LastStock, ReOrder, UnitCost, ProductID) VALUES
(1, 100, '2023-10-20 10:00:00', 20, 500, 1),
(2, 150, '2023-10-21 11:30:00', 25, 300, 2),
(3, 200, '2023-10-22 14:15:00', 30, 250, 3),
(4, 80, '2023-10-23 16:45:00', 15, 600, 4),
(5, 120, '2023-10-24 09:30:00', 18, 350, 5),
(6, 90, '2023-10-25 13:20:00', 22, 400, 6),
(7, 110, '2023-10-26 15:45:00', 17, 200, 7),
(8, 70, '2023-10-27 11:10:00', 14, 180, 8),
(9, 60, '2023-10-28 14:00:00', 10, 150, 9),
(10, 40, '2023-10-29 10:30:00', 8, 200, 10),
(11, 50, '2023-10-30 12:45:00', 12, 300, 11),
(12, 30, '2023-10-31 09:15:00', 6, 250, 12),
(13, 45, '2023-11-01 16:00:00', 9, 150, 13),
(14, 55, '2023-11-02 14:30:00', 11, 120, 14),
(15, 75, '2023-11-03 11:20:00', 15, 100, 15),
(16, 95, '2023-11-04 10:00:00', 19, 80, 16),
(17, 110, '2023-11-05 13:10:00', 22, 70, 17),
(18, 65, '2023-11-06 15:30:00', 13, 90, 18),
(19, 85, '2023-11-07 12:45:00', 17, 120, 19),
(20, 100, '2023-11-08 10:20:00', 20, 110, 20);

-----------------------------Queries-----------------------------

-- Question 3 --

Select * From Customers Where C_ID = 1;

Select * From Products Where P_Status = 'In Stock';

Select * From Orders Where O_TotalPrice > 1000;

Select * From Payments Where P_Amount > 1000;

-- Question 4 --

Select Top 5 C.C_ID, C.C_Name, SUM(O.O_TotalPrice) AS TotalSpent
From Customers C
Join Orders O ON C.C_ID = O.CustomerID
Group By C.C_ID, C.C_Name
Order By TotalSpent DESC;

-- Question 5 --

Select P_Name, AVG(ProductRating) AS AvgRating
From ProductReviews
Join Products ON ProductReviews.ProductID = Products.Product_ID
Group By P_Name
Order By AvgRating DESC;

-- Question 6 --

Select C_ID, C_Name, COUNT(Distinct O_ID) AS NumberOfPurchases
From Orders
Join Customers ON Orders.CustomerID = Customers.C_ID
Group By C_ID, C_Name, CONVERT(Date, O_Time)
Having COUNT(Distinct O_ID) > 1;

-- Question 7 --

Select P_Name, SUM(OI_Quantity * P_Price) AS TotalRevenue
From OrderItems
Join Products ON OrderItems.ProductID = Products.Product_ID
Group By P_Name
Order By TotalRevenue DESC;

-- Question 8 --

Select C_ID, C_Name
From Customers
Where C_ID NOT IN (Select CustomerID From ProductReviews);

-- Question 9 --

Select P_Name, StockQuantity
From Products
Join Inventory ON Products.Product_ID = Inventory.ProductID
Where StockQuantity < (Select AVG(StockQuantity) From Inventory);

-- Question 10 --

Select C_ID, C_Name, COUNT(O_ID) AS NumberOfOrders
From Orders
Join Customers ON Orders.CustomerID = Customers.C_ID
Group By C_ID, C_Name
Having COUNT(O_ID) > 5;

-- Question 11 --

Select Top 3 O_ID, O_Number, O_Time, O_TotalPrice
From Orders
Where CustomerID = 1
Order By O_Time DESC;

-- Question 12 --

Select C.C_ID, C.C_Name
From Customers C
Join Orders O ON C.C_ID = O.CustomerID
Join OrderItems OI ON O.O_ID = OI.OrderID
Join Products P ON OI.ProductID = P.Product_ID
Where C.C_ID IN (
    Select C1.C_ID
    From Customers C1
    Join Orders O1 ON C1.C_ID = O1.CustomerID
    Join OrderItems OI1 ON O1.O_ID = OI1.OrderID
    Join Products P1 ON OI1.ProductID = P1.Product_ID
    Group By C1.C_ID
    Having COUNT(Distinct P1.SellerID) >= 2
);

-- Question 13 --

Select C_ID, C_Name
From Customers
Where C_ID IN (
    Select CustomerID
    From Orders
    Where O_Time >= DATEADD(day, -30, GETDATE())
);


-- Question 14 --

Select C.C_ID, C.C_Name
From Customers C
Join Orders O ON C.C_ID = O.CustomerID
Join OrderItems OI ON O.O_ID = OI.OrderID
Join Products P ON OI.ProductID = P.Product_ID
Group By C.C_ID, C.C_Name
Having COUNT(Distinct P.SellerID) = (Select COUNT(Distinct SellerID) From Products);

-- Question 15 --

Select Top 5 P_Name, COUNT(OI.OrderID) AS NumberOfOrders
From OrderItems OI
Join Products ON OI.ProductID = Products.Product_ID
Group By P_Name
Order By NumberOfOrders DESC;

-- Question 16 --

Select Top 5 P_Name, SUM(OI_Quantity * P_Price) AS TotalSales
From OrderItems
Join Products ON OrderItems.ProductID = Products.Product_ID
Join Orders ON OrderItems.OrderID = Orders.O_ID
Where O_Time >= DATEADD(month, -1, GETDATE())
Group By P_Name
Order By TotalSales DESC;

-- Question 17 --

Select Top 5 O.O_ID, O.O_Number, O.O_Time, O.O_TotalPrice, C.C_ID, C.C_Name, OI.OrderItemID, OI.ProductID, OI.OI_Quantity
From Orders O
Join Customers C ON O.CustomerID = C.C_ID
Join OrderItems OI ON O.O_ID = OI.OrderID
Order By O.O_Time DESC;

-- Question 18 --

Select C.C_ID, C.C_Name, COUNT(Distinct P.SellerID) AS NumberOfCategories
From Customers C
Join Orders O ON C.C_ID = O.CustomerID
Join OrderItems OI ON O.O_ID = OI.OrderID
Join Products P ON OI.ProductID = P.Product_ID
Group By C.C_ID, C.C_Name
Having COUNT(Distinct P.SellerID) = (Select COUNT(Distinct SellerID) From Products);

-- Question 19 --

Select P.Product_ID, P.P_Name, P.P_Status, P.P_Price, AVG(PR.ProductRating) AS AvgRating
From Products P
Left Join ProductReviews PR ON P.Product_ID = PR.ProductID
Where P.Product_ID NOT IN (Select Distinct ProductID From ProductReviews)
And P.Product_ID IN (Select ProductID From Inventory Where StockQuantity > 0)
Group By P.Product_ID, P.P_Name, P.P_Status, P.P_Price;


-- Question 20 --

Select Top 3 P.Product_ID, P.P_Name, P.P_Status, P.P_Price, SUM(OI_Quantity * P_Price) AS TotalSales, PR.R_ID, PR.ReviewText, PR.ProductRating, PR.CustomerID
From Products P
Join OrderItems OI ON P.Product_ID = OI.ProductID
Join ProductReviews PR ON P.Product_ID = PR.ProductID
Group By P.Product_ID, P.P_Name, P.P_Status, P.P_Price, PR.R_ID, PR.ReviewText, PR.ProductRating, PR.CustomerID
Order By TotalSales DESC;

-- Question 21 --

Select C.C_ID, C.C_Name, O.O_ID, O.O_Number, O.O_Time, O.O_TotalPrice, A.A_ID, A.Address_Line, A.A_City, A.A_State, A.A_Country, A.A_ZipCode
From Customers C
Full Join Orders O ON C.C_ID = O.CustomerID
Full Join Address A ON C.C_ID = A.CustomerID
Order By C.C_ID, O.O_ID, A.A_ID;

-- Question 22 --

Select P_Name, COUNT(Distinct Product_ID) AS NumberOfProducts, SUM(OI_Quantity * P_Price) AS TotalRevenue
From Products
Left Join OrderItems ON Products.Product_ID = OrderItems.ProductID
Group By P_Name
Order By TotalRevenue DESC;

-- Question 23 --

Select P.Product_ID, P.P_Name AS Product_Name, 'Electronics' AS Product_Category, OI.OI_Quantity AS Order_Quantity, P.P_Price AS Order_Price, OI.OI_Quantity * P.P_Price AS Total_Revenue
From Products P
Left Join OrderItems OI ON P.Product_ID = OI.ProductID
Left Join Orders O ON OI.OrderID = O.O_ID
Where P.P_Status = 'In Stock' And P.Product_ID In (Select ProductID From Products Where P_Status = 'In Stock' And Product_ID In (Select ProductID From OrderItems Group By ProductID Having SUM(OI_Quantity) Between 5 And 10))
Order By Total_Revenue Desc;


-- Question 24 --

Select P.P_Category AS ProductCategory, COUNT(OI.ProductID) AS TotalProductsSold
From Products P
Left Join OrderItems OI ON P.Product_ID = OI.ProductID
Group By P.P_Category
Having COUNT(OI.ProductID) > 10
Order By TotalProductsSold Desc;

-- Question 25 --

Select C.C_ID, C.C_Name, COUNT(Distinct O_ID) AS NumberOfOrders
From Customers C
Join Orders O ON C.C_ID = O.CustomerID
Group By C.C_ID, C.C_Name
Having COUNT(Distinct O_ID) > 5
Order By NumberOfOrders DESC;