/*
Advantage of Stored procedures

1. Execution plan relation and reusability 
2. Reduces network traffic 
3. Code reusability and batter maintainability 
4. Better Security 
5. Avoid SQL-Injecton attact
*/
use My_new_database 
GO 
select *from  tblEmployee

Create procedure sp_GetEmployeeCountBygender  
@gender nvarchar(20),  
@EmployeeCount int OUTPUT  
AS   
BEGIN   
Select @EmployeeCount = COUNT(ID)  
from tblEmployee  
where Gender = @gender  
END


DECLARE @totalEmployee int 
execute sp_GetEmployeeCountBygender @gender = 'Male', @employeeCount = @totalEmployee output
select  @totalEmployee as [Total Employee]


sp_helptext sp_GetEmployeeCountBygender 

use My_new_database 
GO 
select *from  tblEmployee

use My_new_database 
GO

Create Procedure spGetNameByID
@ID int
as
BEGIN 
	select Name From tblEmployee where id = @id
end

--Loop in sql
DECLARE @i int = 0

WHILE @i < 10
BEGIN
    SET @i = @i + 1
    Execute spGetNameByID @ID = @i
END

select Name From tblEmployee where id = 1

select Name From tblEmployee where id = 2