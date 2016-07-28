--1
SELECT * FROM Customers WHERE Country IN ('USA', 'UK');
GO

--2
SELECT * FROM Customers WHERE Country = 'USA' OR (Country = 'Brazil' AND Region = 'SP');
GO

--3
SELECT CustomerID, OrderID FROM Orders WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) IN ('7', '8', '9');
GO

--4
SELECT * FROM Customers 
WHERE (CompanyName LIKE 'A%' OR CompanyName LIKE 'B%' OR CompanyName LIKE 'C%' OR CompanyName LIKE 'D%' OR CompanyName LIKE 'E%' OR CompanyName LIKE 'F%' OR CompanyName LIKE 'G%') AND (CompanyName LIKE '%N' OR CompanyName LIKE '%E');
GO

--5
SELECT * FROM Customers WHERE SUBSTRING(CompanyName, 2, 1) NOT IN ('a', 'e', 'i', 'o', 'u');
GO 
-- start index in SUBSTRING starting from 1

--7
SELECT * FROM Customers WHERE Address LIKE 'P.O. Box%';
GO

--8 i
SELECT Country, COUNT(*) AS Number FROM Customers GROUP BY Country;
GO

--8 ii
SELECT Country, Region, COUNT(*) AS Number FROM Customers GROUP BY Country, Region;
GO

--8 iii
SELECT Country, Region, City, COUNT(*) AS Number FROM Customers GROUP BY Country, Region, City;
GO

--9
SELECT ContactTitle, COUNT(*) AS Number FROM Customers GROUP BY ContactTitle; 
GO 

--10
SELECT C.ContactName, COUNT(O.OrderID) AS 'Number of orders' 
FROM Customers AS C INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID GROUP BY C.ContactName;
GO

--11
SELECT TOP 10 C.ContactName, COUNT(O.OrderID) AS 'Number of orders' 
FROM Customers AS C INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID 
GROUP BY C.ContactName 
ORDER BY 'Number of orders' DESC;
GO

--12
SELECT C.ContactName, COUNT(O.OrderID) AS 'Number of orders' 
FROM Customers AS C INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID 
GROUP BY C.ContactName 
HAVING COUNT(O.OrderID) >= 5;
GO

--13 i
SELECT YEAR(OrderDate) AS Year, COUNT(*) Number FROM Orders GROUP BY YEAR(OrderDate);
GO

--13 ii
SELECT YEAR(OrderDate) AS Year, DATEPART(QQ, OrderDate) AS Month, COUNT(*) Number 
FROM Orders 
GROUP BY YEAR(OrderDate), DATEPART(QQ, OrderDate) 
ORDER BY YEAR(OrderDate);
GO

--13 iii
SELECT YEAR(OrderDate) AS Year, DATEPART(MM, OrderDate) AS Month, COUNT(*) Number 
FROM Orders 
GROUP BY YEAR(OrderDate), DATEPART(MM, OrderDate) 
ORDER BY YEAR(OrderDate);
GO

--14 i
SELECT AVG(Freight) AS "Average frieght paid", OrderID FROM Orders GROUP BY OrderID;
GO

SELECT SUM(Freight) AS "Sum frieght paid", OrderID FROM Orders GROUP BY OrderID;
GO

SELECT MIN(Freight) AS "Min frieght paid", OrderID FROM Orders GROUP BY OrderID;
GO

SELECT MAX(Freight) AS "Max frieght paid", OrderID FROM Orders GROUP BY OrderID;
GO

--14 ii
SELECT AVG(Freight) AS "Average frieght paid",  ShipName FROM Orders GROUP BY ShipName;
GO

SELECT SUM(Freight) AS "Sum frieght paid", ShipName FROM Orders GROUP BY ShipName;
GO

SELECT MIN(Freight) AS "Min frieght paid", ShipName FROM Orders GROUP BY ShipName;
GO

SELECT MAX(Freight) AS "Max frieght paid", ShipName FROM Orders GROUP BY ShipName;
GO

--14 iii
SELECT AVG(Freight) AS "Average frieght paid",  ShipCountry FROM Orders GROUP BY ShipCountry;
GO

SELECT SUM(Freight) AS "Sum frieght paid", ShipCountry FROM Orders GROUP BY ShipCountry;
GO

SELECT MIN(Freight) AS "Min frieght paid", ShipCountry FROM Orders GROUP BY ShipCountry;
GO

SELECT MAX(Freight) AS "Max frieght paid", ShipCountry FROM Orders GROUP BY ShipCountry;
GO

--14 iv
SELECT AVG(Freight) AS "Average frieght paid",  ShipVia FROM Orders GROUP BY ShipVia;
GO

SELECT SUM(Freight) AS "Sum frieght paid", ShipVia FROM Orders GROUP BY ShipVia;
GO

SELECT MIN(Freight) AS "Min frieght paid", ShipVia FROM Orders GROUP BY ShipVia;
GO

SELECT MAX(Freight) AS "Max frieght paid", ShipVia FROM Orders GROUP BY ShipVia;
GO

--15
SELECT OrderID, ProductID, SUM(UnitPrice*Quantity - UnitPrice*Quantity*Discount) AS 'Total Sale' 
FROM [Order Details] 
GROUP BY OrderID, ProductID;
GO

--16
SELECT ProductID, COUNT(ProductID) AS Number 
FROM [Order Details] 
GROUP BY ProductID;
GO

--17
SELECT OrderID, SUM(UnitPrice*Quantity - UnitPrice*Quantity*Discount) AS 'Total Sale' 
FROM [Order Details] 
GROUP BY OrderID;
GO

--18
SELECT * 
FROM (SELECT OrderID, ProductID, SUM(Quantity) AS 'Total Quantity', ROW_NUMBER() OVER(PARTITION BY OrderID 
    ORDER BY SUM(Quantity) DESC) AS RowNum 
    From [Order Details] 
    GROUP BY OrderID, ProductID) AS NEW 
WHERE NEW.RowNum <= 10;
GO

--19
SELECT C.ContactName, COUNT(O.CustomerID) AS 'Total order number' 
FROM Customers AS C LEFT JOIN Orders AS O ON C.CustomerID = O.CustomerID 
WHERE YEAR(O.OrderDate) = 1997 AND (Country = 'Brazil' AND Region = 'SP') 
GROUP BY C.ContactName 
ORDER BY C.ContactName;
GO

--20
SELECT * 
FROM (SELECT C.ContactName, COUNT(O.CustomerID) AS 'Total' 
    FROM Customers AS C LEFT JOIN Orders AS O ON C.CustomerID = O.CustomerID 
    WHERE YEAR(O.OrderDate) = 1998 AND (Country = 'Brazil' AND Region = 'SP') 
    GROUP BY C.ContactName) AS NEW 
WHERE NEW.Total >= 7;





