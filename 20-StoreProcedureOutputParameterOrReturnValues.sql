/*
* Understand what are store procedure return values
* Difference between stored procedure return values and output parameter
* When to use output parameters over return values
*/

/*
output parameters or return values 

*Whenever, you execute a stored procedure, it returns an integer status variable
usually zero indicates success, and non-zero indicates failure 


--Create a store procedure
Create Procedure spGetTotalCountOfEmployee
@totalCount int output 
AS 
BEGIN
	Select @totalCount = count(ID) from tblEMployee
END

--Execute a store procedure with output parameter 
Declare @TotalEmployees int 
Execute spGetTotalCountOfEmployee  @TotalEmployees output
Select @TotalEmployees

--Create procedure spGetTotalCountOfEmployee2 which return value

Create Procedure spGetTotalOfEmployee2 
AS 
BEGIN 
		return (Select count(ID) FROM tblEMployee)
END
--Execute a store procedure with return valuesS
Declare @TotalEmployees int 
Execute @TotalEmployees =  spGetTotalCountOfEmployee
Select @TotalEmployees



So, we are able to achive what er want, using output parameters as well 
as return values 
*/

--Create a store procedure
Create Procedure spGetTotalCountOfEmployee
@TotalCount int OUTPUT
AS 
BEGIN 
	SELECT @TotalCount = COUNT(ID) from tblEmployee
END

-- Execute Procedure spGetTotalCountOfEmployee
Declare @TotalNumberOFEmplyee int 
Execute spGetTotalCountOfEmployee @TotalCount = @TotalNumberOFEmplyee OUTPUT
Select @TotalNumberOFEmplyee as [Total Employee]

Select * from tblEmployee


--Create a store procedure
Create Procedure spGetTotalCountOfEmployee2
AS 
BEGIN 
	return (SELECT COUNT(ID) from tblEmployee)
END



sp_depends tblEmployee

--Execute Procedure which return value spGetTotalCountOfEmployee2 
Declare @TotalNumberOFEmplyee int 
Execute @TotalNumberOFEmplyee =  spGetTotalCountOfEmployee2 
Select @TotalNumberOFEmplyee as [Total Employee]

--Create a procedure for store name into a prarameter
Create Procedure spGetNameById1
@id int,
@name nvarchar(50) output
AS 
BEGIN 
	Select @name = name from tblemployee where id = @id
END

--execute procedure with parameter 
DECLARE @SelectedName nvarchar(50) 
execute spGetNameById1 @id = 5, @name = @selectedName OUTPUT
print @selectedName


--My procedure 
Alter Procedure spGetRecordById
@id int,
@EmployeeID int output,
@name nvarchar(50) output,
@Gender nvarchar(20) output,
@salary int output,
@city nvarchar(50) output
AS 
BEGIN 
	Select 
	@EmployeeID = id,
	@name = name,
	@Gender = Gender,
	@salary = salary,
	@city	= city
	from tblemployee where id = @id
END



--execute procedure with parameter 
DECLARE @SelectedName nvarchar(50) , @@SelectedGender nvarchar(50), @SelectedSalary int , @SelectedCity nvarchar(50), @SelectedID int ;
execute  spGetRecordById @id = 5 , @EmployeeID =  @SelectedID OUTPUT, @name = @selectedName OUTPUT,@Gender = @@SelectedGender OUTPUT,  @salary = @SelectedSalary OUTPUT, @city = @SelectedCity OUTPUT
select @SelectedID as ID,  @selectedName as Name, @@SelectedGender as Gender ,  @SelectedSalary as Salary, @SelectedCity as City

--OUTPUT
5	Todd	Male	2800	Sydney



--returning a name from procedure
Create Procedure spGetNameByIdReturn
@id int
AS 
BEGIN 
	return (Select name from tblemployee where id = @id)
END

Declare @name nvarchar(50)
Execute @name = spGetNameByIdReturn 2
Print 'Name = ' + @name
/*
Conversion failed when converting the nvarchar value 'Pam' 
to data type int.
*/

/*
Returns status Values			Output parameter 
Only integer datatype			Any Datatype 
Only one Value					More Value 
Use to convey success or failur		use to return values line name count , etc;

*/