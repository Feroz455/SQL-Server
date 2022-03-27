/*
Joins in SQL server 

Joins in SQL server are used to retriev data from 2 or more releated table. In 
General tables are related to each other using forrign key constraints


IN SQL server, there are different types of JOINS 
1. Inner join 
2. Outer join 
3. Cross Join

Outer joins are again devided into 
1. Left join or left outer join 
2. Right join or right outer join 
3. Full join or full outer join 
*/

--CONSTRAINT FK_PersonOrder
--FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);
create table GenderName
(
genderID int identity(1,1) NOT NULL unique,
gender nvarchar(10) NOT NULL PRIMARY KEY,
)
--Insert into gender Name table 
insert into GenderName values('Male');
insert into GenderName values('Female');
insert into GenderName values('Unknown');

--Show data of gender name tabel 
select * from GenderName



Create table Department
(
ID int NOT NULL identity(1,1) primary key,
DepartmentName nvarchar(50) NOT NULL DEFAULT('Other Department'),
Location nvarchar(50) NOT NULL,
DepartmentHead nvarchar(50) NOT NULL
)


--insert into Department table 
insert into Department(DepartmentName, Location, DepartmentHead) values ('IT', 'London', 'Rick');
insert into Department(DepartmentName, Location, DepartmentHead) values ('Payroll', 'Dellhi', 'Ron');
insert into Department(DepartmentName, Location, DepartmentHead) values ('HR', 'NEW YORK', 'Chistie');
insert into Department(DepartmentName, Location, DepartmentHead) values ('Other Department', 'Sydney', 'Cindrella');

--Show department table data 
select *from Department



/*
To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:

MySQL / SQL Server / Oracle / MS Access:

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);
*/
create table ITfarm
(
ID int identity(1,1) NOT NULL PRIMARY key,
Name nvarchar(50) NOT NULL,
Gender nvarchar(10) NOT NULL CONSTRAINT FK_ITfarm_Gender foreign key References GenderName(gender),
Salary int NOT NULL Default(0) check( Salary > 0),
DepartmentID int NULL Constraint FK_IFARM_DepartmentID Foreign key References Department(ID)
)
--Insert into ITfarm
insert into ITfarm(Name, Gender, Salary, DepartmentID) values('Tom', 'Male', 4000,1);
insert into ITfarm(Name, Gender, Salary, DepartmentID) values('Pam', 'Female', 3000,3);
insert into ITfarm(Name, Gender, Salary, DepartmentID) values('John', 'Male', 3500, 1);
insert into ITfarm(Name, Gender, Salary, DepartmentID) values('Sam', 'Male', 4500, 2);
insert into ITfarm(Name, Gender, Salary, DepartmentID) values('Todd', 'Male', 2800, 2);
insert into ITfarm(Name, Gender, Salary, DepartmentID) values('Ben', 'Male', 7000, 1);
insert into ITfarm(Name, Gender, Salary, DepartmentID) values('Sara', 'Female', 4800, 3);
insert into ITfarm(Name, Gender, Salary, DepartmentID) values('Valarie', 'Female', 5500, 1);
insert into ITfarm(Name, Gender, Salary, DepartmentID) values('James', 'Male', 6500, NULL);
insert into ITfarm(Name, Gender, Salary, DepartmentID) values('Russel', 'Male', 8800, NULL);

--Show ITFarm data 
select * from ITfarm
--Show department table data 
select *from Department
--Show data of gender name tabel 
select * from GenderName

/*
Inner join returns only the matching rows betweent both the table. Non Matching rows
are eliminated 

select name, Gender, salaray, departmentName 
from ITFarm 
INNER join Department
on ITfarm.DepartmentID = Department.ID

OR 
select Name, Gender, Salary, Departmentname 
From ITfarm
join Department 
On ITfarm.DepartmentID = Department.ID
*/
--inner join 
select Name, gender, salary, DepartmentName
from ITfarm
inner join Department
ON ITfarm.DepartmentID = Department.ID
--inner join output 
/*
Tom 	Male	4000	IT
Pam 	Female	3000	HR
John	Male	3500	IT
Sam 	Male	4500	Payroll
Todd	Male	2800	Payroll
Ben 	Male	7000	IT
Sara	Female	4800	HR
Valarie	Female	5500	IT
*/

/*
Left join return all the matching rows + not matching rows from the table

select Name, gender, salary, DepartmentName
from ITfarm
left outer join Department
ON ITfarm.DepartmentID = Department.ID

OR 

select Name, gender, salary, DepartmentName
from ITfarm
left join Department
ON ITfarm.DepartmentID = Department.ID

*/
--left outer join 
select Name, gender, salary, DepartmentName, DepartmentHead, Location
from ITfarm
left outer join Department
ON ITfarm.DepartmentID = Department.ID

/*
Left join output 
Tom 	Male	4000	IT  	Rick	London
Pam 	Female	3000	HR  	Chistie	NEW YORK
John	Male	3500	IT  	Rick	London
Sam 	Male	4500	Payroll	Ron 	Dellhi
Todd	Male	2800	Payroll	Ron 	Dellhi
Ben 	Male	7000	IT  	Rick	London
Sara	Female	4800	HR  	Chistie	NEW YORK
Valarie	Female	5500	IT  	Rick	London
James	Male	6500	NULL	NULL	NULL
Russel	Male	8800	NULL	NULL	NULLL

*/

/*
RIGHT join return all the matching rows + not matching rows from the table

select Name, gender, salary, DepartmentName
from ITfarm
RIGHT outer join Department
ON ITfarm.DepartmentID = Department.ID

OR 

select Name, gender, salary, DepartmentName
from ITfarm
RIGHT join Department
ON ITfarm.DepartmentID = Department.ID

*/
--right outer join 
select Name, gender, salary, DepartmentName, DepartmentHead, Location
from ITfarm
right join Department
ON ITfarm.DepartmentID = Department.ID
/*
--right join output
Tom		Male	4000	IT		Rick	London
John	Male	3500	IT		Rick	London
Ben		Male	7000	IT		Rick	London
Valarie	Female	5500	IT		Rick	London
Sam		Male	4500	Payroll	Ron		Dellhi
Todd	Male	2800	Payroll	Ron		Dellhi
Pam		Female	3000	HR		Chistie	NEW YORK
Sara	Female	4800	HR		Chistie	NEW YORK
NULL	NULL	NULL	Other Department	Cindrella	Sydney
*/



/*
FULL join return all rows from both the left and right tables, including the non matching rows 


select Name, gender, salary, DepartmentName
from ITfarm
FULL outer join Department
ON ITfarm.DepartmentID = Department.ID

OR 

select Name, gender, salary, DepartmentName
from ITfarm
FULL join Department
ON ITfarm.DepartmentID = Department.ID

*/

--FULL outer join 
select Name, gender, salary, DepartmentName, DepartmentHead, Location
from ITfarm
full join Department
ON ITfarm.DepartmentID = Department.ID

/*
Full join 
Tom 	Male	4000	IT  	Rick	London
Pam 	Female	3000	HR		Chistie	NEW YORK
John	Male	3500	IT		Rick	London
Sam 	Male	4500	Payroll	Ron		Dellhi
Todd	Male	2800	Payroll	Ron		Dellhi
Ben 	Male	7000	IT		Rick	London
Sara	Female	4800	HR		Chistie	NEW YORK
Valarie	Female	5500	IT		Rick	London
James	Male	6500	NULL	NULL	NULL
Russel	Male	8800	NULL	NULL	NULL
NULL	NULL	NULL	Other Department	Cindrella	Sydney
*/
/*
Cross join 
Produce the cartesian product of the 2 table involved in the join. For example 
in the Employee table we have 10 rows and in the Departments table we have 4 rows, so a 
cross join betweet these 2 table produce 40 rows 
NOTE: Cross join shouldn;t have ON clasuse 


General Formula for joins 
Select		Column_List 
From		Left_table_name
Join_type	Right_table_Name
On			Join_condition



select Name, gender, salary, DepartmentName, DepartmentHead, Location
from ITfarm
cross  join Department
*/
select Name, gender, salary, DepartmentName, DepartmentHead, Location
from ITfarm
cross  join Department

/*
Tom		Male	4000	IT					Rick		London
Pam		Female	3000	IT					Rick		London
John	Male	3500	IT					Rick		London
Sam		Male	4500	IT					Rick		London
Todd	Male	2800	IT					Rick		London
Ben		Male	7000	IT					Rick		London
Sara	Female	4800	IT					Rick		London
Valarie	Female	5500	IT					Rick		London
James	Male	6500	IT					Rick		London
Russel	Male	8800	IT					Rick		London
Tom		Male	4000	Payroll				Ron			Dellhi
Pam		Female	3000	Payroll				Ron			Dellhi
John	Male	3500	Payroll				Ron			Dellhi
Sam		Male	4500	Payroll				Ron			Dellhi
Todd	Male	2800	Payroll				Ron			Dellhi
Ben		Male	7000	Payroll				Ron			Dellhi
Sara	Female	4800	Payroll				Ron			Dellhi
Valarie	Female	5500	Payroll				Ron			Dellhi
James	Male	6500	Payroll				Ron			Dellhi
Russel	Male	8800	Payroll				Ron			Dellhi
Tom		Male	4000	HR					Chistie		NEW YORK
Pam		Female	3000	HR					Chistie		NEW YORK
John	Male	3500	HR					Chistie		NEW YORK
Sam		Male	4500	HR					Chistie		NEW YORK
Todd	Male	2800	HR					Chistie		NEW YORK
Ben		Male	7000	HR					Chistie		NEW YORK
Sara	Female	4800	HR					Chistie		NEW YORK
Valarie	Female	5500	HR					Chistie		NEW YORK
James	Male	6500	HR					Chistie		NEW YORK
Russel	Male	8800	HR					Chistie		NEW YORK
Tom		Male	4000	Other Department	Cindrella	Sydney
Pam		Female	3000	Other Department	Cindrella	Sydney
John	Male	3500	Other Department	Cindrella	Sydney
Sam		Male	4500	Other Department	Cindrella	Sydney
Todd	Male	2800	Other Department	Cindrella	Sydney
Ben		Male	7000	Other Department	Cindrella	Sydney
Sara	Female	4800	Other Department	Cindrella	Sydney
Valarie	Female	5500	Other Department	Cindrella	Sydney
James	Male	6500	Other Department	Cindrella	Sydney
Russel	Male	8800	Other Department	Cindrella	Sydney
*/

/*
Cross join		-> Returns crtesian Product of the tables involved in the join 
inner Join		-> Returns only the matching rows, Non matching rows are eliminated 
Left join		-> Returns all the matching rows+Non matching rows from the left table 
Right join		-> Returns all the matching rows+ non matching rows from the right table 
Full Join		-> Returns all rows from the both tables, including the non-matching rows 

*/