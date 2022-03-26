/*
Retriving identity column values 
From the previous session, we understood that identity column values are auto 
generated. There are several ways in sql server, to retrive the last identity values that is generated. The most common ways 
to use SCOPE_identity() buils in function 

Note :You can also ues @@DENTITY and IDENT_CURRENT('TABLE NAME')

Diffence 
SCOPE_IDENTITY- Same session and the same  scope 
@@Identity- Same Session and across any scope 
Identity_Current('TableName') - Specific table across any session and any scope
*/

Create table test1
(
ID int identity(1,1) PRIMARY KEY,
value nvarchar(20)
)
Create table test2
(
ID int IDENTITY(1,1) PRIMARY key,
value nvarchar(20)
)

Select *from test1
Select *from test2

--Create tigger to insert data into table test2
create trigger trForInsert on test1 for insert
as
begin
	Insert into test2 values('yy')
end

insert into test1 values('Jony')
--last identity value
--By function 
Select SCOPE_IDENTITY()
--By global variable 
Select @@IDENTITY

--Ident_current('table name') function
select IDENT_CURRENT('test1')


