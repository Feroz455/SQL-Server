/*
Ascii 
*/
--Use of ASCII function 
use My_new_database
GO
select * from tblEmployee
Select ASCII(Name) AS NumCodeOfFirstChar From tblEmployee;

--Use of CHAR() FUNCTION
Select CHAR(65) AS CodeToCharacter

--Use Of CHARINDEX() Function
Select CHARINDEX('t','Coustomer') AS MatchPosition
--return 5

Declare  @position int, @substr nvarchar(10) = 'to'; 
set @position = CHARINDEX(@substr,'Coustomer')
print(@substr + ' ' + cast(@position as varchar (10)))
 
set @position = CHARINDEX(@substr,'Coustomer', 4)
print(@substr + ' ' + cast(@position as varchar (10)))
--Use CONCAT
Select CONCAT('Hello ', 'there') AS WELLCOME
select concat('SQL', ' is', ' fun!') as PRINTF

--Concat with +

select 'Hello' + ' Wolrd';

select 'SQL' +' is' + ' fun!' As PRINTF

--use of CONCAT_WS()
select CONCAT_WS('.','www','Supersonic', 'com');
--//www.Supersonic.com

select CONCAT_WS('-','SQL',' IS',' FUN!') As PRINTF
--//SQL- IS- FUN!

--Use of DATALENGTH() function

Select DATALENGTH('www.facebook.com')
--//16
--Difference() Function 
select difference('Juice', 'Jucy');
--//4
select difference('Juice', 'Banana');
--//2

--Format() function 
Declare @d datetime = '12/01/2018';
select 
FORMAT(@d, 'd', 'en-US') AS 'US English Result', 
FORMAT(@d, 'd', 'no') as 'Norwegin Result',
FORMAT(@d, 'd', 'zu') as 'ZULU result';
--//12/1/2018	01.12.2018	12/1/2018
Select FORMAT(123456789, '##-##-####');
--//123-45-6789

--SQL server LEFT() function
select left('SQL Tutorial', 3) as ExtractString
--//SQL

select left('SQL Tutorial', 6) as ExtractString
--//SQL Tu

select * from tblEmployee
Select Left(Name, 5) as ExtractStrign,left(city , 3) AS CITY  From tblEmployee
/*
Tom		Lon
Pam		New
John	Lon
Sam		Lon
Todd	Syd
Ben		New
Sara	Syd
Valar	New
James	Lon
Russe	Lon
Firoz	Dha
*/

Select LEFT('SQL Tutorial', 100) as ExtractString
--//SQL Tutorial

--SQL server LEN() Function
Select LEN('www.facebook.com');
--//16
--SQL server LEN() Function
Select LEN('   www.facebook.com');
--//19

--SQL server LEN() Function
Select LEN('www.facebook.com   ');
--//16

--SQL Server LOWER() FUNCTION 
select LOWER('SQL Turorial is FUN !');
--//sql turorial is fun !

select * from tblEmployee
Select id, Lower(Name) as NAME,lower(gender) as GENDER, Salary, lower(city) as CITY from tblEmployee
/*
1	tom		male	4000	london
2	pam		female	3000	new york
3	john	male	3500	london
4	sam		male	4500	london
5	todd	male	2800	sydney
6	ben		male	7000	new york
7	sara	female	4800	sydney
8	valarie	female	5500	new york
9	james	male	6500	london
10	russel	male	8800	london
11	firoz	male	0		dhaka
*/

--Upper()
Select id, Upper(Name) as NAME,Upper(gender) as GENDER, Salary, Upper(city) as CITY from tblEmployee
/*
1	TOM		MALE	4000	LONDON
2	PAM		FEMALE	3000	NEW YORK
3	JOHN	MALE	3500	LONDON
4	SAM		MALE	4500	LONDON
5	TODD	MALE	2800	SYDNEY
6	BEN		MALE	7000	NEW YORK
7	SARA	FEMALE	4800	SYDNEY
8	VALARIE	FEMALE	5500	NEW YORK
9	JAMES	MALE	6500	LONDON
10	RUSSEL	MALE	8800	LONDON
11	FIROZ	MALE	0		DHAKA
*/

--SQL server LTRIM() function
--Remove leadin space from a string 
select '           Firoz Mahmud' as Name
--           Firoz Mahmud
Select LTRIM('     Firoz Mahmud') As LeftTrimmedString
--Firoz Mahmud


--SQL server RTRIM() function
--Remove leadin space from a string 
select '           Firoz Mahmud     ' as Name
--           Firoz Mahmud
Select RTRIM('           Firoz Mahmud     ') As LeftTrimmedString
--			 Firoz Mahmud

--NCHAR() Function
Select NCHAR(65) as NumberCodeToUnicode
--//A
Declare @start int;
set @start = 0;
while(@start < 25)
BEGIN
	print NCHAR(65+@start)
	set @start = @start + 1
END
/*
A
B
C
D
E
F
G
H
I
J
K
L
M
N
O
P
Q
R
S
T
U
V
W
X
Y
*/

--PATINDEX() function 
--Return the position of a patteran on a string
select PATINDEX('%school%' , 'W3School.com');
--//3
select PATINDEX('%s%com%' , 'W3School.com');
--//3
select PATINDEX('%[ol]%' , 'W3School.com');
--//6
select PATINDEX('%[z]%' , 'W3School.com');
--//6
--QUOTENAME() function
SELECT QUOTENAME('abcdef');
--[abcdef]

SELECT QUOTENAME('abcdef', '()');
--(abcdef)

--Replace() function 
select REPLACE('SQL Tutorial', 'T', 'M');
--//SQL MuMorial

select REPLACE('SQL Tutorial', 'SQL', 'HTML');
--//HTML Tutorial

--REPLICATE() function
select REPLICATE('SQL Tutorial', 5);
--SQL TutorialSQL TutorialSQL TutorialSQL TutorialSQL Tutorial

select REPLICATE(Name, 2) from tblEmployee
/*
TomTom
PamPam
JohnJohn
SamSam
ToddTodd
BenBen
SaraSara
ValarieValarie
JamesJames
RusselRussel
FirozFiroz
*/
--REVERSE() function
select REVERSE(Name) from tblEmployee
/*
moT
maP
nhoJ
maS
ddoT
neB
araS
eiralaV
semaJ
lessuR
zoriF
*/


--SOUNDEX() function
--Evaluate the similarity of two string, and return a four character code 
select SOUNDEX('Juice'), SOUNDEX('Jucy');
--//J200	J200
select SOUNDEX('Juice'), SOUNDEX('Banana');
--//J200	B550

--SPACE()
--Return a string with 10 space 
select space(10);
print ('Firoz' + space(10) + 'Mahmud');
--Firoz          Mahmud

--STR() function 
--return a number of string 
select str(185.476, 6, 3);
--//185.48


--STUFF() function
--delete 3 character from a string, string in position 1, and than insert 'HTML' in position 1:
select STUFF('SQL Tutorial', 1, 3, 'HTML');
--//HTML Tutorial
select STUFF('SQL Tutorial', 1, 13, 'is fun');
--is fun
select STUFF('SQL Tutorial', 13, 1, 'is fun');
//NULL

--SUBSTRING() function
SELECT SUBSTRING('SQL Tutorial', 1, 3);
--//SQL
 select SUBSTRING(Name,1,3) as NAME from tblEmployee
 /*
 Tom
Pam
Joh
Sam
Tod
Ben
Sar
Val
Jam
Rus
Fir
 */

 --TRANSLATE() function
 --Return the string from the first argument AFTER the character specified in the second are 
 --translated into the character specified in the third argument
 select TRANSLATE('Monday', 'Monday', 'Sunday');
 --//Sunday
 SELECT TRANSLATE('3*[2+1]/{8-4}', '[]{}', '()()'); -- Results in 3*(2+1)/(8-4)

 --Trim() function
 --Removing leading and trailing space a string 
 select TRIM('     SQL Tutorial!    ') as TrimmedString;
 --//SQL Tutorial!
 SELECT TRIM('#! ' FROM '    #SQL Tutorial!    ') AS TrimmedString;

  SELECT TRIM('SL ' FROM '    SQL Tutorial    ') AS TrimmedString;
  --//QL Tutoria

	--Unicode() function 
	select UNICODE('Atlanta');
	--65
	select UNICODE('Firoz');
	--70
select UNICODE(Name) as Name  , Name  From tblEmployee
/*
84	Tom
80	Pam
74	John
83	Sam
84	Todd
66	Ben
83	Sara
86	Valarie
74	James
82	Russel
70	Firoz
*/