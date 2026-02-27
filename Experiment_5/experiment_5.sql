CREATE TABLE Employee(
emp_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
Salary INT NOT NULL
)

INSERT INTO Employee (emp_id, name, Salary) VALUES
(1,  'Amit Sharma',      50000),
(2,  'Priya Verma',      45575),
(3,  'Rahul Mehta',      62000),
(4,  'Sneha Kapoor',     38745),
(5,  'Vikram Singh',     71000),
(6,  'Anjali Desai',     53211),
(7,  'Rohan Gupta',      48000),
(8,  'Neha Reddy',       39999),
(9,  'Karan Malhotra',   84500),
(10, 'Isha Nair',        36781),
(11, 'Arjun Patel',      90000),
(12, 'Meera Joshi',      42133),
(13, 'Siddharth Rao',    76000),
(14, 'Pooja Bansal',     58917),
(15, 'Manish Yadav',     64000);

SELECT emp_id,
       name,
       salary,
       CASE
           WHEN salary % 2 = 0 THEN 'Even Salary'
           ELSE 'Odd Salary'
       END AS salary_type
FROM Employee;

