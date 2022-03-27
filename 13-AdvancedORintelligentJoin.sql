/*
* Advance or Intelligent joins in SQL Server 
* Retrive only the non matching rows from the left table 
* Retrive only the non matching rows from the right table 
* Retrive only the non matching rows from both the left and right table
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
Non Matching rows  left outer join
*/
select Name, gender, salary, DepartmentName, DepartmentHead, Location
from ITfarm
left outer join Department
ON ITfarm.DepartmentID = Department.ID
where ITfarm.DepartmentID is NULL


/*
James	Male	6500	NULL	NULL	NULL
Russel	Male	8800	NULL	NULL	NULL
*/

/*
Non Matching rows  right outer join
*/
select Name, gender, salary, DepartmentName, DepartmentHead, Location
from ITfarm
right outer join Department
ON ITfarm.DepartmentID = Department.ID
where ITfarm.DepartmentID is NULL

--NULL	NULL	NULL	Other Department	Cindrella	Sydney

/*
Non Matching rows  full outer join
*/
select Name, gender, salary, DepartmentName, DepartmentHead, Location
from ITfarm
full outer join Department
ON ITfarm.DepartmentID = Department.ID
where ITfarm.DepartmentID is NULL
OR Department.ID is NULL
/*
James	Male	6500	NULL	NULL	NULL
Russel	Male	8800	NULL	NULL	NULL
NULL	NULL	NULL	Other Department	Cindrella	Sydney 
*/