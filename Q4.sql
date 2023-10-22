-- Question 4 --

Select Top 5 C.C_ID, C.C_Name, SUM(O.O_TotalPrice) AS TotalSpent
From Customers C
Join Orders O ON C.C_ID = O.CustomerID
Group By C.C_ID, C.C_Name
Order By TotalSpent DESC;