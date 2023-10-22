-- Question 17 --

Select Top 5 O.O_ID, O.O_Number, O.O_Time, O.O_TotalPrice, C.C_ID, C.C_Name, OI.OrderItemID, OI.ProductID, OI.OI_Quantity
From Orders O
Join Customers C ON O.CustomerID = C.C_ID
Join OrderItems OI ON O.O_ID = OI.OrderID
Order By O.O_Time DESC;