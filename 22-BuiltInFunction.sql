/*
String Functions

Built in string functions in sql server 2008 - Part 22
Functions in SQL server can be broadly divided into 2 categoris
1. Built-in functions
2. User Defined functions

There are several built-in functions. In this video session, we will look at the most common string functions available.

ASCII(Character_Expression) - Returns the ASCII code of the given character expression.
To find the ACII Code of capital letter 'A'

Example: Select ASCII('A')
Output: 65

CHAR(Integer_Expression) - Converts an int ASCII code to a character. The Integer_Expression, should be between 0 and 255.
The following SQL, prints all the characters for the ASCII values from o thru 255

Declare @Number int
Set @Number = 1
While(@Number <= 255)
Begin
 Print CHAR(@Number)
 Set @Number = @Number + 1
End

Note: The while loop will become an infinite loop, if you forget to include the following line.
Set @Number = @Number + 1

Printing uppercase alphabets using CHAR() function:
Declare @Number int
Set @Number = 65
While(@Number <= 90)
Begin
 Print CHAR(@Number)
 Set @Number = @Number + 1
End

Printing lowercase alphabets using CHAR() function:
Declare @Number int
Set @Number = 97
While(@Number <= 122)
Begin
 Print CHAR(@Number)
 Set @Number = @Number + 1
End


Another way of printing lower case alphabets using CHAR() and LOWER() functions.
Declare @Number int
Set @Number = 65
While(@Number <= 90)
Begin
 Print LOWER(CHAR(@Number))
 Set @Number = @Number + 1
End

LTRIM(Character_Expression) - Removes blanks on the left handside of the given character expression.

Example: Removing the 3 white spaces on the left hand side of the '   Hello' string using LTRIM() function.
Select LTRIM('   Hello')
Output: Hello

RTRIM(Character_Expression) - Removes blanks on the right hand side of the given character expression.

Example: Removing the 3 white spaces on the left hand side of the 'Hello   ' string using RTRIM() function.
Select RTRIM('Hello   ')
Output: Hello

Example: To remove white spaces on either sides of the given character expression, use LTRIM() and RTRIM() as shown below.
Select LTRIM(RTRIM('   Hello   '))
Output: Hello

LOWER(Character_Expression) - Converts all the characters in the given Character_Expression, to lowercase letters.

Example: Select LOWER('CONVERT This String Into Lower Case')
Output: convert this string into lower case

UPPER(Character_Expression) - Converts all the characters in the given Character_Expression, to uppercase letters.
Example: Select UPPER('CONVERT This String Into upper Case')
Output: CONVERT THIS STRING INTO UPPER CASE

REVERSE('Any_String_Expression') - Reverses all the characters in the given string expression.
Example: Select REVERSE('ABCDEFGHIJKLMNOPQRSTUVWXYZ')
Output: ZYXWVUTSRQPONMLKJIHGFEDCBA

LEN(String_Expression) - Returns the count of total characters, in the given string expression, excluding the blanks at the end of the expression.

Example: Select LEN('SQL Functions   ')
Output: 13*/

--
Declare @Number int
Set @Number = ASCII('A')
While(@Number <= ASCII('A')+25)
Begin
 print CHAR(@Number) 
 Set @Number = @Number + 1
End
/*
Note: The while loop will become an infinite loop, if you forget to include the following line.
Set @Number = @Number + 1
*/
--Print Ascii value
Select ASCII('A') AS CHARACTER
--using loops
Declare @i int 
set @i = 0
while @i < 26
begin 
	print char(@i+65)
	set @i = @i+1
end
/*
Print All character
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
Z
*/

--Use of 'Ltrim'

--use print
Print('My name is Firoz');

--Print statement to print a variable value
Declare @Msg varchar(300) = 'My name is Firoz';
PRINT @msg;

--SQL server PRINT statement to print an integer value 

Declare @a int = 1000;
PRINT @a

-- Assigning a value to a variable with a Scalar Subquery using SET
use My_new_database
Go 
select * from tblEmployee;

Declare @start int ,@city_name varchar(10)
set @start = 1
while @start <= 10
begin
set @city_name = (Select city from tblEmployee where ID = @start)
Print @city_name;
set @start = @start + 1
end


--interger variable and a string in the PRINT statement 
Declare @a INT = 1000
Print ('Your queue no is ' + @a )
--Conversion failed when converting the varchar value 'Your queue no is ' to data type int.

--interger variable and a string in the PRINT statement 
--With cast function
Declare @a INT = 1000
Print ('Your queue no is ' + cast(@a AS VARCHAR(10)))

--use of sql CONCATANATION 
Declare @a INT = 1000
Print CONCAT('Your queue no is ', @a )
--Your queue no is 1000

Declare @a XML = '<CustomerID="1" CustomerName="Rajendra"/>'
print @a
--Implicit conversion from data type xml to nvarchar is not allowed. Use the CONVERT function to run this query.

--Cast or convert 
Declare @a XML = '<CustomerID="1"CustomerName="Rajendra"/>'
print cast(@a as varchar(100))


Print 'My name is Firoz Mahmud';
WAITFOR DELAY '00:00:3';
Print 'You are reading articale on SQL PRINT statement';
WAITFOR DELAY '00:00:3';


Declare @a INT
SET @a = 1;
while(@a < 15)
begin 
	PRINT CONCAT('This is Iteration no ' , @a)
	waitFor DELAY'00:00:01'
	SET @a = @a + 1
END

--Use Of RAISERROR
raiserror('My name is Firoz Mahmud', 1, 1) with nowait;
waitfor delay '00:00:03';
raiserror('You are reding artical on sql print statement', 16, 1) with nowait;
waitfor delay '00:00:03';

DECLARE @a INT;
SET @a = 1;
WHILE(@a < 15)
    BEGIN
        RAISERROR('This is Iteration no:', @A, 0, 1) WITH NOWAIT;
        SET @a = @a + 1;
    END;


DECLARE @a INT
SET @a = 1;
DECLARE @S VARCHAR(100)= 'This is iteration no';
WHILE(@a < 5)
 BEGIN
        RAISERROR('%s:%d', 0, 1, @s, @a) WITH NOWAIT;
        SET @a = @a + 1;
 END;



 /****************************/
 select LTRIM('				Hello');
 select ('				Hello ');
 select Rtrim('hello     ');