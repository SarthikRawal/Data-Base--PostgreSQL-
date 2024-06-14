--  VIEWS

Views in PostgreSQL are virtual tables that represent the result of a stored query. They provides a way to simplify complex queries, encapsulated logic and improve security by restricting access to specific data.

-- Types of views

Simple view: A view based on a single table.
Complex View: A view based on ,ultiple table with joins and/or aggregation.
Materialized View: A view that stores its result set as a physical table, which can be refreshed periodically.


-- Let's look into an example on creating simple view

> select * from students;
 roll |    name    | course 
------+------------+--------
    2 | Sarthik    | MCA
    3 | Ronak      | MBA
    4 | Sagar      | MCA
    7 | Vishal     | MBA
    1 | Saurabh    | MCA
    8 | Sirisha    | Mcom
    5 | Jaivardhan | Bcom
    6 | Shobhit    | Bcom
    9 | Radhika    | MBA
   10 | Meloni     | Mcom


-- Create view only for MCA students
CREATE VIEW mca_students as
select * from students
where course = 'MCA';


> select * from mca_students ;
 roll |  name   | course 
------+---------+--------
    4 | Sagar   | MCA
    1 | Saurabh | MCA
    2 | Sarthik | MCA
