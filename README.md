# E-Commerce System Database
This README file provides an overview of the E-Commerce System database design, implementation details, challenges faced, and solutions applied.

### Table of Contents
1. Database Schema
2. ERD Explanation
3. Implementation Details
4. Challenges Faced and Solutions
5. Images
6. Database Schema
The E-Commerce System database consists of the following tables:

### Sellers

1. Seller_ID (Primary Key)
2. S_Name
3. S_Rating
### Products

1. Product_ID (Primary Key)
2. P_Name
3. P_Status
4. P_Price
5. P_Category
6. SellerID (Foreign Key referencing Sellers)
### Customers

1. C_ID (Primary Key)
2. C_Name
3. C_Email
### Orders

1. O_ID (Primary Key)
2. O_Number (Unique)
3. O_Time
4. O_TotalPrice
5. CustomerID (Foreign Key referencing Customers)
### OrderItems

1. OrderItemID (Primary Key)
2. OrderID (Foreign Key referencing Orders)
3. ProductID (Foreign Key referencing Products)
4. OI_Quantity
### ShoppingCarts

1. SC_ID (Primary Key)
2. SC_Time
3. CustomerID (Foreign Key referencing Customers)
### CartItems

1. CI_ID (Primary Key)
2. CI_Quantity
3. ShoppingCartID (Foreign Key referencing ShoppingCarts)
4. ProductID (Foreign Key referencing Products)
5. Quantity
### Payments

1. P_ID (Primary Key)
2. P_Time
3. P_Amount
4. PaymentMethod
5. OrderID (Foreign Key referencing Orders)
### ProductReviews

1. R_ID (Primary Key)
2. ReviewText
3. ProductRating
4. ProductID (Foreign Key referencing Products)
5. CustomerID (Foreign Key referencing Customers)
### Address

1. A_ID (Primary Key)
2. Address_Line
3. A_City
4. A_State
5. A_Country
6. A_ZipCode
7. IsBilling
8. IsShipping
9. CustomerID (Foreign Key referencing Customers)
### Inventory
1. Invent_ID (Primary Key)
2. StockQuantity
3. LastStock
4. ReOrder
5. UnitCost
6. ProductID (Foreign Key referencing Products)
### ERD Explanation
The Entity-Relationship Diagram (ERD) for the E-Commerce System database represents the relationships between different entities such as Sellers, Products, Customers, Orders, and more. Here's a brief explanation of key relationships:

1. **Sellers and Products:** Sellers and Products are related through the SellerID foreign key in the Products table. Each product is associated with a specific seller.

2. **Customers and Orders:** Customers can place multiple orders, and the Orders table contains the CustomerID foreign key, establishing a relationship between customers and their orders.

3. **Products and OrderItems:** The OrderItems table links products to specific orders using the ProductID and OrderID foreign keys. It allows for tracking the items included in each order.

4. **Customers and ShoppingCarts:** Customers can have multiple shopping carts. The ShoppingCarts table includes the CustomerID foreign key, connecting customers to their respective shopping carts.

5. **ShoppingCarts and CartItems:** Shopping carts contain cart items, which are products added by customers. The CartItems table has foreign keys ShoppingCartID and ProductID, establishing relationships with ShoppingCarts and Products.

6. **Orders and Payments:** Each order can have one payment associated with it. The Payments table includes the OrderID foreign key, connecting payments to specific orders.

7. **Products and ProductReviews:** Products can have multiple reviews. The ProductReviews table contains ProductID and CustomerID foreign keys, linking products to their reviews and the customers who wrote them.

# Implementation Details
## Database Creation and Data Insertion
The SQL script provided in the initial question was used to create the database schema and insert sample data into the tables. The script created tables for sellers, products, customers, orders, order items, shopping carts, cart items, payments, product reviews, addresses, and inventory.

### Challenges Faced and Solutions
1. **Data Integrity:** Ensuring data integrity across different tables and maintaining referential integrity during data insertion was a challenge. Properly defining foreign key constraints helped maintain data consistency and integrity.

2. **Complex Queries:** Formulating complex SQL queries for generating reports and extracting specific information from multiple tables was a challenge. Breakdown of queries into smaller steps and testing each step individually helped overcome this challenge.

3. **Data Validation:** Ensuring that data entered into the database adheres to defined constraints and business rules was crucial. Implementing validation checks in the application code and sanitizing user inputs helped in validating data before insertion, preventing inconsistencies and errors.

4. **Database Optimization:** Optimizing the database structure and queries for efficient performance was a concern, especially as the dataset grows. Indexing frequently used columns, denormalizing data where necessary, and analyzing query execution plans were employed to optimize the database.

5. **Scalability:** Designing the database to handle a growing number of users, products, and transactions was a challenge. Employing proper indexing, partitioning large tables, and considering sharding strategies were essential in planning for scalability.

6. **Security:** Ensuring the security of sensitive customer data and preventing unauthorized access or data breaches was a top priority. Implementing robust authentication and authorization mechanisms, encrypting sensitive data, and regularly updating security protocols were crucial solutions.

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

![E-Commerce System ERD](Q1.jpg)

*Explanation:* This ERD visually represents the relationships between different entities in the E-Commerce System. Each entity's attributes and their relationships with other entities are clearly depicted, providing a comprehensive overview of the database structure.

---

### Conclusion:

Creating a robust and efficient database system for an e-commerce application required careful planning, thoughtful design, and meticulous testing. By overcoming various challenges related to database design, data insertion, ERD visualization, and data integrity, we successfully developed a functional E-Commerce System database.

This README file serves as a comprehensive report detailing the implementation process, challenges faced, and solutions implemented during the development of the database system. The included ERD provides a visual representation of the database structure, enhancing the understanding of the relationships between different entities.

For further inquiries or clarifications, please contact the developers:

- **Azan Shahzad:** i222068@nu.edu.pk
- **Saifullah:** i237611@nu.edu.pk


