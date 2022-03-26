/*
Retriving Identity column values 
We use UNIQUE constraint to enforce uniquess of a column i.e the column should't allow any duplicate values. We can add a Unique 
constraint true the designer or using a query 

TO Create the unique key using a query 

Alter table table_Name
Add Constraint Constraint_name Unique(column_name)


Both Primary key and Unique key are used to enforce, the uniqueness of a column. so When do you choose one over the other 

A table can have, only one primary key, if you want to enfore uniqueness on 2 or more columns, then we user unique key constraint 

What is the differene betweent Primary key constraint and unique key constraint?
1. A table can have only one Primary key, but more than one unique key 
2. Primary key does not allow nulls, where as unique key allows one null
*/





use new_database
go 
Select *from tblPerson


Alter table tblPerson 
Add constraint UK_tblPerson_Email Unique(Mail)

use  My_new_database
go
Select *from tblPerson

insert into tblPerson(NAME, Mail, Phone, Age, Address, GenderID) values('Motaleb', 'Motaleb@gmail.com', '01478520',54 , 'Munschigang', 2);

