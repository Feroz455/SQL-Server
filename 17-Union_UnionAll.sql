/*
* Purpose of UNION and UNION ALL 
* Difference betweent UNION and UNION ALL 
* Difference between JOIN and UNION 


Union AND union all 
union and union all operators in sql server, are used to combine the result set of 
two  or more  select quries 
--Use of union all 
Select * from tblbangladeshiCoustomers
union all 
Select * from  tblUKCoustomers
/*
1	Raj	R@R.com
2	Sam	S@s.com
1	Ben	B@B.com
2	Sam	S@s.com
*/


--Use of union
Select * from tblbangladeshiCoustomers
union 
Select * from  tblUKCoustomers
/*
1	Ben	B@B.com
1	Raj	R@R.com
2	Sam	S@s.com
*/

NOTE: For UNION and UNION ALL to work, the NUMBER, data type and order of the column 
in the select statements should be same
*/
Create table tblbangladeshiCoustomers
(
ID int NOT NULL identity(1,1) constraint PK_tblbangladeshiCoustomers_ID primary key,
Name nvarchar(50) NOT NULL,
Email nvarchar(80) NOT NULL
)
insert into tblbangladeshiCoustomers(Name, Email) values('Raj' ,'R@R.com'), ('Sam' , 'S@s.com')
Create table tblUKCoustomers
(
ID int NOT NULL identity(1,1) constraint PK_tblUKCoustomers_ID primary key,
Name nvarchar(50) NOT NULL,
Email nvarchar(80) NOT NULL
)

insert into tblUKCoustomers(Name, Email) values('Ben' ,'B@B.com'), ('Sam' , 'S@s.com')


Create table tblIndianCoustomers
(
ID int NOT NULL identity(1,1) constraint PK_tblIndianCoustomers_ID primary key,
Name nvarchar(50) NOT NULL,
Email nvarchar(80) NOT NULL
)

insert into tblIndianCoustomers(Name, Email) values('SHIVA' ,'S@S.com'), ('Anjili' , 'A@A.com')

--Show data 
select *from tblIndianCoustomers



union all 
Select * from  tblUKCoustomers
order by Name
/*
1	Raj	R@R.com
2	Sam	S@s.com
1	Ben	B@B.com
2	Sam	S@s.com
*/
--Use of union
Select * from tblbangladeshiCoustomers
union 
Select * from  tblUKCoustomers
/*
1	Ben	B@B.com
1	Raj	R@R.com
2	Sam	S@s.com
*/



--Use of union
Select * from tblbangladeshiCoustomers
union  ALL
Select * from  tblUKCoustomers
UNION ALL
select *from tblIndianCoustomers
order by ID
/*
2	Anjili	A@A.com
1	Ben		B@B.com
1	Raj		R@R.com
2	Sam		S@s.com
1	SHIVA	S@S.com

*/

/*
UNION & UNION ALL & joins 

##Diference betweent UNION and UNION ALL 
1. UNION removers duplicate rows, where as UNION ALL does not 
2. UNION has to perform distince sort to remove ducplicates, which makes it lss faster 
then UNION ALL

NOTE: Estimate query execution plan CTRL+L
*/
/*
Sorting result of a union or union all 
ORDER BY clause should be used only on the last SELECT statement in the union Query 

*/

/*
Difference between UNION & JOINS 
UNION : UNION combines the result-set of two or more select quereies into a single
result-set which 
includes all the rows from all the queries in the from, all the quereies in the 
union , where as joins, retrieve data from two or more tables based on logical
rerlationship between the table 


in short UNION combine rows from 2 or more table, wheres JOINS combine columns from 
2 or more table 
*/
