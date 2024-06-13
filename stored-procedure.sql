-- Stored Procedures

-- A stored procedure is like a recipe or a set of instructions that the database can remember and execute later. 
-- It's a way to store a sequence of database operations as a single unit.

CREATE TABLE test(
    id numeric, 
    name varchar(50),
    age INT
);

-- Create stored procedure

CREATE PROCEDURE Insert_Test(numeric, varchar, int)
LANGUAGE 'plpgsql'
AS $$            
       
BEGIN

INSERT INTO test (id, name, age) values($1, $2, $3);
commit;

END;
$$;

-- Call that procedure

postgres=# CALL Insert_Test(1, 'sarthik', 23); 
CALL
postgres=# CALL Insert_Test(2, 'dhanshree', 29); 
CALL
postgres=# CALL Insert_Test(3, 'vayushree', 28); 
CALL


postgres=# select * from test;
 id |   name    | age 
----+-----------+-----
  1 | sarthik   |  23
  2 | dhanshree |  29
  3 | vayushree |  28
(3 rows)
