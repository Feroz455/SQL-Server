use new_database
go
select * from tblPerson
select * from tblGender
/*
Altering an existing column to add a default constraint:
ALTER TABLE { TABLE_NAME }
ADD CONSTRAINT { CONSTRAINT_NAME }
DEFAULT { DEFAULT_VALUE } FOR { EXISTING_COLUMN_NAME }


Adding a new column, with default value, to an existing table:
ALTER TABLE { TABLE_NAME } 
ADD { COLUMN_NAME } { DATA_TYPE } { NULL | NOT NULL } 
CONSTRAINT { CONSTRAINT_NAME } DEFAULT { DEFAULT_VALUE }


The following command will add a default constraint, DF_tblPerson_GenderId.
ALTER TABLE tblPerson
ADD CONSTRAINT DF_tblPerson_GenderId
DEFAULT 1 FOR GenderId


The insert statement below does not provide a value for GenderId column, so the default of 1 will be inserted for this record.
Insert into tblPerson(ID,Name,Email) values(5,'Sam','s@s.com')


On the other hand, the following insert statement will insert NULL, instead of using the default.
Insert into tblPerson(ID,Name,Email,GenderId) values (6,'Dan','d@d.com',NULL)


To drop a constraint
ALTER TABLE { TABLE_NAME } 
DROP CONSTRAINT { CONSTRAINT_NAME }
*/

/*
The insert statement below does not provide a value for GenderId column, so the default of 1 will be inserted for this record.
Insert into tblPerson(ID,Name,Email) values(5,'Sam','s@s.com')
*/
use new_database
Go 
insert into tblPerson(ID,Name, Email,GenderID) Values(5,'Mitu','Mitu@gmail.com',2)
select *from tblPerson

/*
Altering an existing column to add a default constraint:
ALTER TABLE { TABLE_NAME }
ADD CONSTRAINT { CONSTRAINT_NAME }
DEFAULT { DEFAULT_VALUE } FOR { EXISTING_COLUMN_NAME }
*/


Alter table tblPerson add constraint DF_tblPerson_GenderID
Default 3 FOR  GenderID

use new_database
Go 
insert into tblPerson(ID,Name, Email) Values(9,'Priya','Priya@gmail.com')





Alter table tblPerson add constraint DF_tblPerson_GenderID
Default 3 FOR  GenderID

/*
To drop a constraint
ALTER TABLE { TABLE_NAME } 
DROP CONSTRAINT { CONSTRAINT_NAME }
*/

Alter table tblPerson 
Drop constraint DF_tblPerson_Blood_Type,DF_tblPerson_GenderID

select *from tblPerson

/*
Drop table cloumn
ALTER TABLE Customers

DROP COLUMN ContactName;
*/
Alter table tblPErson
Drop column Blood_Type 
ALTER TABLE MYTABLE ADD MYNEWCOLUMN VARCHAR(200) DEFAULT 'SNUGGLES'
/*
Adding a new column, with default value, to an existing table:
ALTER TABLE { TABLE_NAME } 
ADD { COLUMN_NAME } { DATA_TYPE } { NULL | NOT NULL } 
CONSTRAINT { CONSTRAINT_NAME } DEFAULT { DEFAULT_VALUE }
*/

Alter table tblPerson add Blood_type nvarchar(200) NOT NULL constraint DF_tblPerson_Blood_Type 
default NULL