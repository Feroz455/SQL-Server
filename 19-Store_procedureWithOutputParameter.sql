/*
* Create and Execute store procedure with output Parameters
* Learn about some of the usefull system stored Procedures 
*/

/*
Store procedure - OUTPUT parameter 
To Create an SP with ouput parameter, we yse the keyword OUT or OUTPUT 

Create procedure sp_GetEmployeeCountBygender
@gender nvarchar(20),
@EmployeeCount int OUTPUT
AS 
BEGIN 
Select @EmployeeCount = COUNT(ID)
from tblEmployee
where Gender = @gender
END


--Execute Procedure with return type 
Declare @EmployeeTotal int 
Execute sp_GetEmployeeCountBygender 'Male' @EmployeeTotal OUTPUT
PRINT @EmployeeTotal


--Execute Procedure with return type 
Declare @EmployeeTotal int 
Execute sp_GetEmployeeCountBygender @gender =  'Male', @EmployeeCount =  @EmployeeTotal OUTPUT
PRINT @EmployeeTotal

*/
--Create store procedure which return employee number by gender
Create procedure sp_GetEmployeeCountBygender
@gender nvarchar(20),
@EmployeeCount int OUTPUT
AS 
BEGIN 
Select @EmployeeCount = COUNT(ID)
from tblEmployee
where Gender = @gender
END


--Execute Procedure with return type 
Declare @EmployeeTotal int 
Execute sp_GetEmployeeCountBygender 'Male', @EmployeeTotal OUTPUT
PRINT @EmployeeTotal


--Execute Procedure with return type 
Declare @EmployeeTotalFemale int
Execute sp_GetEmployeeCountBygender @gender =  'Female', @EmployeeCount =  @EmployeeTotalFemale OUTPUT
PRINT @EmployeeTotalFemale

--With output key 
Declare @MaleEmployee int 
execute sp_GetEmployeeCountBygender @gender = 'Male', @EmployeeCount = @MaleEmployee OUTPUT 
if(@MaleEmployee is NULL)
Print 'Male employee is NULL'
else 
Print 'Male emloyee is not NULL'


--Without output key 
Declare @MaleEmployee int 
execute sp_GetEmployeeCountBygender @gender = 'Male', @EmployeeCount = @MaleEmployee
if(@MaleEmployee is NULL)
Print 'Male employee is NULL'
else 
Print 'Male emloyee is not NULL'

/*
System Procedure	Description
sp_rename			It is used to rename a database object like stored procedure, 
					views, table etc.

sp_changeowner		It is used to change the owner of a database object.

sp_help				It provides details on any database object.

sp_helpdb			It provides the details of the databases defined in the SQL Server.

sp_helptext			It provides the text of a stored procedure reside in SQL Server

sp_depends			It provides the details of all database objects that depend 
					on the specific database object.
*/

--
sp_help  tblemployee 

sp_help sp_GetEmployeeCountBygender

sp_helptext sp_GetEmployeeCountBygender

sp_depends tblemployee

sp_depends sp_GetEmployeeCountBygender
