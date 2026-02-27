CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);

INSERT INTO Employees (employee_id, name, salary) VALUES
(1, 'Amit', 45000),
(2, 'Riya', 52001),
(3, 'Karan', 38000),
(4, 'Neha', 61015),
(5, 'Rahul', 50000);

DECLARE
    v_rows NUMBER;
BEGIN
    UPDATE Employees
    SET salary = salary * 1.10
    WHERE salary < 50000;

    v_rows := SQL%ROWCOUNT;

    DBMS_OUTPUT.PUT_LINE('Rows Updated: ' || v_rows);
END;
/