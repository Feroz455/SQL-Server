
create table tblOffice 
(
EmployeeID Int NOT NULL identity(1,1) Primary key,
Name nvarchar(50) NOT NULL,
ManagerID int NULL,
)
--insert data into tblOffice tabel 
insert into tblOffice(name, ManagerID) values ('Mike', 3),('Rob', 1), ('Todd', NULL), ('Ben',1), ('Sam', 1);

--show data
select * from tblOffice

/*
Replacing NULL Values 
Three ways to replace NULL values - ISNULL() function, CASE statement & COALESCE() function 

--ISNULL 
Select		E.Name as Employee, ISNULL(M.Name, 'No Manager') as Manager
From		tblOffice E
left join	tblOffice M
ON			E.ManagerID = M.EmployeeID


*/
--ISNULL 
Select		E.Name as Employee, ISNULL(M.Name, 'No Manager') as Manager
From		tblOffice E
left join	tblOffice M
ON			E.ManagerID = M.EmployeeID
/*
Mike	Todd
Rob		Mike
Todd	No Manager
Ben		Mike
Sam		Mike
*/

--use  COALESCE()
Select		E.Name as Employee, COALESCE(M.Name, 'No Manager') as Manager
From		tblOffice E
left join	tblOffice M
ON			E.ManagerID = M.EmployeeID
/*
Mike	Todd
Rob		Mike
Todd	No Manager
Ben		Mike
Sam		Mike
*/

--case function 
Select		E.Name as Employee, CASE WHEN M.Name is NULL THEN  'No Manager' ELSE M.Name END as Manager
From		tblOffice E
left join	tblOffice M
ON			E.ManagerID = M.EmployeeID
/*
Mike	Todd
Rob		Mike
Todd	No Manager
Ben		Mike
Sam		Mike
*/