/*
Cascading referential integrity constraint - Part 5
In Part 3 of this video series, we have seen how to create tables (tblPerson and tblGender) and enforce primary and 
foreign key constraints. In Part 4, we have learnt adding a default constraint. Please watch Parts 3 and 4, before 
continuing with this session.


In this video, we will learn about Cascading referential integrity constraint


Cascading referential integrity constraint allows to define the actions Microsoft SQL Server should take when a user 
attempts to delete or update a key to which an existing foreign keys points.


For example, consider the 2 tables shown below. If you delete row with ID = 1 from tblGender table, then row with ID = 3 
from tblPerson table becomes an orphan record. You will not be able to tell the Gender for this row. So, Cascading referential 
integrity constraint can be used to define actions Microsoft SQL Server should take when this happens. By default, we get an 
error and the DELETE or UPDATE statement is rolled back.


However, you have the following options when setting up Cascading referential integrity constraint
1. No Action: This is the default behaviour. No Action specifies that if an attempt is made to delete or 
update a row with a key referenced by foreign keys in existing rows in other tables, an error is raised and 
the DELETE or UPDATE is rolled back.


2. Cascade: Specifies that if an attempt is made to delete or update a row with a key referenced by foreign 
keys in existing rows in other tables, all rows containing those foreign keys are also deleted or updated.


3. Set NULL: Specifies that if an attempt is made to delete or update a row with a key referenced by foreign 
keys in existing rows in other tables, all rows containing those foreign keys are set to NULL.  


4. Set Default: Specifies that if an attempt is made to delete or update a row with a key referenced by foreign 
keys in existing rows in other tables, all rows containing those foreign keys are set to default values.
*/
/*
Creating default constraint
*/
Alter table tblPerson 
add constraint DF_tblPerson_GenderId Default 3 for genderID



/*
CREATE TABLE Countries
 
(CountryID INT PRIMARY KEY,
CountryName VARCHAR(50),
CountryCode VARCHAR(3))
 
 
CREATE TABLE States
 
(StateID INT PRIMARY KEY,
StateName VARCHAR(50),
StateCode VARCHAR(3),
CountryID INT)
 
 
 
ALTER TABLE [dbo].[States]  WITH CHECK ADD  CONSTRAINT [FK_States_Countries] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
ON DELETE CASCADE
GO
 
ALTER TABLE [dbo].[States] CHECK CONSTRAINT [FK_States_Countries]
GO
*/