-- Question 8 --

Select C_ID, C_Name
From Customers
Where C_ID NOT IN (Select CustomerID From ProductReviews);