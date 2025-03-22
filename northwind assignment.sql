-- 1.Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.
SELECT CategoryName, Description
FROM categories
ORDER BY CategoryName
limit 5;

-- 2.Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.
SELECT ContactName, CompanyName, ContactTitle, Phone
FROM customers
ORDER BY Phone
limit 5;

-- 3.Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname respectively and HireDate from the employees table sorted from the newest to the oldest employee.
SELECT UPPER(FirstName) AS "FirstName", UPPER(LastName) AS "LastName", HireDate
FROM employees
ORDER BY HireDate Desc;

-- 4.Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted by Freight in descending order.
SELECT OrderID, OrderDate, ShippedDate, CustomerID, Freight
FROM orders
ORDER BY Freight
limit 10;

-- 5. Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.
SELECT LOWER(CustomerID) AS "ID"
FROM customers;

-- 6.Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the Country in descending order then by CompanyName in ascending order.
SELECT CompanyName, Fax, Phone, Country, HomePage
FROM suppliers
ORDER BY Country DESC;

SELECT CompanyName, Fax, Phone, Country, HomePage
FROM suppliers
ORDER BY CompanyName ASC;

-- 7.Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only.
SELECT CompanyName, ContactName
FROM customers
WHERE city = "‘Buenos Aires'";

-- 8.Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
SELECT ProductName, UnitPrice, QuantityPerUnit
FROM products
WHERE UnitsInStock = 0;

-- 9.Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
SELECT ContactName, Address, City
FROM customers
WHERE Country NOT IN  ('Germany', 'Mexico', 'Spain');

-- 10.Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.
SELECT OrderDate, ShippedDate, CustomerID, Freight
FROM orders
WHERE OrderDate = "1996-05-21";

-- 11.Create a report showing FirstName, LastName, Country from the employees not from United States.
SELECT FirstName, LastName, Country
FROM employees 
WHERE Country NOT IN ('United States');


-- 12.Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later than the required date.
SELECT EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
FROM orders
WHERE RequiredDate < ShippedDate;

-- 13.Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B.
SELECT City, CompanyName, ContactName
FROM customers
WHERE City LIKE "%A%" OR "%B%";

-- 14. Create a report showing all the even numbers of OrderID from the orders table.
SELECT OrderID
FROM orders
WHERE mod(OrderID,2) = 0;

-- 15Create a report that shows all the orders where the freight cost more than $500.
SELECT *
FROM orders
WHERE Freight >'$500';

-- 16.Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder.
SELECT ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel
FROM products
WHERE UnitsInStock = 0;

-- 17.Create a report that shows the CompanyName, ContactName number of all customer that have no fax number.
SELECT CompanyName, ContactName, Phone
FROM customers
WHERE Fax = 0;

-- 18.Create a report that shows the FirstName, LastName of all employees that do not report to anybody.
SELECT FirstName, LastName
FROM employees
WHERE ReportsTo = 0;

-- 19. Create a report showing all the odd numbers of OrderID from the orders table.
SELECT OrderID
FROM orders
WHERE mod(OrderID,2) != 0;

-- 20. Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName.
SELECT CompanyName, ContactName
FROM customers
WHERE Fax = 0
ORDER BY ContactName;

-- 21.Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName.
SELECT City, CompanyName, ContactName
FROM customers
WHERE City = "%L%"
ORDER BY ContactName;

-- 22.Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s.
SELECT FirstName, LastName, BirthDate
FROM employees
WHERE BirthDate >= 1950;

-- 23.Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table.
SELECT FirstName, LastName, year(BirthDate) AS Birthyear
FROM employees;

-- 24 Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by OrderID and sorted by NumberofOrders in descending order. 
-- HINT: you will need to use a Groupby statement. 
SELECT OrderID, COUNT(OrderID) AS NumberofOrders
FROM `order details`
GROUP BY OrderID
ORDER BY NumberofOrders DESC;

-- 25 Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids, 
-- Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID 
SELECT suppliers.SupplierID, ProductName, CompanyName
FROM products
JOIN suppliers
ON products.SupplierID=suppliers.SupplierID
WHERE CompanyName IN ('Exotic Liquids', 'Specialty Biscuits, Ltd','Escargots Nouveaux')
ORDER BY  SupplierID;

-- 26 Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with "98124". 
SELECT ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
FROM orders
WHERE ShipPostalCode=98124;

-- 27Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle. 
SELECT ContactName, ContactTitle, CompanyName
FROM customers
WHERE ContactTitle NOT LIKE "%Sales%";
 
-- 28Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle"; 
SELECT LastName, FirstName, City
FROM employees
WHERE City NOT LIKE "%Seattle%";

-- 29 Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain other than Madrid. 
SELECT CompanyName, ContactTitle, City, Country
 FROM customers
 WHERE  City NOT LIKE "%Madrid%";
 
 SELECT *
 FROM categories;
 
 SELECT *
 FROM orders;
 
 SELECT * 
 FROM employees;
 
 -- 30 Create a select statement that outputs the following: 
 SELECT concat(LastName,FirstName,' ','can be reached at X','', Extension) AS CONTACTINFO
 FROM employees;
 
 SELECT *
 FROM suppliers;
 -- 31 Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname. 
 SELECT ContactName
 FROM customers
 WHERE ContactName NOT LIKE "%_A%";
 
 -- 32 Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock 
-- and maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively. 
SELECT round(AVG(UnitPrice)) AS AVGPrice,SUM(UnitsInStock) AS TotalStock,MAX(UnitsOnOrder) AS MaxOrder
FROM products;

-- 33 Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and categories table. 
SELECT products.SupplierID,CompanyName, CategoryName, ProductName, UnitPrice
FROM products
JOIN suppliers
ON products.SupplierID=suppliers.SupplierID
JOIN categories
ON products.CategoryID=categories.CategoryID;

-- 34  Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped by CustomerID. HINT: you will need to use a Groupby and a Having statement. 
SELECT CustomerID,SUM(Freight) AS TotalFreight
FROM orders
GROUP BY CustomerID
HAVING SUM(Freight)>200;

-- 35 Create a report that shows the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and customers table with discount given on every purchase. 
SELECT `order details`.OrderID, ContactName, `order details`.UnitPrice, `order details`.Quantity,`order details`.Discount
FROM `order details`
JOIN orders
ON `order details`.OrderID=orders.OrderID
JOIN customers
ON orders.CustomerID=customers.CustomerID;

-- 36 Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of who they report to as manager from the employees table sorted by Employee ID. HINT: This is a SelfJoin. 
SELECT CONCAT(EmployeeID,LastName,FirstName) AS employee
FROM employees E1
JOIN employees WHERE ReportsTo= E2
ON E1.EmployeeID=E2.EmployeeID;

-- 37  Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice respectively. 
SELECT  AVG(UnitPrice) AS AVGPrice,MIN(UnitPrice) AS MinimumPrice,MAX(UnitPrice) AS MaximumPrice
FROM products;

-- 38 Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, 
-- Address, City, Country, Phone, OrderDate,  RequiredDate,  ShippedDate from the customers and orders table. HINT: Create a View. 
CREATE VIEW CustomerInfo AS SELECT customers.CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, OrderDate,  RequiredDate,  ShippedDate
FROM customers
JOIN orders
ON customers.CustomerID=orders.CustomerID;

-- 39 Change the name of the view you created from customerinfo to customer details. 
CREATE VIEW CustomerDetails AS SELECT*
FROM CustomerInfo;

-- 40 Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, 
-- QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and categories tables. HINT: Create a View 
CREATE VIEW ProductDetails AS SELECT products.ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM suppliers
JOIN products
ON suppliers.SupplierID=products.ProductID
JOIN categories
ON products.CategoryID=categories.CategoryID;

-- 41 Drop the customer details view.
DROP VIEW CustomerDetails;

-- 42 Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo 
SELECT LEFT (CategoryName,5) AS ShortInfo
FROM categories;

-- 43 Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table HINT: Create a Table, use the LIKE Statement and INSERT INTO statement.   
CREATE TABLE shippers_duplicate LIKE shippers;
INSERT INTO shippers_duplicate
SELECT *
FROM shippers;

SELECT *
FROM shippers_duplicate;
DROP TABLE  shippers_duplicate;
-- 44 Create a select statement that outputs the following from the shippers_duplicate Table
SELECT ShipperID,CompanyName,Phone,CONCAT(CompanyName,'@gmail') AS Email
FROM  shippers_duplicate;


-- 45 Create a report that shows the CompanyName and ProductName from all product in the Seafood category
SELECT CompanyName,ProductName
FROM products
ORDER BY Seafood;

-- 46 Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5. 
SELECT products.CategoryID, suppliers.CompanyName,products.ProductName
FROM products
JOIN suppliers
ON products.SupplierID=suppliers.SupplierID
WHERE CategoryID = 5;

-- 47 Delete the shippers_duplicate table. 
DROP TABLE shippers_duplicate;

SELECT *
FROM products;
-- 48  Create a select statement that ouputs the following from the employees table. NB:  The age might differ depending on the year you are attempting this query. 
SELECT LastName,FirstName,Title,(year(now())-year(Birthdate)) AS Age
FROM employees;

-- 49 Create a report that the CompanyName and total number of orders by customer renamed as number of orders since Decemeber 31, 1994. Show number of Orders greater than 10. 


-- 50 Create a select statement that ouputs the following from the product table 
SELECT concat(ProductName,' ',QuantityPerUnit,' ','and cost',' ',UnitPrice) AS ProductInfo
FROM products;

