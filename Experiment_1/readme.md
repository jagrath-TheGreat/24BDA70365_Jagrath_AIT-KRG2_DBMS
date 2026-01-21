AIM:
To design and implement a Library Management System database using appropriate tables, primary keys, foreign keys, and constraints, and to perform DML operations along with DCL commands such as role creation, privilege granting, and revoking to ensure database security.


Software Requirements
●	Database Management System:

○	PostgreSQL

●	Database Administration Tool:

○	pgAdmin

Objective :
To gain practical experience in implementing Data Definition Language (DDL), Data Manipulation Language (DML), and Data Control Language (DCL) operations in a real database environment. This will also include implementing role-based privileges to secure data.


4.	Practical / Experimental Steps

Step 1: Open pgAdmin and connect to the PostgreSQL server using administrator credentials.
Steps 2: Create the Books table with appropriate data types, primary key, and constraints to maintain data integrity.
Steps 3: Insert sample records into the Books table and perform basic operations such as SELECT, UPDATE, and DELETE.
Steps 4: Create the Members table with primary key, NOT NULL, UNIQUE, and CHECK constraints, and insert sample member records.
Steps 5: Create the Books_Issue table with primary key and foreign key references to Books and Members, along with date and validation constraints.
Steps 6:  Insert sample book issue records and verify the data using SELECT queries.
Steps 7:  Create a database role named Librarian with LOGIN and password for role-based access control.
Steps 8: Grant SELECT, INSERT, UPDATE, and DELETE permissions on required tables to the Librarian role.
Steps 9:  Revoke the granted permissions from the Librarian role to demonstrate database security control by the administrator.








5.	I / O Analysis
DATABASE DESIGN

Query to create Table Books :
 CREATE TABLE Books(
ID INT Primary Key,
Book_Title Varchar(30),
Author_Name Varchar(30),
Count int check(Count>=1) Not NULL,
)

To create table members
create table members(
    MID INT Primary Key,
    Name varchar(30) NOT NULL,
    age int check(age>=16) NOT NULL,
    email varchar(30) UNIQUE NOT NULL
)

To create table Books_issue
create table Books_Issue(
    Issue_No INT Primary Key,
    Books_ID INT references Books(ID) NOT NULL,
    MID INT references members(MID) NOT NULL,
    Issue_Date DATE NOT NULL,
    Return_Date DATE check(Issue_Date <= Return_date or Return_Date is NULL),
    Overdue BOOL NOT NULL default false
)

To Generate A Role ( by Admin)
create role librarian
with LOGIN PASSWORD '123';

To Grant Access (by Admin)
grant select,update,delete,insert on Books to librarian;
grant select,update,delete,insert on members to librarian;
grant select,update,delete,insert on Books_Issue to librarian;














DATA MANIPULATION

Insert Sample records in all tables

insert Into Books(id, Book_Title, Author_Name,Count)
Values (1,'Harry Potter','J K Howling',2),
(2,'Overlord','Kugane Maruyama',4),
(3,’5 Second Rule’,’abc’,1);

 

insert into members(MID, Name, age, email)
Values (101,'Jagrath',18,'jagrath@gmail.com'),
(102,'Daksh',19,'daksh@gmail.com')
 

insert into Books_Issue(Issue_No,Books_ID,MID,Issue_Date, Return_Date)
Values (500,1,101,'2026-01-01','2026-01-10')
 



Accessing Data Using created Role

select * from books;
select * from members;
select * from books_Issue;
 

UPDATE books
set author_name = 'abcdef' where id=3
 

Revoke the Access to the Role (by Admin)
Query :
revoke select, update, delete, insert on Books from librarian;
revoke select, update, delete, insert on members from librarian;
revoke select, update, delete, insert on Books_issue from librarian;

(Role attempting access AFTER REVOKE) 
Select * from books;
 



6.	Learning outcomes (What I have learnt):

•	Understood the basics of relational database design using tables, keys, and relationships.
•	Learned to apply primary key and foreign key constraints to maintain data integrity.
•	Gained hands-on experience with INSERT, UPDATE, and DELETE operations safely.
•	Understood how roles and privileges control access to database objects.
•	Learned to use GRANT and REVOKE for implementing read-only users.
•	Practiced ALTER TABLE and DROP TABLE for managing database changes.




