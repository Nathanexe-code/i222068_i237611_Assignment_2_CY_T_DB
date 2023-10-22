-- Question 5 --

Select P_Name, AVG(ProductRating) AS AvgRating
From ProductReviews
Join Products ON ProductReviews.ProductID = Products.Product_ID
Group By P_Name
Order By AvgRating DESC;