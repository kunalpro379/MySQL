--CREATE DATABASE EMPLOYEEDB

USE EMPLOYEEDB;
/*
Data types
Numeric  
INTEGER tinyint DECIMAL real

Character 
CHAR VARCHAR NCHAR NVARCHAR 

Temporal 
DATE TIME DATETIME SMALLDATETIME

BIT TABLE SQL_VARIENT UNIQUEIDENTIFIER xml
*/

--INTEGRITY CONSTRIENTS
/*
A SET OF RULES 
USED TO MAINTAIN THE QUALITY OF INFORMATION
ENSURE THAT THE DATA INSERTION UPDATNG AND OTHER PROCESSES HAVE TO BE PERFORMED 
IN A SUCH A WAY THAT DATA INTEGTRITY NOT AFFECTED

UNIQUE  NOTNULL  PRIMARY KEY  FOREIGN KEY  DEFAULT  CHECK

*/

--DDL STATEMENTS
/*
used to create modify the objects structure(database , tables , views , triggers)
CREATE DROP ALTER  TRUNCATE  RENAME

CREATE TABLE DEPINFO(
deptId INTEGER NOT NULL,
deptName VARCHAR(20) NOT NULL,
deptLocation VARCHAR(50)
);

ALTER TABLE EmployeeInfo
ALTER COLUMN phone VARCHAR(20);
*/
/*
CREATE TABLE EMP_DETAILS(
empid INTEGER PRIMARY KEY,
empName VARCHAR(20) NOT NULL,
empSalary DECIMAL(10,2) NOT NULL,
job VARCHAR(20),
phone VARCHAR(20) UNIQUE,
deptID INTEGER NOT NULL,
);
*/

/*
INSERT INTO EMP_DETAILS VALUES
(01,'KUNAL',10000000.00,'SDE2', '9892885090',001),
(02,'Homelander',3000000.00,'SDE1', '3323323323',011),
(03,'Butcher',1000000.00,'SDE2', '9898989898',021),
(04,'Elliot',5000000.00,'SDE3', '8888888888',031);
*//*
INSERT INTO EMP_DETAILS(empid,empName, empSalary,deptId,phone)
VALUES(05,'Harison wells','3883999.00',023,'9876543212'),(06,'killer frost','9833832.00',933,'1234567890');
*/
--DML STATEMENTS
/*
used to insert data, modify the existing data, removing and retrieving data 
from the tables
INSERT  UPDATE  DELETE  SELECT
*/
/*
SELECT -> used to retrive data or information from the table
*/

--SELECT * FROM dbo.EMP_DETAILS;
--SELECT empName, empSalary FROM dbo.EMP_DETAILS;

/*
UPDATE--> used to update/modify existing table data/informatn

UPDATE table_name
SET column_name=column_value,....
[WHERE condition]
UPDATE employee_info SET empSalary=empSalary+1000;
UPDATE employee_info SET JOB='SDE1'
WHERE empName='Homelander'

SELECT * FROM dbo.EMP_DETAILS;
UPDATE dbo.EMP_DETAILS
SET empSalary = empSalary + 1000.00
WHERE job = 'SDE2' AND empName = 'KUNAL';
UPDATE dbo.EMP_DETAILS
SET job = 'SDE3'
WHERE empName = 'Harison wells' OR empName = 'killer frost';

UPDATE dbo.EMP_DETAILS
SET job = 'SDE3'
WHERE job IS NULL;
*//*
UPDATE dbo.EMP_DETAILS
SET job = 'SDE4'
WHERE job = 'SDE3';
*/

/*
DELETE -> used to delete one or more records frmo table

*/
/*
ALTER TABLE EMP_DETAILS
RENAME TO EMP;
*/

--EXEC SP_RENAME 'EMP_DETAILS', 'EMP';
/*
SELECT * FROM EMP;
DELETE FROM EMP
WHERE deptId=11;
*/
--DELETE FROM EMP
--SELECT * FROM EMP;--TABLE ALREADY DELETED
/*
INSERT INTO EMP VALUES
(01,'KUNAL',10000000.00,'SDE2', '9892885090',001),
(02,'Homelander',3000000.00,'SDE1', '3323323323',011),
(03,'Butcher',1000000.00,'SDE2', '9898989898',021),
(04,'Elliot',5000000.00,'SDE3', '8888888888',031);
*/
SELECT * FROM EMP;

/*
ORDER BY CLAUSE
used to sort/ arrange records in eighther ascending or descending order
SELECT column_name(s) FROM table_name
ORDER BY column_name[DESC];
*/
SELECT * FROM EMP ORDER BY empSalary;
SELECT * FROM EMP ORDER BY empSalary DESC;
SELECT * FROM EMP ORDER BY empName;
/*
WHERE CLAUSE 
using where clause u are able to restrict the query to rows that meet a condition 
u can use any operators in where clause 
SELECT * FROM table_name where condition;
*/
SELECT * FROM EMP WHERE empSalary>=3000000.00 and job != 'SDE1'
SELECT * FROM EMP WHERE  empid=2 or empid=3 or deptID=1 
/*
AGGREGATE FUNCTIONS or GROUP FNUCTIONS

*/
SELECT * FROM EMP;
SELECT SUM(empSalary) as TOTAL_AMOUNT FROM EMP;
SELECT * FROM EMP WHERE empSalary =(SELECT MAX(empSalary) FROM EMP);
SELECT COUNT(empName) FROM EMP;

--INSERT INTO EMP(empid,empSalary,empName,deptID) values(6,19292929.00, 'Tyrell', 098);
SELECT * FROM EMP;
/*
ABS()   -> absolute function
CEILING()  -> CEILING(78.098)=79
FLOOR()  -> FLOOR(89.9)=88
SIGN()  -> SIGN(15)=1  SIGN(-39)=-1
SQUARE()
SQRT()
PI()
COS(), SIN(), TAN()
EXP()--> e^2

*/
--TCL statements
/*
used to save data, undo/redo transactions performed on the database
COMMIT ROLLBACK SAVE TRANSACTIONS
*/

--DCL statments 
/*
used to create roles, permissions , refrential integrity and as well it is used to controll access to database by securing it 
GRANT REVOKE
*/

