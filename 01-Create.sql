/*
Creating and altering a database 
A SQL Server database can be created, altered and dropped 
1. Graphically using SQL SERVER MABAFENENT studio (SSMS) or 
2. Using Query

To create the database using query 
Create database "DatabaseName"

Whether you careate a database graphically using the designer or using 
a query, the following2 files fet generated 
.MDF file -> Data files (contains actual data)
.LDF file -> Transaction log file(Used to recover the database0


To Alter a database inece it's ceated 
alter database "Database Name" modiy name  = "NewDatabase Name"

Alternative you can also use system stored procedure 
Execute sp_renameDB 'OldDatabaseName','NewDatabaseName'
*/


/*
Creating and altering a database 
A SQL Server database can be created, altered and dropped 
1. Graphically using SQL SERVER MABAFENENT studio (SSMS) or 
2. Using Query


To create the database using query 
Create database "DatabaseName"
*/

Create Database My_DATABASE

/*

To Alter a database after it's ceated 
alter database "Database Name" modiy name  = "NewDatabase Name"

Alternative you can also use system stored procedure 
Execute sp_renameDB 'OldDatabaseName','NewDatabaseName'
*/

alter database My_DATABASE modify name = new_database


/*
Alternative you can also use system stored procedure 
Execute sp_renameDB 'OldDatabaseName','NewDatabaseName'
*/
Execute sp_renamedb 'My_DB','My_new_database'