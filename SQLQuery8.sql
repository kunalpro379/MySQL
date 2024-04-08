/*
TRIGGER
a trigger is a type of stored procedure that automatically runs when an event occurs in the database server
here events are DML operations (INSERT , DELETE , UPDATE)
TYpes
1> DDL Triggers 
DDL Triggers is fired when DDL statements like Drop Table, Create Table or Alter 
Table occurs. DDL Triggers are always after Triggers.

2> DML Triggers 
we can create triggers on DML statements (like INSERT , UPDATE and DELETE ) and 
Stored procedures. DML triggers are of three types
 a> AFTER Triggers -> These triggers executes after the action of the insert , update, merge or delete

 b> INSETEAD OF Triggers(BEFORE) -> These triggers overrides the standard actions of the triggering statement
 It can be used to perform error or value checking on one or more columns
 These triggers perform additional actions before insert, updating or deleting the rows or rows.

 c> CLR Trigger
*/