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

postgres=# BEGIN;
BEGIN
postgres=*# INSERT into students VALUES(9, 'Radhika', 'MBA');
INSERT 0 1
postgres=*# SAVEPOINT sp1;
SAVEPOINT
postgres=*# INSERT into students VALUES(10, 'Meloni', 'Mcom');
INSERT 0 1
postgres=*# SAVEPOINT sp2;
SAVEPOINT
postgres=*# UPDATE students SET course = 'BBA' WHERE name = 'Radhika';
UPDATE 1
postgres=*# ROLLBACK TO SAVEPOINT sp2;
ROLLBACK
postgres=*# COMMIT;
COMMIT
postgres=# Select * from students;
 roll |    name    | course 
------+------------+--------
    2 | Sarthik    | BCA
    3 | Ronak      | MBA
    4 | Sagar      | MCA
    7 | Vishal     | MBA
    1 | Saurabh    | MCA
    8 | Sirisha    | Mcom
    5 | Jaivardhan | Bcom
    6 | Shobhit    | Bcom
    9 | Radhika    | MBA
   10 | Meloni     | Mcom
(10 rows)
