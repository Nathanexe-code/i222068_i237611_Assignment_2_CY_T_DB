-- Question 13 --

Select C_ID, C_Name
From Customers
Where C_ID IN (
    Select CustomerID
    From Orders
    Where O_Time >= DATEADD(day, -30, GETDATE())
);