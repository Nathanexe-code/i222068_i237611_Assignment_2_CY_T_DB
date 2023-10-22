-- Question 6 --

Select C_ID, C_Name, COUNT(Distinct O_ID) AS NumberOfPurchases
From Orders
Join Customers ON Orders.CustomerID = Customers.C_ID
Group By C_ID, C_Name, CONVERT(Date, O_Time)
Having COUNT(Distinct O_ID) > 1;