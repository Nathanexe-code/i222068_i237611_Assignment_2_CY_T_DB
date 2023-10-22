-- Question 20 --

Select Top 3 P.Product_ID, P.P_Name, P.P_Status, P.P_Price, SUM(OI_Quantity * P_Price) AS TotalSales, PR.R_ID, PR.ReviewText, PR.ProductRating, PR.CustomerID
From Products P
Join OrderItems OI ON P.Product_ID = OI.ProductID
Join ProductReviews PR ON P.Product_ID = PR.ProductID
Group By P.Product_ID, P.P_Name, P.P_Status, P.P_Price, PR.R_ID, PR.ReviewText, PR.ProductRating, PR.CustomerID
Order By TotalSales DESC;