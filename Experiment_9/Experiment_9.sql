CREATE TABLE employee (
    emp_id INTEGER PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary NUMERIC
);
INSERT INTO Employee VALUES (101, 'Amit', 'HR', 30000);
INSERT INTO Employee VALUES (102, 'Riya', 'IT', 50000);
INSERT INTO Employee VALUES (103, 'Karan', 'Finance', 45000);
INSERT INTO Employee VALUES (104, 'Neha', 'IT', 55000);


CREATE SCHEMA emp_package;

CREATE OR REPLACE FUNCTION emp_package.get_all_employees()
RETURNS VOID AS $$
DECLARE
    emp_rec RECORD;
BEGIN
    FOR emp_rec IN 
        SELECT * FROM employee
    LOOP
        RAISE NOTICE '% % % %',
            emp_rec.emp_id,
            emp_rec.emp_name,
            emp_rec.department,
            emp_rec.salary;
    END LOOP;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION emp_package.get_emp_by_dept(p_dept VARCHAR)
RETURNS VOID AS $$
DECLARE
    emp_rec RECORD;
BEGIN
    FOR emp_rec IN 
        SELECT * FROM employee
    LOOP
        IF emp_rec.department = p_dept THEN
            RAISE NOTICE '% % % %',
                emp_rec.emp_id,
                emp_rec.emp_name,
                emp_rec.department,
                emp_rec.salary;
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT emp_package.get_all_employees();
SELECT emp_package.get_emp_by_dept('IT');