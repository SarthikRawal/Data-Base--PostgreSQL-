-- Cursors
-- Cursors in PostgreSQL are used to retrieve and manipulate data row-by-row in a controlled manner. They are particularly useful when dealing with large datasets where processing the entire result set at once is not practical.

-- Cursor Lifecycle
* Declare a Cursor: Define the cursor with a SQL query.
* Open the Cursor: Initialize the cursor and prepare the query result set.
* Fetch Data: Retrieve rows from the cursor one at a time or in blocks.
* Close the Cursor: Release the cursor and its resources.



-- Create a function to demonstrate cursor usage
CREATE OR REPLACE FUNCTION print_employee_details()
RETURNS VOID AS $$
DECLARE
    emp_record RECORD;
    emp_cursor CURSOR FOR SELECT * FROM employees;
BEGIN
    -- Open the cursor
    OPEN emp_cursor;
    
    -- Fetch each row from the cursor and process it
    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN NOT FOUND;
        RAISE NOTICE 'ID: %, Name: %, Department: %, Salary: %', emp_record.id, emp_record.name, emp_record.department, emp_record.salary;
    END LOOP;
    
    -- Close the cursor
    CLOSE emp_cursor;
END;
$$ LANGUAGE plpgsql;

-- To call the function
SELECT print_employee_details();
