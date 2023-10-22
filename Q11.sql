-- Question 11 --

Select Top 3 O_ID, O_Number, O_Time, O_TotalPrice
From Orders
Where CustomerID = 1
Order By O_Time DESC;