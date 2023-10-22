-- Question 18 --

Select C.C_ID, C.C_Name, COUNT(Distinct P.SellerID) AS NumberOfCategories
From Customers C
Join Orders O ON C.C_ID = O.CustomerID
Join OrderItems OI ON O.O_ID = OI.OrderID
Join Products P ON OI.ProductID = P.Product_ID
Group By C.C_ID, C.C_Name
Having COUNT(Distinct P.SellerID) = (Select COUNT(Distinct SellerID) From Products);