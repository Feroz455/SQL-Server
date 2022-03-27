/*
All About select

In this session we will learn 

*Select specific or all column 
* Distinct rows 
* Filtering with where clause 
* Joining multiple consitions using AND and OR operation 
* Sorting rows using order by 
* Selecting top n or top n percentage of raws
*/
--for all column 
Select * from  tblPerson

USE [My_new_database]
GO
SELECT [ID]
      ,[NAME]
      ,[Mail]
      ,[Phone]
      ,[age]
      ,[Address]
      ,[GenderID]
  FROM [dbo].[tblPerson]
GO

--Distint address 
use My_new_database 
GO 
Select DISTINCT address from tblPerson


use My_new_database 
GO 
Select DISTINCT Name, address from tblPerson


--Use where 
select *from tblPerson where address = 'Dhaka'

--Not operation 
select *from tblPerson where address != 'Dhaka'

/*
Operators and wild cards 
=			equel to 
!= or <>	Not equal to 
>			Greater than
>=			Greater than or equal to 
<			less than 
<=			less than or equal to 
IN			Specify a list of values
between		Specify a renge 
Like		Specify a pattern
Not			Not in a list, rang etc 

%			Specifies zero or more character 
-			Specifies exactly one character 
[]			any character with in the brackets 
[^]			Not any character with in the brackets
*/

Select * from tblPerson where age > 20

--Use of 'IN'
use My_new_database
go 
select [ID],
		[Name],
		[Mail],
		[Phone],
		[Age],
		[Address],
		[GenderID]
	From [dbo].[tblPerson] where age IN (20, 24, 27)
GO

--Between operator
use My_new_database
go 
select [ID],
		[Name],
		[Mail],
		[Phone],
		[Age],
		[Address],
		[GenderID]
	From [dbo].[tblPerson] where age Between 20 AND 25
GO


--Like operator 
use My_new_database
go 
select [ID],
		[Name],
		[Mail],
		[Phone],
		[Age],
		[Address],
		[GenderID]
	From [dbo].[tblPerson] where address like 'D%'
GO

--Find email 
use My_new_database
go 
select [ID],
		[Name],
		[Mail],
		[Phone],
		[Age],
		[Address],
		[GenderID]
	From [dbo].[tblPerson] where Mail like '%@%'
GO

--insert into table table tblPerson
insert into tblPerson(Name, Mail, Phone, Age, Address, GenderID)
Values('Topon', 'Topon', '963258741', 35, 'Narayanganj', 2)


--Find  NOT email
--Here % is wild card character
use My_new_database
go 
select [ID],
		[Name],
		[Mail],
		[Phone],
		[Age],
		[Address],
		[GenderID]
	From [dbo].[tblPerson] where Mail NOT like '%@%'
GO

-- _Use of '_'
use My_new_database
go 
select [ID],
		[Name],
		[Mail],
		[Phone],
		[Age],
		[Address],
		[GenderID]
	From [dbo].[tblPerson] where Mail like '_____@%'
GO

--[] a list of character 
use My_new_database
go 
select [ID],
		[Name],
		[Mail],
		[Phone],
		[Age],
		[Address],
		[GenderID]
	From [dbo].[tblPerson] where Name like '[FMH]%'
GO
--[^] a list of character 
use My_new_database
go 
select [ID],
		[Name],
		[Mail],
		[Phone],
		[Age],
		[Address],
		[GenderID]
	From [dbo].[tblPerson] where Name like '[^FMH]%'
GO



--use multiple condition
use My_new_database
go 
select [ID],
		[Name],
		[Mail],
		[Phone],
		[Age],
		[Address],
		[GenderID]
	From [dbo].[tblPerson] where Address=  'DHAKA' AND Age > 20
GO
--Sorted  by name
use My_new_database
go 
select [ID],
		[Name],
		[Mail],
		[Phone],
		[Age],
		[Address],
		[GenderID]
	From [dbo].[tblPerson] Order by Name DESC
GO

-- Order by name in decending order then oder by age ASC
use My_new_database
go 
select [ID],
		[Name],
		[Mail],
		[Phone],
		[Age],
		[Address],
		[GenderID]
	From [dbo].[tblPerson] Order by Name DESC, Age ASC
GO

--use top key 
use My_new_database
go  
select top 3
		[ID],
		[Name],
		[Mail],
		[Phone],
		[Age],
		[Address],
		[GenderID]
	From [dbo].[tblPerson] Order by Name DESC, Age ASC
GO
--use top Percent  key 
use My_new_database
go  
select top 50 PERCENT
		[ID],
		[Name],
		[Mail],
		[Phone],
		[Age],
		[Address],
		[GenderID]
	From [dbo].[tblPerson] Order by Name DESC, Age ASC
GO