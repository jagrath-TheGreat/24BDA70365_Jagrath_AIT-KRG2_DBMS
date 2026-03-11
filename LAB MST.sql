CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary INT,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);


INSERT INTO Department (DeptID, DeptName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');
INSERT INTO Employee (EmpID, EmpName, Salary, DeptID) VALUES
(101, 'Rahul', 50000, 1),
(102, 'Aman', 60000, 2),
(103, 'Neha', 55000, 2),
(104, 'Priya', 52000, 3),
(105, 'Karan', 48000, 1),
(106, 'Simran', 70000, 2),
(107, 'Rohit', 45000, 4);




-- ANSWER 
SELECT count(e.empID) as total_Employees, d.deptName
FROM Employee as e
JOIN Department as d
on e.DeptID = d.DeptID
GROUP BY d.deptName;

 

