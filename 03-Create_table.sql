/*
Create table
The aim of this session is to create tblperson and tblGender table and establish primary key and foring key constraints 


In SQL server table can be create graphically usingSQL server Management studio(SSMS) or 
using a query. Foreign key references can be added graphically using SSMS or using a query 

Alter table ForeignKeyTable add constraint ForeignKeyTable_ForiegnKeyColumn_FK 
FOREIGN KEY (FreignKeyColumn) reference PrimaryKeytable(PrimaryKeyColumn)

Foriign key are used to enforce database integrity. In layman's terms. A foreigm key in one table points to a primary key in another table 
The foreign key constraint prevents invellid data from beign inserted into the foreign key column. the values that enter into the foreign 
key column, has to be one of the values contained in the table it points to.
*/
/*
Create table 
create table "Table name"
(
	//table attribute 
	"column name" "data type" "NULL or NOT NULL" "KEY specification"
)
*/
use new_database
GO
Create table tblGender
(
ID int NOT NULL primary key,
Gender nvarchar(20) NOT NULL
)

use new_database 
go 
drop table tblGender


use new_database 
go 
Create table tblPerson
(
	ID int NOT NULL primary key,
	Name nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL,
	GenderID int,
)

/*
In SQL server table can be create graphically usingSQL server Management studio(SSMS) or 
using a query. Foreign key references can be added graphically using SSMS or using a query 

Alter table ForeignKeyTable add constraint ForeignKeyTable_ForiegnKeyColumn_FK 
FOREIGN KEY (FreignKeyColumn) references PrimaryKeytable(PrimaryKeyColumn)
*/

use new_database
GO
alter table tblPerson add constraint tblPerson_foreignKey_FK 
foreign key (GenderID) references tblGender (ID)