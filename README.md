# E-Commerce System Database
This README file provides an overview of the E-Commerce System database design, implementation details, challenges faced, and solutions applied.

Table of Contents
Database Schema
ERD Explanation
Implementation Details
Challenges Faced and Solutions
Images
Database Schema
The E-Commerce System database consists of the following tables:

Sellers

Seller_ID (Primary Key)
S_Name
S_Rating
Products

Product_ID (Primary Key)
P_Name
P_Status
P_Price
P_Category
SellerID (Foreign Key referencing Sellers)
Customers

C_ID (Primary Key)
C_Name
C_Email
Orders

O_ID (Primary Key)
O_Number (Unique)
O_Time
O_TotalPrice
CustomerID (Foreign Key referencing Customers)
OrderItems

OrderItemID (Primary Key)
OrderID (Foreign Key referencing Orders)
ProductID (Foreign Key referencing Products)
OI_Quantity
ShoppingCarts

SC_ID (Primary Key)
SC_Time
CustomerID (Foreign Key referencing Customers)
CartItems

CI_ID (Primary Key)
CI_Quantity
ShoppingCartID (Foreign Key referencing ShoppingCarts)
ProductID (Foreign Key referencing Products)
Quantity
Payments

P_ID (Primary Key)
P_Time
P_Amount
PaymentMethod
OrderID (Foreign Key referencing Orders)
ProductReviews

R_ID (Primary Key)
ReviewText
ProductRating
ProductID (Foreign Key referencing Products)
CustomerID (Foreign Key referencing Customers)
Address

A_ID (Primary Key)
Address_Line
A_City
A_State
A_Country
A_ZipCode
IsBilling
IsShipping
CustomerID (Foreign Key referencing Customers)
Inventory
Invent_ID (Primary Key)
StockQuantity
LastStock
ReOrder
UnitCost
ProductID (Foreign Key referencing Products)
ERD Explanation
The Entity-Relationship Diagram (ERD) for the E-Commerce System database represents the relationships between different entities such as Sellers, Products, Customers, Orders, and more. Here's a brief explanation of key relationships:

Sellers and Products: Sellers and Products are related through the SellerID foreign key in the Products table. Each product is associated with a specific seller.

Customers and Orders: Customers can place multiple orders, and the Orders table contains the CustomerID foreign key, establishing a relationship between customers and their orders.

Products and OrderItems: The OrderItems table links products to specific orders using the ProductID and OrderID foreign keys. It allows for tracking the items included in each order.

Customers and ShoppingCarts: Customers can have multiple shopping carts. The ShoppingCarts table includes the CustomerID foreign key, connecting customers to their respective shopping carts.

ShoppingCarts and CartItems: Shopping carts contain cart items, which are products added by customers. The CartItems table has foreign keys ShoppingCartID and ProductID, establishing relationships with ShoppingCarts and Products.

Orders and Payments: Each order can have one payment associated with it. The Payments table includes the OrderID foreign key, connecting payments to specific orders.

Products and ProductReviews: Products can have multiple reviews. The ProductReviews table contains ProductID and CustomerID foreign keys, linking products to their reviews and the customers who wrote them.

Implementation Details
Database Creation and Data Insertion
The SQL script provided in the initial question was used to create the database schema and insert sample data into the tables. The script created tables for sellers, products, customers, orders, order items, shopping carts, cart items, payments, product reviews, addresses, and inventory.

Challenges Faced and Solutions
Data Integrity: Ensuring data integrity across different tables and maintaining referential integrity during data insertion was a challenge. Properly defining foreign key constraints helped maintain data consistency and integrity.

Complex Queries: Formulating complex SQL queries for generating reports and extracting specific information from multiple tables was a challenge. Breakdown of queries into smaller steps and testing each step individually helped overcome this challenge.

Data Validation: Ensuring that data entered into the database adheres to defined constraints and business rules was crucial. Implementing validation checks in the application code and

150, 80, 350, 15, 220, 15),
(16, 95, '2023-11-05 11:00:00', 18, 200, 16),
(17, 60, '2023-11-06 10:30:00', 12, 180, 17),
(18, 40, '2023-11-07 13:45:00', 8, 250, 18),
(19, 70, '2023-11-08 16:00:00', 14, 300, 19),
(20, 50, '2023-11-09 12:15:00', 10, 220, 20);

---

### Challenges Faced:

1. **Database Design:** Designing the database schema with appropriate relationships and constraints posed an initial challenge. Understanding the relationships between different entities (Customers, Orders, Products, etc.) and ensuring data integrity was a key concern.

2. **Data Insertion:** Populating the database with realistic and diverse data for testing purposes was a time-consuming task. Generating meaningful data that aligns with the schema structure was crucial for accurate testing.

3. **ERD Visualization:** Creating a clear and informative Entity-Relationship Diagram (ERD) was important for understanding the relationships visually. Representing the connections between various entities and their attributes in a comprehensive manner was challenging.

4. **Data Integrity:** Ensuring data integrity and maintaining consistency across related tables was a constant consideration. Implementing foreign key constraints and verifying their functionality was vital to prevent data inconsistencies.

### Solutions Implemented:

1. **Database Design:** Collaboratively analyzing the requirements and understanding the business logic helped in designing an efficient database schema. By identifying primary keys, foreign keys, and relationships, we created a well-structured database.

2. **Data Insertion:** Utilizing SQL scripts, we inserted diverse and meaningful data into the tables. By breaking down the insertion process into smaller batches, we ensured that each table was populated accurately and efficiently.

3. **ERD Visualization:** Tools like draw.io were used to create the Entity-Relationship Diagram (ERD). The ERD was updated iteratively as the database schema evolved, providing a clear visualization of the relationships among entities.

4. **Data Integrity:** Implementing foreign key constraints and cascading actions (such as ON DELETE CASCADE) in SQL ensured that the relationships between tables were maintained. Regular testing and validation queries were run to verify the data integrity.

---

### Entity-Relationship Diagram (ERD):

![E-Commerce System ERD](path/to/your/erd.png)

*Explanation:* This ERD visually represents the relationships between different entities in the E-Commerce System. Each entity's attributes and their relationships with other entities are clearly depicted, providing a comprehensive overview of the database structure.

---

### Conclusion:

Creating a robust and efficient database system for an e-commerce application required careful planning, thoughtful design, and meticulous testing. By overcoming various challenges related to database design, data insertion, ERD visualization, and data integrity, we successfully developed a functional E-Commerce System database.

This README file serves as a comprehensive report detailing the implementation process, challenges faced, and solutions implemented during the development of the database system. The included ERD provides a visual representation of the database structure, enhancing the understanding of the relationships between different entities.

For further inquiries or clarifications, please contact the developers:

- **Azan Shahzad:** azan@example.com
- **Saifullah:** saif@example.com

---

#### Note: Make sure to replace `'path/to/your/erd.png'` with the actual file path or URL where your ERD image is stored.
