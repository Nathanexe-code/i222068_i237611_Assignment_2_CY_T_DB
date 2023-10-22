-- Question 24 --

Select P.P_Category AS ProductCategory, COUNT(OI.ProductID) AS TotalProductsSold
From Products P
Left Join OrderItems OI ON P.Product_ID = OI.ProductID
Group By P.P_Category
Having COUNT(OI.ProductID) > 10
Order By TotalProductsSold Desc;