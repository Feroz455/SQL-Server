/*
Group by clause is used to group a selected set of rows into a set of summary rws by the values of 
one or more column or expresions. It is always used in conjunction with one or more aggregate function

SELECT city, sum(salary) as Totalsalary From tblemployee Group by city

Note: If you omit , the GROUP by clause and try to execute the query, you ger an error 
Column 'tblEmployee.city' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.


Filtering Groups :
WHERE clause is used to filter rows before aggregation, where as HAVIG clause is used 
to filter groups after aggregation, The following 2 queris produce the same result.


Select city, SUM(salary) as TOTALSalary from tblEmployee where city = 'London' group by city

Select city, SUM(Salary) as TotalSalary from tblEmployee group BY city  having city = 'London'

NOTE: From a perfomance standpoint, You cannot say that one method is less efficiecnt than 
the other. SQL server optimizer analyses each statement and selects an efficient way of executing it.
as a best practice use the syntax that clearly describes the desired result. Try to eleminate rows that 
you wouldn't need as early as possible
*/
--Create table with column ID, name, gender, salary, city,
use My_new_database
go
Create table tblEmployee
(
	ID int identity(1,1) primary key,
	Name nvarchar(50) NOT NULL,
	Gender nvarchar(10) NULL  default 'Unknown',
	Salary int NOT NULL,
	city nvarchar(50) NOT NULL
)
--showing result into console
use My_new_database
GO
select *from tblEmployee 
order by Salary  


--insert data into tblEmployee table 
insert into tblEmployee(Name, Gender, Salary, city) values('Tom', 'Male', 4000, 'London');
insert into tblEmployee(Name, Gender, Salary, city) values('Pam', 'Female', 3000, 'New York');
insert into tblEmployee(Name, Gender, Salary, city) values('John', 'Male', 3500, 'London');
insert into tblEmployee(Name, Gender, Salary, city) values('Sam', 'Male', 4500, 'London');
insert into tblEmployee(Name, Gender, Salary, city) values('Todd', 'Male', 2800, 'Sydney');
insert into tblEmployee(Name, Gender, Salary, city) values('Ben', 'Male', 7000, 'New York');
insert into tblEmployee(Name, Gender, Salary, city) values('Sara', 'Female', 4800, 'Sydney');
insert into tblEmployee(Name, Gender, Salary, city) values('Valarie', 'Female', 5500, 'New York');
insert into tblEmployee(Name, Gender, Salary, city) values('James', 'Male', 6500, 'London');
insert into tblEmployee(Name, Gender, Salary, city) values('Russel', 'Male', 8800, 'London');
insert into tblEmployee(Name, Gender, Salary, city) values('Firoz', 'Male', 0, 'Dhaka');

--Group by city 
Select city, SUM(salary) as Totalsalary 
From tblEmployee GROUP BY CITY


--showing result into console
use My_new_database
GO
select *from tblEmployee 
order by Salary  

--total sum of a column "Use of SUM"
Select sum(salary) as TOTAL_SALARY  from tblEmployee

--Use of MIN
Select MIN(salary) as MIN_SALARY  from tblEmployee

--Use of MAX
Select MAX(salary) as MAX_SALARY from tblEmployee

  
--Group by city  "Use of sUM"
Select city, SUM(salary) as Totalsalary 
From tblEmployee GROUP BY CITY

--Group by city  "Use of MIN"
Select city, MIN(salary) as MIN_SALARY 
From tblEmployee GROUP BY CITY

--Group by city  "USE of MAX"
Select city, MAX(salary) as MAX_SALARY 
From tblEmployee GROUP BY CITY

--Group by city and than gender
Select city, Gender, SUM(salary) as MAX_SALARY 
From tblEmployee GROUP BY city, Gender  order by city

--Total number of records 
Select COUNT(ID)as Total_employee from tblEmployee

--Group by city and than gender
Select city, Gender, 
SUM(salary) 
as TOTA_SALARY,
count(ID) as [Total employee] 
From tblEmployee
GROUP BY city,
Gender  order by city

--Group by city and than gender
Select city, Gender, 
SUM(salary) 
as TOTA_SALARY,
count(ID) as [Total employee] 
From tblEmployee
where Gender = 'Male'
GROUP BY city,
Gender  order by city

--use having class 
--Group by city and than gender
Select city, Gender, 
SUM(salary) 
as TOTA_SALARY,
count(ID) as [Total employee] 
From tblEmployee
GROUP BY city,Gender
HAVING Gender = 'Male'

/*
DIfference - Where and Having 

1. WHERE clasuse can be used with- Select, insert, and Update statements
Where as Having clasuse can only be used with the SelectSatment.
2. WHERE filters rows befor aggregation(GROUPING), Where as Having filters
, After the aggregation are Performed

3. Aggregate function cannot be used un the WHERE clause, unless it is 
in sub query cantained in a HAVING clause, wheres, aggegate functions 
can be used in Having clause



*/
/*
An aggregate may not appear in the WHERE clause unless it is in a subquery contained in a 
HAVING clause or a select list, and the column being aggregated is an outer reference.
*/
select * from tblEmployee where SUM(Salary) > 4000

--Group by city and than gender
Select city, Gender, 
SUM(salary) 
as TOTA_SALARY,
count(ID) as [Total employee] 
From tblEmployee
GROUP BY city,Gender
HAVING SUM(Salary) > 4000