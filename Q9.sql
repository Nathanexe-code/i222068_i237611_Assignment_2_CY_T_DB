-- Question 9 --

Select P_Name, StockQuantity
From Products
Join Inventory ON Products.Product_ID = Inventory.ProductID
Where StockQuantity < (Select AVG(StockQuantity) From Inventory);