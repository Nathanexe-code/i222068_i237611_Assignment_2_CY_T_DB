-- Question 23 --

Select P.Product_ID, P.P_Name AS Product_Name, 'Electronics' AS Product_Category, OI.OI_Quantity AS Order_Quantity, P.P_Price AS Order_Price, OI.OI_Quantity * P.P_Price AS Total_Revenue
From Products P
Left Join OrderItems OI ON P.Product_ID = OI.ProductID
Left Join Orders O ON OI.OrderID = O.O_ID
Where P.P_Status = 'In Stock' And P.Product_ID In (Select ProductID From Products Where P_Status = 'In Stock' And Product_ID In (Select ProductID From OrderItems Group By ProductID Having SUM(OI_Quantity) Between 5 And 10))
Order By Total_Revenue Desc;
