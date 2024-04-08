/*
DCL Cammands
GRANT: This command is used to give specific permissions to users or roles in the database.
Permissions can be granted at various levels
such as tables, views, stored procedures, or even at the database level.
GRANT permission(s) ON object TO user_or_role;
GRANT SELECT, INSERT ON dbo.TableName TO UserName;

REVOKE: This command is used to revoke previously granted permissions from users or roles. 
It removes the specified permissions from the user or role.
REVOKE permission(s) ON object FROM user_or_role;
REVOKE SELECT ON dbo.TableName FROM UserName;

DENY: This command is used to explicitly deny permissions to users or roles.
Even if permissions are granted through other means, a DENY will override those permissions.
DENY permission(s) ON object TO user_or_role;
DENY INSERT ON dbo.TableName TO UserName;


*/
/*
CREATE LOGIN DEEPAK WITH PASSWORD='Lawm@822471';
USE EMPLOYEEDB;
CREATE USER DEEPAK FOR LOGIN DEEPAK;
*/
GRANT SELECT , update, delete,insert ON EMP to DEEPAK;
REVOKE SELECT, update,delete ON EMP to KUNAL;

/*
In SQL Server, Transaction Control Language (TCL) commands are used to manage transactions 
within a database. The primary TCL commands are BEGIN TRANSACTION, COMMIT, ROLLBACK,
SAVE TRANSACTION, and SET TRANSACTION.
1> BEGIN TRANSACTION: This command marks the beginning of a transaction.
All subsequent SQL statements that are executed after
BEGIN TRANSACTION will be part of the same transaction until it is either committed
or rolled back.    BEGIN TRANSACTION;

2> COMMIT: This command is used to permanently save the changes made in the current
transaction. It ends the current transaction and makes all changes made within the 
transaction permanent.  COMMIT;

3> ROLLBACK: This command is used to undo all changes made in the current transaction and 
restore the database to its state before the transaction began.
It cancels the transaction and discards any changes made within it.   ROLLBACK;

4> SAVE TRANSACTION: This command is used to set a savepoint within the current transaction. 
It allows you to mark a point within the transaction to which you can later rollback if needed.
SAVE TRANSACTION SavepointName;

5> SET TRANSACTION: This command is used to set transaction isolation levels or other transaction characteristics
for the current session.   SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

*/
/*
CREATE TABLE EMPLOY(
EMPID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Salary DECIMAL(10, 2)
);
*/
BEGIN TRANSACTION;
INSERT INTO  EMPLOY(EMPID, EmployeeName, Salary) VALUES (1, 'KUNAL', 50000.00);
INSERT INTO EMPLOY (EMPID, EmployeeName, Salary) VALUES (2, 'DEEPAK', 60000.00);

SELECT * FROM EMPLOY;

SAVE TRANSACTION save_point_1;

INSERT INTO EMPLOY (EMPID, EmployeeName, Salary) VALUES (1, 'PATIL', 55000.00);

IF @@ERROR <> 0
BEGIN 
	ROLLBACK TRANSACTION save_point_1;
	PRINT 'ROllback to savepoint No changes were made.';
END
ELSE 
BEGIN
	COMMIT;
	PRINT 'TRansaction committed successfully.';
END


