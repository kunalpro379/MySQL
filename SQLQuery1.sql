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

*/
CREATE TABLE EmployeeInfo(
empid INTEGER PRIMARY KEY,
empName VARCHAR(20) NOT NULL,
empSalary DECIMAL(10,2) NOT NULL,
job VARCHAR(20),
phone INTEGER UNIQUE,
deptID INTEGER NOT NULL,
);

--DML STATEMENTS
/*
used to insert data, modify the existing data, removing and retrieving data 
from the tables
INSERT  UPDATE  DELETE  SELECT
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

