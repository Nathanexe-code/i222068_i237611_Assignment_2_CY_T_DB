-- Question 10 --

Select C_ID, C_Name, COUNT(O_ID) AS NumberOfOrders
From Orders
Join Customers ON Orders.CustomerID = Customers.C_ID
Group By C_ID, C_Name
Having COUNT(O_ID) > 5;