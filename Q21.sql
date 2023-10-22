-- Question 21 --

Select C.C_ID, C.C_Name, O.O_ID, O.O_Number, O.O_Time, O.O_TotalPrice, A.A_ID, A.Address_Line, A.A_City, A.A_State, A.A_Country, A.A_ZipCode
From Customers C
Full Join Orders O ON C.C_ID = O.CustomerID
Full Join Address A ON C.C_ID = A.CustomerID
Order By C.C_ID, O.O_ID, A.A_ID;