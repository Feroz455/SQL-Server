/*
check constraint 
If a column is marked as an identity column, then the values for this column are 
automatically generated, when you insert a new raw into the table

Create a table tblPerson 
{
	PersonId int Identity(1,1) Primary key,
	Name nvarchar(50) Null
}
Note Seed and increment values are optional, if you don't specify the identity and seed they both default to 1


To Explicitly supply a value for identity column 
1. First turn on Identity insert-SET Identity_insert tblPerson ON 
2. In the insert query specify the column list 
isert into tblPerson(PersonID, Name) Values(2,'Jhon')

If you have deleted all the rows in a table and you want to reset the identity column 
values use DBCC CHECKDENT command 
DBCC CHECKIDENT('tblPerson', RESEED, 0)
*/

use new_database
GO 
select * from tblPerson

alter table tblPerson
Drop column Age
alter table tblPerson 
drop constraint CK_tblPerson_age

insert into tblPerson(ID,Name, email) values(11, 'Tokir','Tokir@gmail.com')



Create table Web
{
ID int NOT NULL Identity[(1,1)] Primary key,
Name nvarchar[(50)] NOT NULL;
Mail nvarchar[(50)] NOT NULL;
Phone nvarchar[(50)] NULL;
Address nvarchar[(50)] NULL;
GenderID int null
}


--new table into My_new_database
use My_new_database
GO
Create table gender
(
ID int not NULL PRIMARY KEY,
Gender nvarchar(20) NOT NULL
)
Select * from gender
Insert into gender(ID,Gender) values(1,'Male');
Insert into gender(ID,Gender) Values(2,'Female');
Insert into gender(ID,Gender) Values(3,'Others');

use My_new_database
GO
--Creating tblPerson table 

Create table tblPerson
(
ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
NAME nvarchar(50) NOT NULL,
Mail nvarchar(50) NOT NULL,
Phone nvarchar(50) NOT NULL,
age int NOT NULL,
[Address] nvarchar(100) NOT NULL,
--Foreign key constaint at Declaration 
GenderID int NULL FOREIGN KEY REFERENCES Gender(ID),
--Check constraint for age 
CONSTRAINT CHK_Person CHECK (age > 0 AND age < 150),
)

--Printing data into screen
Select *from tblPerson
--Inserting data into tblPerson table

Insert into tblPerson(name, Mail, Phone, age, address, GenderID) values('Firoz', 'Firoz@gmail.com', '012345678', 23,'Dhaka', 1);

Insert into tblPerson(name, Mail, Phone, age, address, GenderID) values('Maliha', 'Maliha@gmail.com', '012345678', 23,'Dhaka', 2);

Insert into tblPerson(name, Mail, Phone, age, address, GenderID) values('mollika', 'Mollika@gmail.com', '012345678', 23,'Dhaka', 2);

Insert into tblPerson(name, Mail, Phone, age, address, GenderID) values('Nahid', 'Nahid@gmail.com', '012345678', 23,'Dhaka', 1);

Insert into tblPerson(name, Mail, Phone, age, address, GenderID) values('Asabuddin', 'Asabuddin@gmail.com', '012345678', 23,'Dhaka', 1);