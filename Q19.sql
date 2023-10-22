-- Question 19 --

Select P.Product_ID, P.P_Name, P.P_Status, P.P_Price, AVG(PR.ProductRating) AS AvgRating
From Products P
Left Join ProductReviews PR ON P.Product_ID = PR.ProductID
Where P.Product_ID NOT IN (Select Distinct ProductID From ProductReviews)
And P.Product_ID IN (Select ProductID From Inventory Where StockQuantity > 0)
Group By P.Product_ID, P.P_Name, P.P_Status, P.P_Price;
