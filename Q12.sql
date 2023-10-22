-- Question 12 --

Select C.C_ID, C.C_Name
From Customers C
Join Orders O ON C.C_ID = O.CustomerID
Join OrderItems OI ON O.O_ID = OI.OrderID
Join Products P ON OI.ProductID = P.Product_ID
Where C.C_ID IN (
    Select C1.C_ID
    From Customers C1
    Join Orders O1 ON C1.C_ID = O1.CustomerID
    Join OrderItems OI1 ON O1.O_ID = OI1.OrderID
    Join Products P1 ON OI1.ProductID = P1.Product_ID
    Group By C1.C_ID
    Having COUNT(Distinct P1.SellerID) >= 2
);
