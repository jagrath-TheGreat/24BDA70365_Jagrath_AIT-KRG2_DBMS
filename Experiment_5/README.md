# Experiment 5 – SQL Conditional Logic using MOD Operator

## Aim of the Practical
To understand and apply conditional logic in SQL by using the modulus operator (MOD / %) to analyze numerical data and classify employee salaries as odd or even, thereby improving data analysis and decision-making skills in SQL.

---

## Tool Used

### Database Management System
- Oracle Database Express Edition (Oracle XE)
- PostgreSQL Database

### Database Administration Tool
- Oracle SQL Developer
- pgAdmin

---

## Objective
- To write and execute SQL queries using the MOD (%) operator.
- To classify employee salaries as Even or Odd.
- To apply conditional logic using CASE statements in SQL.
- To improve data filtering and analytical skills using SQL queries.

---

## Practical / Experimental Steps

1. Open Oracle SQL Developer or pgAdmin and connect to the database.
2. Create the `Employee` table.
3. Insert multiple records into the table.
4. Write a SELECT query using CASE and MOD operator.
5. Execute the query.
6. Observe and verify the output.

---

## I / O Analysis

### Table Creation
```sql
CREATE TABLE Employee(
emp_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
Salary INT NOT NULL
);
```

---

### Insertion of Records
```sql
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
```

![Query Result](output/0.png)

---

### Query to Classify Even and Odd Salaries
```sql
SELECT emp_id,
       name,
       salary,
       CASE
           WHEN MOD(salary, 2) = 0 THEN 'Even Salary'
           ELSE 'Odd Salary'
       END AS salary_type
FROM Employee;
```

![Query Result](output/1.png)

---

## Learning Outcomes
- Understood how to create tables in SQL.
- Learned how to insert multiple records into a database.
- Gained knowledge of using the MOD (%) operator for numerical classification.
- Learned how to apply CASE statements for conditional logic.
- Developed skills in analyzing and categorizing data using SQL queries.
- Improved understanding of SQL-based decision making.
