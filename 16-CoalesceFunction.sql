/*
Coalesce() Function -> Returns the first NON NULL value 
Select ID, COALESCE(FirstName, MIddleName, LastName) As Name FROM tblEmployee
*/
Create table tblName
(
ID int NOT NULL identity(1,1) Constraint PK_tblName_ID Primary key,
FirstName nvarchar(50) NULL,
MiddleName nvarchar(50) NULL,
lastName nvarchar(50) NULL
)
Insert into tblName(FirstName) values('Sam');

Insert into tblName(MiddleName, lastName) values('Todd', 'Tanzan');

Insert into tblName(lastName) values('Sara');

Insert into tblName(FirstName,MiddleName) values('Ben', 'parker');

Insert into tblName(FirstName,MiddleName,lastName) values('james', 'Nike', 'Nency');



/*
1	Sam		NULL	NULL
2	NULL	Todd	Tanzan
3	NULL	NULL	Sara
4	Ben		parker	NULL
5	james	Nike	Nency
*/

/*
Coalesce() Function -> Returns the first NON NULL value 
Select ID, COALESCE(FirstName, MIddleName, LastName) As Name FROM tblEmployee
*/

Select * from tblName
Select ID, COALESCE(FirstName, MIddleName, LastName) As NAME
FROM tblName
