-- Question 16 --

Select Top 5 P_Name, SUM(OI_Quantity * P_Price) AS TotalSales
From OrderItems
Join Products ON OrderItems.ProductID = Products.Product_ID
Join Orders ON OrderItems.OrderID = Orders.O_ID
Where O_Time >= DATEADD(month, -1, GETDATE())
Group By P_Name
Order By TotalSales DESC;