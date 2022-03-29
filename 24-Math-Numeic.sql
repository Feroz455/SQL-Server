--SQL server Math/Numeric Function 
--ABS() function 
declare @number decimal;
set @number = -243.5
select abs(@number) as absNum;
--244

--Acos() function 
Select ACOS(0.25);
--//1.31811607165282
--Acos() function 
Select ACOS(-0.8);
--//2.49809154479651

--ASIN() Function
Select ASIN(0.25);
--//0.252680255142079
Select ASIN(-0.8);
--//-0.927295218001612


--ATAN() function 
Select ATAN(0.25);
--//0.244978663126864
Select ATAN(-0.8);
--//-0.674740942223553

--ATN2() function
SELECT ATN2(-0.8, 2);
--//-0.380506377112365

Use My_new_database 
GO
select * from tblEmployee

select AVG(Salary) as AverageSalary From tblEmployee
--//4581

Create table Suppliers
(
SupplierID	int NOT NULL PRIMARY KEY,
SupplierName nvarchar(100) NOT NULL, 
ContactName	 nvarchar(100) NOT NULL,
Address	nvarchar(100) NOT NULL,
City nvarchar(100) NOT NULL,
PostalCode	nvarchar(50) NOT NULL,
Country	nvarchar(50) NOT NULL,
Phone nvarchar(50) NOT NULL
)
Select * from Suppliers

Create table Customers
(
CustomerID int NOT NULL PRIMARY KEY,
CustomerName nvarchar(100) NOT NULL, 
ContactName nvarchar(100) NOT NULL,
Address nvarchar(100) NOT NULL,
City nvarchar(100) NOT NULL,
PostalCode nvarchar(50) NOT NULL,
Country nvarchar(50) NOT NULL,
)
SELECT * FROM Customers;


Create table Products
(
ProductID int NOT NULL PRIMARY KEY,
ProductName nvarchar(50) NOT NULL,
SupplierID int NOT NULL default 0,
CategoryID int NOT NULL,
Unit nvarchar(50) NOT NULL,
Price decimal NOT NULL
)
SELECT * FROM Products;


--Select AVG( ) function 
Select AVG(PRICE) FROM Products;
Select * from Products 
Where Price > (Select AVG(PRICE) FROM Products);

--CEILING() function
--Return the smallest integer value that is grater than or equal to a number
select CEILING(25.75) as CeilValue
--//26
Select CEILING(-13.5) as CeilValue
--//-13

--Return the smalle integer value that is lesst than or equal to a number
select FLOOR(25.75) as CeilValue
--//25

--Count() Function 
select COUNT(ProductID)as NumberOfProducts from Products
--//77

--COS() function 
Select COS(2)
--//-0.416146836547142

select cos(PI());
--//-1

--COT() Function 
select COT(6);
--//-3.43635300418013
--COT() Function 
select COT(-6);
--/-3.43635300418013


--Degrees() function
select DEGREES(1.5);
--//85.943669269623484297
select DEGREES(PI()*2);
--//360

--EXP() function 
select EXP(1)
--//2.71828182845905

--Floor() function 
--Return the largerst integer value that is equall to or less
--than 25.75 
select floor(25.75) as FloorValues
--//25

--LOG() funcion 
select LOG(2); 
--//0.693147180559945

--LOG(number, base) -- Syntax for SQL Server
SELECT LOG(2, 4);
--//0.5

--LOG10() function 
select LOG10(2);
--//0.301029995663981
select LOG10(4.5);
--//0.653212513775344

--MAX() Function 
--Find the price of the most expensive product in the 
--'Products' table
select MAX(Price) as largestPrice From Products
--//264


--MIN() Function 
--Find the price of the chip product in the 
--'Products' table
select MIN(Price) as largestPrice From Products
--//3


--PI() Function 
Print(PI());
--//3.14159
--Power() function
select POWER(4,2);
--//16

--Radians() function 
select RADIANS(180);
--//3
select RADIANS(-45);
--//0

--RAND() Function

select Rand()*100;-- function
--//44.4846886693546

select Rand()*(10-5)+5;
--//select Rand()*100

--Return a random number >= 5 and <= 10

select floor(rand() * (10-5+1)+5)
--///9

--Round() fucntion
select ROUND(235.416, 0) as Roundvalue
--//235.000
--Round the number to 2 decimal place, and also 
--use the operation parameter:
select ROUND(235.415, 2, 1) as RoundValue
--//235.410
select ROUND(235.415, 2, -1) as RoundValue
--//235.410
--SIGN() function 
--Return the sign of a number
select SIGN(255.5);
/*
Definition and Usage
The SIGN() function returns the sign of a number.

This function will return one of the following:

If number > 0, it returns 1
If number = 0, it returns 0
If number < 0, it returns -1
*/
select SIGN(-12);
--//-1

--SIN() function 
--return the sine of a number
select SIN(0);
--//0
--return the sine of a number
select SIN(-1);
--//-0.841470984807897

--SQRT() function

--the SQRT() function returns the square root of a number.
select sqrt(64);
--//8
select sqrt(13);
--//3.60555127546399

--SQUARE() function 
--The square() function teturns the square of a number

select SQUARE(2);
--//4
select SQUARE(11);
--//121



--Create Orders table
create table Orders
(
	OrderID	 INT NOT NULL PRIMARY key,
	CustomerID	int NOT NULL,
	EmployeeID	int NOT NULL,
	OrderDate	varchar(20) NOT NULL,
	ShipperID int NOT NULL
)
use My_new_database 
Go 
select * from Orders
drop table Orders


-- Create table OrderDetails;
Create table OrderDetails
(
OrderDetailID int NOT NULL primary key,
OrderID int NOT NULL,
ProductID int not null,
Quantity int not null
)
select * from OrderDetails


--SUM() Function
--The sum() function calculates the sum of a set of values 
-- Note NULL values are ignored

select SUM(Quantity) as TotalItemsOrdered From OrderDetails
--//12743

--//Tan() Function 
--The TAN() Fuction returns the tangent of a number
select TAN(1.75);
--//-5.52037992250933

select TAN(-3);
--//0.142546543074278