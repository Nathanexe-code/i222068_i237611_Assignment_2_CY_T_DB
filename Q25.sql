-- Question 25 --

Select C.C_ID, C.C_Name, COUNT(Distinct O_ID) AS NumberOfOrders
From Customers C
Join Orders O ON C.C_ID = O.CustomerID
Group By C.C_ID, C.C_Name
Having COUNT(Distinct O_ID) > 5
Order By NumberOfOrders DESC;