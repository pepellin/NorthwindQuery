--1
SELECT TerritoryDescription FROM Territories WHERE TerritoryDescription LIKE '%Santa%';
GO

--2
SELECT TerritoryDescription FROM Territories WHERE TerritoryDescription LIKE 'C%';
GO

--3
SELECT TerritoryDescription FROM Territories WHERE TerritoryDescription LIKE '%boro%';
GO

--4
SELECT ContactName, ContactTitle FROM Customers WHERE ContactTitle LIKE 'Owner%';
GO

--5
SELECT CompanyName, HomePage FROM Suppliers WHERE HomePage IS NOT NULL;
GO

--6
SELECT CompanyName, HomePage FROM Suppliers WHERE HomePage IS NULL;
GO

--7
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice >= 50;
GO

--8
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice < 10;
GO

--9
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice <= 10;
GO

--10
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice >= 15 AND UnitPrice <= 20;
GO

--11
SELECT ProductName, UnitsOnOrder FROM Products WHERE UnitsOnOrder > 0;
GO

--12
SELECT FirstName, LastName, DATEDIFF(year, BirthDate, GETDATE()) AS Age FROM Employees;
--SYSDATETIME()
GO

--13
SELECT FirstName, LastName, DATEDIFF(year, HireDate, GETDATE()) AS 'Years with Northwind' FROM Employees;
--SYSDATETIME()
GO

--14
SELECT SUM(Freight) AS 'Freight Total' FROM Orders;
GO

--15
SELECT SUM(Freight) AS 'Freight Total' FROM Orders WHERE YEAR(OrderDate) = '1996';
GO

--16
SELECT SUM(Freight) AS 'Freight Total' FROM Orders WHERE YEAR(OrderDate) = '1997';
GO

--17
SELECT SUM(Freight) AS 'Freight Total' FROM Orders WHERE YEAR(OrderDate) = '1998';
GO

--18
SELECT OrderID, ShipCountry FROM Orders WHERE ShipCountry IN ('Switzerland', 'Venezuela', 'Austria');
GO

--19
SELECT DISTINCT ShipCity FROM Orders WHERE ShipCountry IN ('Belgium', 'Mexico', 'Sweden');
GO

--20
SELECT C.CategoryName, P.ProductName 
FROM Products AS P LEFT JOIN Categories AS C ON P.CategoryID = C.CategoryID 
WHERE C.CategoryName in ('Dairy Products', 'Seafood', 'Beverages');