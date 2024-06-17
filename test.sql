CREATE TABLE branch (
    id SERIAL PRIMARY KEY,
    branch_name VARCHAR(50) UNIQUE,
    branch_code VARCHAR(10) UNIQUE
);

CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    student_name VARCHAR(100),
    branch_name VARCHAR(50)
);

INSERT INTO branch (branch_name, branch_code) VALUES
('Computer Science', 'CS03'),
('Mechanical', 'MCH02'),
('Electrical', 'EC01'),
('Civil', 'CL04');


 id |   branch_name    | branch_code 
----+------------------+-------------
  1 | electronics      | EC01
  2 | machanical       | MCH02
  3 | Computer Science | CS03
  4 | civil            | CL04
(4 rows)


postgres=# insert into student (student_name, student_roll, branch_name) values ('sourabh', 23, (select branch_name from branch where branch_code = 'MCH02'));
INSERT 0 1
postgres=# insert into student (student_name, student_roll, branch_name) values ('sirisha', 24, (select branch_name from branch where branch_code = 'CL04'));
INSERT 0 1
postgres=# insert into student (student_name, student_roll, branch_name) values ('siddarth', 25, (select branch_name from branch where branch_code = 'CL04'));
INSERT 0 1
postgres=# insert into student (student_name, student_roll, branch_name) values ('vishnu', 26, (select branch_name from branch where branch_code = 'CS04'));
INSERT 0 1
postgres=# insert into student (student_name, student_roll, branch_name) values ('vishal', 27, (select branch_name from branch where branch_code = 'CS03'));
INSERT 0 1


postgres=# select * from student;
 id | student_name | student_roll |   branch_name    
----+--------------+--------------+------------------
  2 | sarthik      |           22 | electronics
  3 | sourabh      |           23 | machanical
  4 | sirisha      |           24 | civil
  5 | siddarth     |           25 | civil
  7 | vishal       |           27 | computer science
  6 | vishnu       |           26 | computer science
