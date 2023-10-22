-- Question 7 --

Select P_Name, SUM(OI_Quantity * P_Price) AS TotalRevenue
From OrderItems
Join Products ON OrderItems.ProductID = Products.Product_ID
Group By P_Name
Order By TotalRevenue DESC;