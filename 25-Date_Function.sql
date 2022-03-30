--CURRENT_TIMESTAMP function 

select CURRENT_TIMESTAMP;
--//2022-03-29 17:47:52.007

--DATEADD() function 
--The DateADD() unction adds a time\date interval to a date and then returns the date 
--Systax DATEADD(interval, number, date);
select DATEADD(year, 1, '2017/8/25') as [DateAdd]
--ADD Month
select DATEADD(MONTH, 5, '2017/8/25') as [DateAdd]
--//2018-01-25 00:00:00.000
--add day
select DATEADD(day, 10, '2017/8/25') as [DateAdd]
--//2017-09-04 00:00:00.000
--Add week
select DATEADD(week, 10, '2017/8/25') as [DateAdd]
--//2017-11-03 00:00:00.000

/*
Parameter	Description
interval	Required. The time/date interval to add. Can be one of the following values:
						year, yyyy, yy = Year
						quarter, qq, q = Quarter
						month, mm, m = month
						dayofyear, dy, y = Day of the year
						day, dd, d = Day
						week, ww, wk = Week
						weekday, dw, w = Weekday
						hour, hh = hour
						minute, mi, n = Minute
						second, ss, s = Second
						millisecond, ms = Millisecond
number		Required. The number of interval to add to date. Can be positive (to get dates in the future) or negative (to get dates in the past)
date		Required. The date that will be modified
*/
--Add 18 years to the date in the BirthDate column, then return the date:
--https://www.w3schools.com/sql/trysqlserver.asp?filename=trysql_func_sqlserver_dateadd4
SELECT LastName, BirthDate, DATEADD(year, 18, BirthDate) AS DateAdd FROM Employees;

--DATEDIFF() Function
--The DATEDIFF() function returns the difference between two dates
--systax DATEDIFF(interval, date1, date2);
/*
Parameter	Description
interval	Required. The part to return. Can be one of the following values:
			year, yyyy, yy = Year
			quarter, qq, q = Quarter
			month, mm, m = month
			dayofyear = Day of the year
			day, dy, y = Day
			week, ww, wk = Week
			weekday, dw, w = Weekday
			hour, hh = hour
			minute, mi, n = Minute
			second, ss, s = Second
			millisecond, ms = Millisecond
date1, date2	Required. The two dates to calculate the difference between
*/
SELECT DATEDIFF(month, '2017/08/25', '2011/08/25') AS DateDiff;
--//-72

SELECT ABS(DATEDIFF(HOUR, '2017/08/25', '2011/08/25')) AS DateDiff;
--//52608

--dateFromparts() function 
--The DateFromParts() function returns a date from the speified parts(year, month, and day values)
--DATEFROMPARTS(year, month, day) 
Select DATEFROMPARTS(2018, 10, 31) as [DateFromParts]
--2018-10-31

--DateName() function 
--The DATENAME() Function returns a spqcified part of a date
--This function returns the result as a string value
select dateName(YEAR, '2017/08/25') as dataPartsString
--//2017
select dateName(month, '2017/08/25') as dataPartsString
--//August
select dateName(hour, '2017/08/25 08:36') as dataPartsString
--//8
select dateName(MINUTE, '2017/08/25 08:36') as dataPartsString
--//36

--DATEPART() function 
--The DATEPART() function returns a specified part of a date
--This function returns the result as an integer value
select DATEPART(year, '2017/08/25') as DATEPARTINT
,DATEPART(MONTH, '2017/08/25 10:25') as DATEPART_MONTH
,DATEPART(day, '2017/08/25 10:25') as DATEPART_DAY
,DATEPART(HOUR, '2017/08/25 10:25') as DATEPART_HOUR
,DATEPART(day, '2017/08/25 10:25') as DATEPART_MINUTE
--//2017	8	25	10	25

--DAY() function 
--The DAY() function returns the day of the month (from 1 to 31) for a specified date
select day('2017/08/25 10:25') as DATEPART_DAY
--//25


--GETDATE() function 
select GETDATE() as TODAY
--//2022-03-30 10:19:48.093

----GETUTCDATE() function 
--The GETUTCDATE() function returns the current database system UTC date time, in a 'YYYY-MM-DD hh:mm:ss.mmm' format
select GETUTCDATE();
--//2022-03-30 04:21:02.880

--ISDATE() function 
select ISDATE('2017-08-25');
--//1

select ISDATE('2017');
--//1

select ISDATE('hello world');
--//0

select ISDATE('14-08-2018');
--//0



--MONTH() function
Declare @date nvarchar (20) = GETDATE();
select @date;
--//Mar 30 2022 10:27AM
select MONTH(@date) as Month
--//3

--SYSDATETIME() function
--The SYSDATETIME() function returns the date and time of the computer where the SQL server is running 
select SYSDATETIME() as [SYS DATE TIME]
--//2022-03-30 10:28:37.6990050

--year() function
--The YEAR() function returns the year part for a specified date
DECLARE @DATE nvarchar(20) = GETDATE();
print @DATE;
--//2022-03-30 10:31:54.
select YEAR(@DATE) as [YEAR]
--//2022