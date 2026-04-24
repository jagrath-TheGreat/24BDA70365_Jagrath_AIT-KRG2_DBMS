CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary INT
);


CREATE SEQUENCE emp_seq
START 1;

CREATE OR REPLACE FUNCTION assign_emp_id()
RETURNS TRIGGER AS $$
BEGIN
    -- If ID is not provided, generate it automatically
    IF NEW.id IS NULL THEN
        NEW.id := nextval('emp_seq');
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_emp
BEFORE INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION assign_emp_id();


INSERT INTO employees (name, salary) VALUES ('Rahul', 50000);
INSERT INTO employees (name, salary) VALUES ('Anita', 60000);
INSERT INTO employees (name, salary) VALUES ('Vikas', 55000);

SELECT * FROM employees;