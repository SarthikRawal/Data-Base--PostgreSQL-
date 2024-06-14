-- Triggers
Triggers are special types of stored procedures that automatically execute or "fire" when certain events occur in the database. 
Triggers can be defined to execute before or after an INSERT, UPDATE, or DELETE operation on a table.

-- Creating trigger example using trigger function

-- Function for taking back-up data into another table
create function student_logs_trg_func()
returns trigger
language 'plpgsql'
AS $$
                                          
declare

begin
insert into students_logs 
(roll_old, name_old, course_old)
values(old.roll, old.name, old.course);
return new;

END;
$$;

-- Trigger to fire the function 

create trigger student_trg

 before delete or update
 on students
 for each row

execute procedure student_logs_trg_func();

