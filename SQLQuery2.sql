/*
STRING FUNCTIONS 

*/
USE EMPLOYEEDB;
SELECT LEN(empName) FROM EMP;
SELECT UPPER('this is kunal patil');
SELECT empName, LOWER(empName) FROM EMP;
SELECT LTRIM ('       Hey THERE    ' ),TRIM('H  OW  ARE  YOU'),RTrIM('NICE       ');
SELECT REPLACE('MICROSOFT', 'MICRO', 'MAJOR');
SELECT SUBSTRING('MICROSOFT', 6,9);
SELECT REPLICATE('kunal ',10);


/*
AND,OR, NOR
SELECT * FROM USERS;
SELECT username FROM USER
WHERE email='kunaldp379@gmail.com'
AND password ='Lawm@2471';
SELECT password FROM USERS
WHERE username='deepak patil' or email='deepakbp78@gmail.com';
*/
--DATE AND TIME FUNCTIONS
--1. GETDATE(),getDate(), current_timestamp,systemdatetime()
--2. datename(),
--3. datediff()
--4. dateadd()

SELECT GETDATE() AS TODAY_DATE;
SELECT SYSDATETIME() AS TODAY_TIME;
SELECT CURRENT_TIMESTAMP AS TODAY_DATE;

SELECT DATENAME(MONTH,CURRENT_TIMESTAMP);
SELECT DATEDIFF(MONTH, '2003-08-22', CURRENT_TIMESTAMP) AS "AGE_IN_MONTH";
SELECT DATEDIFF(YEAR, '2003-08-22', CURRENT_TIMESTAMP) AS "AGE_IN_YRS";

/*
GROUP BY CLAUSE
defines one or more columns as a group such that all rows within any group have the same values for those columns 
always used with SELECT statement
SELECT column_name(s), aggregate_function()
FROM table_name GROUP BY column_name;
*/
SELECT * FROM EMP;
SELECT deptID FROM EMP GROUP BY deptID;
SELECT deptID, SUM(empSalary) FROM EMP
GROUP BY deptID;
--SELECT empSalary FROM EMP GROUP BY deptId;--->error
/*
Msg 8120, Level 16, State 1, Line 49
Column 'EMP.empSalary' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.
Completion time: 2024-04-08T03:52:46.0142971+05:30
*/
SELECT SUM(empSalary) AS 'TOTAL_SALARY ' FROM EMP GROUP BY deptId;
SELECT MIN(empSalary) AS 'MIN_SALARY ' FROM EMP GROUP BY deptId;
SELECT MAX(empSalary) AS 'MAX_SALARY ' FROM EMP GROUP BY deptId;
SELECT AVG(empSalary) AS 'AVG_SALARY ' FROM EMP GROUP BY deptId;
SELECT ROUND(AVG(empSalary),2) AS 'AVG_SALARY ' FROM EMP GROUP BY deptId;

/*
HAVING CLAUSE
having clause defines the condition that is then applied to group of rows
always used with select statements inside groupby clause
SELECT column_name(s), aggregate_function()
FROM table_name
GROUP BY column_name HAVING condition;
*//*
INSERT INTO EMP VALUES
(6, 'darlen', 10000000.00, 'SDE2', '9895485090', 13),
(7, 'angela', 3000000.00, 'SDE1', '3323356323', 1),
(8, 'phillips', 1000000.00, 'SDE2', '9898989678', 11),
(10, 'Catlin', 5000000.00, 'SDE3', '8898888888', 21);

*/
SELECT * FROM EMP;
SELECT deptId, SUM(empSalary) FROM EMP
GROUP BY deptId HAVING deptId=11;
/*
SELECT * FROM EMP;
SELECT deptId, SUM(empSalary) FROM EMP
GROUP BY deptId WHERE deptId=11;
*/
SELECT * FROM EMP;
SELECT job, SUM(empSalary) FROM EMP
GROUP BY job HAVING job='SDE1';

/*
TOP CLAUSE
the top clause specifies the first n rows of the query result that are to be retrived 
this clause should be always used with the ORDER BY clause
SELECT TOP(n) column_name FROM table_name
ORDER BY column_name[DESC];
*/
SELECT TOP(5) empSalary FROM EMP
ORDER BY empSalary DESC;