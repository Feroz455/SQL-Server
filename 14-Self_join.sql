
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
Joining a table wiht itselt-self join 
*Self join can be classified as 
	* Inner self join 
	* Outer self join(Left, Right and Full)
	* Cross self Join


--Left outer self Join 
select E.Name as Employee , M.name as Maneager 
From	tblOffice E
LEFT JOIN tblOFFICE M 
ON E.ManagerID = M.EmployeeID

--Inner self join 
select E.Name as Employee , M.name as Maneager 
From	tblOffice E
inner JOIN tblOFFICE M 
ON E.ManagerID = M.EmployeeID


--CROSS self join 
select E.Name as Employee , M.name as Maneager 
From	tblOffice E
CROSS  JOIN tblOFFICE M 

*/
 --Self left join 
 Select			E.name  as Employee, M.name as Manager
 from			tblOffice E
 Left JOIN		tbloffice M
 ON				E.ManagerID = M.EmployeeId
 /*
Mike	Todd
Rob		Mike
Todd	NULL
Ben		Mike
Sam		Mike
 */

  --Self inner join 
 Select			E.name  as Employee, M.name as Manager
 from			tblOffice E
 inner JOIN		tbloffice M
 ON				E.ManagerID = M.EmployeeId
 /*
Mike	Todd
Rob		Mike
Ben		Mike
Sam		Mike
 */

   --Self cross join 
 Select			E.name  as Employee, M.name as Manager
 from			tblOffice E
 cross JOIN		tbloffice M
 /*
Mike	Mike
Rob		Mike
Todd	Mike
Ben		Mike
Sam		Mike
Mike	Rob
Rob		Rob
Todd	Rob
Ben		Rob
Sam		Rob
Mike	Todd
Rob		Todd
Todd	Todd
Ben		Todd
Sam		Todd
Mike	Ben
Rob		Ben
Todd	Ben
Ben		Ben
Sam		Ben
Mike	Sam
Rob		Sam
Todd	Sam
Ben		Sam
Sam		Sam
 */