/*
The IN operator is used to specify multiple values in a WHERE clause. It checks whether a value matches any value in a list.

Theory: The IN operator is used to compare a value with a list of values. If the value matches any value in the list, the condition is true, and the row is included in the result set.
*/
SELECT * FROM DEPINFO;
SELECT * FROM EMP;
/*
INSERT INTO DEPINFO values
(11,'pqrf', 'mumbai'),
(12,'pqr', 'mumbai'),
(13, 'xyz','delhi');
*/
SELECT empId, empName FROM EMP
WHERE deptID IN (SElECT deptId FROM DEPINFO WHERE deptLocation='mumbai');

/*
2> NOT IN
The NOT IN operator negates the condition specified by IN. It checks whether a value does not match any value in a list.

Theory: The NOT IN operator is used to exclude rows that match any value in the list specified in the WHERE clause.
*/

SELECT empId, empName
FROM EMP
WHERE deptID NOT IN (SELECT deptId FROM DEPINFO WHERE deptLocation='UK');

/*
3> EXISTS
The EXISTS operator checks for the existence of any rows in a subquery and returns true if the subquery returns one or more rows.

Theory: The EXISTS operator is used to test whether a subquery returns any rows. If the subquery returns at least one row, the condition is true, and the row is included in the result set.

*/
SELECT empId, empName
FROM EMP e
WHERE EXISTS (SELECT * FROM DEPINFO d WHERE d.deptId=e.deptID);


/*
4> NOT EXISTS
The NOT EXISTS operator is the negation of EXISTS. It checks whether a subquery returns no rows.

Theory: The NOT EXISTS operator is used to test whether a subquery returns no rows. If the subquery returns no rows, the condition is true, and the row is included in the result set.

*/
SELECT empId, empName
FROM EMP e
WHERE NOT EXISTS(SELECT * FROM DEPINFO d WHERE d.deptId=e.deptID);

/*
5> SOME
The SOME operator compares a value to each value in a list or subquery and returns true if the condition is true for at least one value.

Theory: The SOME operator is used to compare a value to each value in a list or subquery. If the condition is true for at least one value, the condition is true, and the row is included in the result set.
*/
SELECT empId, empName, deptName
FROM EMP e, DEPINFO d
WHERE empSalary>SOME(SELECT empSalary FROM EMP WHERE deptId=13 );

/*
6> SELECT QUERY with ANY
The ANY operator is equivalent to SOME. It compares a value to each value in a list or subquery and returns true if the condition is true for at least one value.

Theory: The ANY operator is used to compare a value to each value in a list or subquery. If the condition is true for at least one value, the condition is true, and the row is included in the result set.
*/
SELECT empId,empName
FROM EMP
WHERE empSalary>ANY (SELECT empSalary FROM EMP WHERE deptID=11);

/*
NESTED QUERY with 'WITH'
The WITH clause, also known as Common Table Expression (CTE), defines a temporary result set that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement.

Theory: The WITH clause allows you to define temporary result sets that can be referenced within the same query. It improves readability and performance by avoiding redundant subqueries.

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    ManagerID INT -- Foreign key referencing EmployeeID of the manager
);

INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID)
VALUES 
    (1, 'John Doe', NULL),    -- John Doe is the CEO, so he has no manager
    (2, 'Jane Smith', 1),     -- Jane Smith reports to John Doe (EmployeeID: 1)
    (3, 'Michael Johnson', 1);-- Michael Johnson also reports to John Doe (EmployeeID: 1)

*/
WITH ManagerNames AS (
    SELECT E.EmployeeID AS EmployeeID, E.EmployeeName AS EmployeeName, 
           M.EmployeeName AS ManagerName
    FROM Employees E
    LEFT JOIN Employees M ON E.ManagerID = M.EmployeeID
)
SELECT E.EmployeeID, E.EmployeeName, M.ManagerName
FROM Employees E
LEFT JOIN ManagerNames M ON E.EmployeeID = M.EmployeeID;
