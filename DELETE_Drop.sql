/*
DELETE Or Dropping a database 

To delete or drop a database 
Drop database Database_That_you_want_to_Drop

Dropping a database, delete the LDF and MDF files 
you cannot drop a database, if it is currently in use. You get an error stating _
Cannot drop database 
"NewDatabaseName" Because it is currently in use 

so if other users are connected, you need to put the dataabase in single user mode
and then drop the database 

Alter Database dataBaseName Set SINGLE_USER wiht Rollback immediate 

With Roolback immediate option, will rollback all incomplete transactions and closes
the connection to the database 

Note System database cannot be dropped
*/
/*
DELETE Or Dropping a database 

To delete or drop a database 
Drop database Database_That_you_want_to_Drop
*/
create database new_database 

drop database new_database


