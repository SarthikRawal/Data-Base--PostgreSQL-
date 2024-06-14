/*
TCL - Transaction Control language

(TCL) commands in PostgreSQL are used to manage transactions in the database. The main TCL commands are:

BEGIN
COMMIT
ROLLBACK
SAVEPOINT
RELEASE SAVEPOINT
ROLLBACK TO SAVEPOINT
*/

-- begin
The BEGIN command is used to start a new transaction.

-- Commit
The COMMIT command is used to save the changes made in the transaction.

-- Rollback
The ROLLBACK command is used to undo the changes made in the current transaction.

-- SAVEPOINT
The SAVEPOINT command is used to set a point within a transaction to which you can later roll back.

-- RELEASE SAVEPOINT
The RELEASE SAVEPOINT command is used to remove a savepoint. This makes it so that you cannot roll back to this savepoint anymore.

-- ROLLBACK TO SAVEPOINT
The ROLLBACK TO SAVEPOINT command is used to undo changes up to the specified savepoint without affecting the whole transaction.


-- Example on using TCL commands

-- Start a new transaction
BEGIN;

-- Insert a new employee
INSERT INTO employees (name, department, salary) VALUES ('Alice Williams', 'HR', 50000);

-- Set a savepoint
SAVEPOINT sp1;

-- Insert another employee
INSERT INTO employees (name, department, salary) VALUES ('Bob Martin', 'Finance', 65000);

-- Set another savepoint
SAVEPOINT sp2;

-- Update an employee's department
UPDATE employees SET department = 'HR' WHERE name = 'Jane Smith';

-- Rollback to the second savepoint
ROLLBACK TO SAVEPOINT sp2;

-- The update to 'Jane Smith' is undone, but 'Bob Martin' is still inserted

-- Commit the transaction
COMMIT;
