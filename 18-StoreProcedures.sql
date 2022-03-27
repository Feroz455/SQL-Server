/*
* WHAT  is store procedure 
store procedure example 
Creating a stored procedure with parameters 
Creating a stored Procedure with parameters 
Altering sp 
Viewing the text of the SP
DROPing the sp 

Store Procedure 
A store Procedure is a groupe od T-SQL (Transact sql) statement.IF you have 
a situatuon, where you write the same query over and over again, You can save 
that specify quere as a stored Procedure and call it hust by it's name 


1. Use CAREATE PROCESURE or CEATE PROC statement to create store procedure 
NOTE:  When naming user defined store Procedure, Microsoft recommends not to use 
sp_as a prefix. All system stored procedure are prefixed with sp_.This avoids any 
ambiguity between user defined and system stored procedures and any conflicte,
with some future system procedure
*/

/*
To execute the store procedure 
1: spGetEmployees 
2: EXECspGetEmployee 
3: Execute spGETEmployee
NOTE: You can also right click on the procedure name, in object explorer in 
SQL server Managemnet studio and select EXECUTES STORED PROCEDURE
*/
-- create a store Procedure 
CREATE PROCEDURE spGetEmployee
AS
BEGIN
select * from tblEmployee 
END

--Store procedure execution
spGetEmployee

-- or 
Exec spGetEmployee

-- OR 
Execute  spGetEmployee
/*
1	Tom		Male	4000	London
2	Pam		Female	3000	New York
3	John	Male	3500	London
4	Sam		Male	4500	London
5	Todd	Male	2800	Sydney
6	Ben		Male	7000	New York
7	Sara	Female	4800	Sydney
8	Valarie	Female	5500	New York
9	James	Male	6500	London
10	Russel	Male	8800	London
11	Firoz	Male	0	Dhaka
*/


--Store procedure with parameter 

CREATE PROCEDURE spGetEMployeeByGender
@gender nvarchar(20),
@city nvarchar(50)
as
begin
Select Name, Gender, Salary, city 
from tblEmployee 
where Gender = @gender and city = @city 
end 

--Execute store procedure  with parameter
spGetEMployeeByGender 'Male', 'London'
/*
Tom		Male	4000	London
John	Male	3500	London
Sam		Male	4500	London
James	Male	6500	London
Russel	Male	8800	London
*/
--Execute store procedure  with parameter
spGetEMployeeByGender 'Female', 'New York'
/*
Pam		Female	3000	New York
Valarie	Female	5500	New York
*/



--Store procedure with parameter 
CREATE PROCEDURE spGetEMployeeByGenderAndSalary
@gender nvarchar(20),
@salary int
as
begin
Select Name, Gender, Salary, city 
from tblEmployee 
where Gender = @gender and salary > @salary
end 
--execute storeprocedure spGetEMployeeByGenderAndSalary
execute spGetEMployeeByGenderAndSalary @salary = 4000, @gender = "male"
/*
output 
Sam		Male	4500	London
Ben		Male	7000	New York
James	Male	6500	London
Russel	Male	8800	London
*/
--execute storeprocedure spGetEMployeeByGenderAndSalary
execute spGetEMployeeByGenderAndSalary @gender = "male", @salary = 4000
/*
OUTPUT 
Sam		Male	4500	London
Ben		Male	7000	New York
James	Male	6500	London
Russel	Male	8800	London
*/
--execute storeprocedure spGetEMployeeByGenderAndSalary
execute spGetEMployeeByGenderAndSalary 'male',4000
/*
Sam		Male	4500	London
Ben		Male	7000	New York
James	Male	6500	London
Russel	Male	8800	London
*/


/*
Store Procedure with Parameters
Paremeters and variables have an @prefix in their name 

to EXECUTE 
execute spGetEMployeeByGenderAndSalary 'male',4000
execute spGetEMployeeByGenderAndSalary @salary = 4000, @gender = "male"


-> 
to view the text, of the store procedure 

1. Use sysytem store procedure sp_helptext'SPname'
OR 
2.Right click the SP in Object explorer-> Scrip Procedure as -> Create to -> NEWQUERY EDITOR 
WINDO


To change the store procedure, use Alter Procedure statement 
TO delete the store Procedure ,use Procedure'SPname' or Drop PROCEDURE'SPname'

To encrypt text of the SP use WITH ENCRYPTION option, IT is not possible 
to view the text of n encrypted SP
*/

--TO view Store procedure text 
sp_helptext spGetEMployeeByGenderAndSalary
/*
--Store procedure with parameter   
CREATE PROCEDURE spGetEMployeeByGenderAndSalary  
@gender nvarchar(20),  
@salary int  
as  
begin  
Select Name, Gender, Salary, city   
from tblEmployee   
where Gender = @gender and salary > @salary  
end 
*/

--Alter store procedure 
alter Procedure spGetEMployeeByGenderAndSalary
@gender nvarchar(20),
@salary int
as
begin
Select Name, Gender, Salary, city 
from tblEmployee 
where Gender = @gender and salary > @salary
Order by Name
end 

--execute storeprocedure spGetEMployeeByGenderAndSalary
execute spGetEMployeeByGenderAndSalary 'male',4000

--Drop store procedure 
Drop procedure spGetEMployeeByGenderAndSalary


--Alter store procedure 
alter Procedure spGetEMployeeByGenderAndSalary
@gender nvarchar(20),
@salary int
WITH encryption
as
begin
Select Name, Gender, Salary, city 
from tblEmployee 
where Gender = @gender and salary > @salary
Order by Name
end 

--execute storeprocedure spGetEMployeeByGenderAndSalary
execute spGetEMployeeByGenderAndSalary 'male',4000

--TO view Store procedure text after encryption
sp_helptext spGetEMployeeByGenderAndSalary
/*
Error message 
The text for object 'spGetEMployeeByGenderAndSalary' is encrypted.
*/