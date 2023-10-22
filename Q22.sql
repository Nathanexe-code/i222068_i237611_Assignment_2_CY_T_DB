-- Question 22 --

Select P_Name, COUNT(Distinct Product_ID) AS NumberOfProducts, SUM(OI_Quantity * P_Price) AS TotalRevenue
From Products
Left Join OrderItems ON Products.Product_ID = OrderItems.ProductID
Group By P_Name
Order By TotalRevenue DESC;