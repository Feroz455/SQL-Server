--cast() function 
--The CAST() function converts a value (of any type) into a specified datatype
--Syntax 
--CAST(expression as datatype(length))
Select CAST(25.65 as int) as rounded
--//25
/*
Value		Description
expression	Required. The value to convert
datatype	Required. 
			The datatype to convert expression to. Can be one of the following: 
			bigint, int, smallint, tinyint, bit, decimal, numeric, money, smallmoney, 
			float, real, datetime, smalldatetime, char, varchar, text, nchar, nvarchar, 
			ntext, binary, varbinary, or image
(length)	Optional. The length of the resulting data type (for char, varchar, nchar, nvarchar, binary and varbinary)
*/

Select CAST('2017-08-25' as DATETIME) 
--//2017-08-25 00:00:00.000


--COALESCE() function 
--The COALESCE() function returns the first non_NULL value in a list
--SYSTAX
--COLAESCE(val1, val2, val3.......val_n);

select COALESCE(NULL, NULL, NULL, 'WWW.faceboo.com', NULL, 'Example.com')
--//WWW.faceboo.com
select COALESCE(NULL, 1,2, 'WWW.faceboo.com', NULL, 'Example.com')
--//1
/*
Convert() function
Defination and Usage 
The CONVERST() function converts a value (of any type) into a specified datatype 
SYNTAX 
cnvert(data_type(length), expression, style)

Value			Description
data_type		Required. The datatype to convert expression to. Can be one of the following: bigint, int, smallint, tinyint, bit, decimal, numeric, money, smallmoney, float, real, datetime, smalldatetime, char, varchar, text, nchar, nvarchar, ntext, binary, varbinary, or image
(length)		Optional. The length of the resulting data type (for char, varchar, nchar, nvarchar, binary and varbinary)
expression		Required. The value to convert to another data type
style			Optional. The format used to convert between data types, such as a date or string format. Can be one of the following values:

				Converting datetime to character:
				Without century	With century	Input/Output	Standard
				0	100	mon dd yyyy hh:miAM/PM	Default
				1	101	mm/dd/yyyy	US
				2	102	 yyyy.mm.dd	ANSI
				3	103	 dd/mm/yyyy	British/French
				4	104	dd.mm.yyyy	German
				5	105	 dd-mm-yyyy	Italian
				6	106	dd mon yyyy	-
				7	107	Mon dd, yyyy	-
				8	108	hh:mm:ss	-
				9	109	mon dd yyyy hh:mi:ss:mmmAM (or PM)	Default + millisec
				10	110	mm-dd-yyyy	USA
				11	111	 yyyy/mm/dd	Japan
				12	112	 yyyymmdd	ISO
				13	113	dd mon yyyy hh:mi:ss:mmm	Europe (24 hour clock)>
				14	114	hh:mi:ss:mmm	24 hour clock
				20	120	yyyy-mm-dd hh:mi:ss	ODBC canonical (24 hour clock)
				21	121	yyyy-mm-dd hh:mi:ss.mmm	ODBC canonical (24 hour clock)
 					126	yyyy-mm-ddThh:mi:ss.mmm	ISO8601
 					127	yyyy-mm-ddThh:mi:ss.mmmZ	ISO8601 (with time zone Z)
 					130	dd mon yyyy hh:mi:ss:mmmAM	Hijiri
 					131	dd/mm/yy hh:mi:ss:mmmAM	Hijiri
				Converting float to real:
				Value	Explanation
				0		Maximum 6 digits (default)
				1		8 digits
				2		16 digits
				Converting money to character:
				Value	Explanation
				0		No comma delimiters,	2 digits to the right of decimal
				1		Comma delimiters,		2 digits to the right of decimal
				2		No comma delimiters,	4 digits to the right of decimal

*/
select CONVERT(int, 25.65)
--//25

Select CONVERT(datetime , '2017-08-25')
--//2017-08-25 00:00:00.000

select CONVERT(varchar, getDATE(), 100);
--//Mar 30 2022 10:58AM
DECLARE @start int = 100;
while(@start <= 131)
begin
if(@start <= 114 and @start > 120)
print ('blank');
else
print (CONVERT(varchar, getDATE(), @start) + '	   '  + convert (varchar(5), @start));
set @start = @start + 1;
end

--//03/30/2022


/*
CurrentUser() function
Definition and Usage
The current_User function returns the name of the current user in the SQL server database.
CURRENT_user
*/
select CURRENT_USER;
--//dbo

/*
IIF() function 

Definition and Usage 
The IIF() function returns a value if a condition is true or another value if
a cndition is FALSE

syntax 
IIF(condition, value_if_true, value_if_false)

*/
select IIF(500 < 1000, 'YES', 'NO');
--//YES
select IIF(500 > 1000, 'YES', 'NO');
--//NO

use My_new_database
GO
select * from Orders
Select * from OrderDetails

select OrderID, quantity, IIF(QUANTITY > 10, 'MORE', 'LESS') AS QUANTITY
from OrderDetails
/*
10248	12	MORE
10248	10	LESS
10248	5	LESS
10249	9	LESS
10249	40	MORE
10250	10	LESS
*/


/*
ISNULL() function 
Defination and USAGE
The ISNULL() function returns s sqpcified value if the expression is NULL 
If the expression is NOT NULL, this funcion returns the expression
*/
select ISNULL(NULL, 'www.facebook.com');
--//www.facebook.com
select ISNULL('Hello', 'www.facebook.com');
--//Hello

select ISNULL(NULL, NULL);
--NULL

/*
ISNUMERIC() Function 
Defination and Usage
The ISNUMERIC() Function test whether an expression is numeric 
This function returns 1 if the expression is numeric, otherwise it returns 0

Syntax 
ISSNUMERIC(expression)
*/
select ISNUMERIC('4567');
--//1

select ISNUMERIC('Hello');
--//0
select ISNUMERIC(GETDATE());
--//0

/*
NULLIF() function 
Defination and Usage 
The NULLIF() function returns NULL if two expressions are equal, otherwise it
returns the first expression.
*/
SELECT NULLIF(25,25);
--//NULL

SELECT NULLIF('Hello' ,'World');
--//Hello

SELECT NULLIF(Getdate() ,SYSDATETIME());
--//2022-03-30 11:26:18.940

/*
SESSION_USER function
Definition and Usage
The SESSION_USER function returns the name of the current user in the sql SERVER database
*/
select SESSION_USER;
--//dbo
/*
SESSIONPROPERTY() function
Definitaion and Usage
The SESSIONPROPERTY() function returns the session settings for a specified option
SESSIONPROPERTY(option)
*/
select SESSIONPROPERTY('ANSI_NULLS') as ANSI_NULLS,
 SESSIONPROPERTY('ANSI_PADDING') as ANSI_PADDING,
 SESSIONPROPERTY('ANSI_WARNINGS') as ANSI_WARNINGS,
 SESSIONPROPERTY('ARITHABORT') as ARITHABORT,
 SESSIONPROPERTY('CONCAT_NULL_YIELDS_NULL')as CONCAT_NULL_YIELDS_NULL,
 SESSIONPROPERTY('NUMERIC_ROUNDABOUT') as NUMERIC_ROUNDABOUT,
 SESSIONPROPERTY('QUOTED_IDENTIFIER') as QUOTED_IDENTIFIER;
 --//1	1	1	1	1	NULL	1

 /*
 SYSTEM_USER function
 Definition and Usage 
 The SYSTEM_USER function the login name for the current user
 */
 select  SYSTEM_USER;
 --//DESKTOP-U5KNCIS\Firoz Mahmud

 /*
 USER_NAME() function 
 Defination and usage 
 The USER_NAME() Functin returns the database user name based on the specified 
 id If no id is specified, this function will return the name of the current user
 */
 select USER_NAME();
 --//dbo