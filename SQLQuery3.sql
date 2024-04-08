/*
JOINS
used to retrieve data from multiple tables

inner join--> simple/natural join/equi join
it returns all the rows from multiple tables wher the join condition is satisfied
SELECT column_name(s) FROM table1_name INNER JOIN table2_name
ON table1_name.column_name =table2_name.column_name;

outer join
left outer join 
right outer join
full outer join
cross join
*/
SELECT * FROM EMP;

/*
SELECT * FROM DEPINFO;
SELECT empName, empId,empSalary,deptName,deptLocation
FROM EMP INNER JOIN DEPINFO
ON EMP.deptId=DEPINFO.deptId;

SELECT e.empName, e.empId, e.empSalary, d.deptName, d.deptLocation
FROM EMP e
INNER JOIN DEPINFO d ON e.deptId = d.deptId;

/*//////////////////////VIEWS IN SQL/////////////////////////

1. Create a View:
To create a view, you use the CREATE VIEW statement followed by the view's name and the AS keyword, which is followed by the SELECT query that defines the view's structure.

sql
Copy code
CREATE VIEW ViewName AS
SELECT column1, column2, ...
FROM TableName
WHERE condition;
2. Alter a View:
You can alter an existing view to modify its definition. The ALTER VIEW statement is used for this purpose.

sql
Copy code
ALTER VIEW ViewName AS
SELECT new_column1, new_column2, ...
FROM NewTableName
WHERE new_condition;
3. Drop a View:
To remove a view from the database, you use the DROP VIEW statement followed by the view's name.

sql
Copy code
DROP VIEW ViewName;
4. Select from a View:
Once a view is created, you can query it just like you would query a table.

sql
Copy code
SELECT * FROM ViewName;
5. Update a View:
You cannot directly update the data in a view that involves multiple base tables or certain other constructs. However, you can update the underlying tables using the view.

6. Insert into a View:
You can insert data into a view if it is based on a single base table and doesn't include derived columns, aggregates, or grouping. In such cases, the data will be inserted into the underlying table.

sql
Copy code
INSERT INTO ViewName (column1, column2, ...)
VALUES (value1, value2, ...);
7. Delete from a View:
Similarly, you can delete data from a view if it is based on a single base table and meets certain criteria.

sql
Copy code
DELETE FROM ViewName
WHERE condition;
8. View Dependencies:
You can determine the dependencies of a view using system views like sys.dm_sql_referencing_entities and sys.dm_sql_referenced_entities.

These operations cover the basics of working with views in SQL Server. Views are powerful tools for data abstraction, simplifying complex queries, and controlling access to data. However, it's essential to understand their limitations and the impact on performance when using them in your database design.
*/

CREATE TABLE Employeees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);
INSERT INTO Employeees (EmployeeID, EmployeeName, Department, Salary)
VALUES 
    (1, 'John Doe', 'IT', 60000.00),
    (2, 'Jane Smith', 'HR', 55000.00),
    (3, 'Michael Johnson', 'Finance', 70000.00),
    (4, 'Emily Brown', 'IT', 65000.00),
    (5, 'David Wilson', 'Finance', 72000.00);

*//*
CREATE VIEW EmpDetails AS 
SELECT EmployeeID, EmployeeName, Department, Salary

The error message indicates that the CREATE VIEW statement must be the first statement in a query batch. To resolve this issue, ensure that there are no other statements before the CREATE VIEW statement, or separate the CREATE VIEW statement into its own batch.
FROM Employeees;
*/-- ERROR 
/*
-- Drop the view if it already exists
IF OBJECT_ID('EmpDetails', 'V') IS NOT NULL
    DROP VIEW EmpDetails;
GO
-- Create the view
CREATE VIEW EmpDetails AS 
SELECT EmployeeID, EmployeeName, Department, Salary
FROM Employeees;


-- Drop the view if it already exists
-- Drop the view if it already exists
IF OBJECT_ID('ed', 'V') IS NOT NULL
    DROP VIEW ed;
GO

-- Create the view
CREATE VIEW ed AS 
SELECT EmployeeID, EmployeeName, Department, Salary
FROM Employeees;

*/
/*
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Create the SimpleView
IF OBJECT_ID('SimpleView', 'V') IS NOT NULL
    DROP VIEW SimpleView;
GO

CREATE VIEW SimpleView AS
SELECT EmployeeID, EmployeeName
FROM Employees;

-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Create the JoinedView
IF OBJECT_ID('JoinedView', 'V') IS NOT NULL
    DROP VIEW JoinedView;
GO

CREATE VIEW JoinedView AS
SELECT e.EmployeeID, e.EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;
*/