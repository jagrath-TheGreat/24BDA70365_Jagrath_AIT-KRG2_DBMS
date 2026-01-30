DECLARE
    emp_id     NUMBER := 101;
    emp_name   VARCHAR2(50) := 'John Doe';
    emp_salary NUMBER := 90000;
    result NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Employee ID : ' || emp_id);
    DBMS_OUTPUT.PUT_LINE('Employee Name : ' || emp_name);
    DBMS_OUTPUT.PUT_LINE('Employee Salary : ' || emp_salary);
    result := emp_salary * 0.01;
  DBMS_OUTPUT.PUT_LINE('10% of salary :'|| result);
END;
/
