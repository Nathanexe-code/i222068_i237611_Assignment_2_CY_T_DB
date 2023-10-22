-- Question 15 --

Select Top 5 P_Name, COUNT(OI.OrderID) AS NumberOfOrders
From OrderItems OI
Join Products ON OI.ProductID = Products.Product_ID
Group By P_Name
Order By NumberOfOrders DESC;