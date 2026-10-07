-- using pre-created databse---------------------------------------------
use anp_d6155;

-- creating "employee" table ---------------------------------------------
Create Table Employee(
	Emp_ID INT PRIMARY KEY,
    First_Name Varchar(50),
    Last_Name Varchar(50),
    Gender Varchar(15),
    Department Varchar(50),
    Salary Double,
    Hire_Date DATE,
    City VARCHAR(50)
);

-- To see the table content/data -------------------------------------------
select * from Employee;

-- inserting multiple records in table -------------------------------------
INSERT INTO employee
(Emp_ID, First_Name, Last_Name, Gender,  Department, Salary, Hire_Date, City)
VALUES
(101,'Amit','Sharma','Male','HR',45000.00,'2022-01-15','Kolkata'),
(102,'Priya','Singh','Female','Finance',60000.00,'2021-06-20','Delhi'),
(103,'Rahul','Verma','Male','IT',75000.00,'2020-03-10','Bengaluru'),
(104,'Sneha','Roy','Female','Marketing',55000.00,'2023-02-18','Kolkata'),
(105,'Arjun','Das','Male','IT',80000.00,'2019-09-25','Hydrabad'),
(106,'Neha','Gupta','Female','Sales',48000.00,'2022-11-05','Mumbai'),
(107,'Vikram','Patel','Male','Finance',65000.00,'2021-08-12','Ahmedabad'),
(108,'Ananya','Sen','Female','HR',47000.00,'2024-01-08','Kolkata'),
(109,'Rohan','Mehta','Male','Sales',52000.00,'2023-05-17','Pune'),
(110,'Kavita','Nair','Female','Marketing',58000.00,'2020-12-01','Chennai');

-- Inserting single record in table ----------------------------------------
INSERT INTO employee
(Emp_ID, First_Name, Last_Name, Gender,  Department, Salary, Hire_Date, City)
VALUES
(111,'Amit','Sharma','Male','HR',45000.00,'2022-01-15','Kolkata');

-- Inserting null value by specifying NULL. (Primary key must not be null) ---
INSERT INTO employee
(Emp_ID, First_Name, Last_Name, Gender,  Department, Salary, Hire_Date, City)
VALUES
(112,'Amit','Sharma','Male','HR',45000.00,'2022-01-15',null);

-- inserting full row null value without specifying null ----------------------
INSERT INTO employee
(Emp_ID, First_Name, Last_Name, Gender,  Department, Salary, Hire_Date, City)
VALUES
(113,'Amit','Male','HR','2022-01-15','Kolkata');

-- ALTER is used to modify the structure of an existing table without deleting it ----------------
alter table employee add (mobile varchar(15));

-- DESC is used to describe a table ----------------------------------------
desc employee;

-- MODIFY DATATYPE of a column in table ------------------------------------
alter table employee modify mobile varchar(20);

-- MODIFY COLUMN NAME of a coloumn in a table ------------------------------
alter table employee change mobile phone varchar(15);

-- DROP a column (delete entire column) ------------------------------------
alter table employee DROP phone;

-- RENAME a table ----------------------------------------------------------
rename table employee to emp;

-- update is used to update a table value ----------------------------------
UPDATE employee set mobile = '9876543210' where emp_id=101;

-- It will show "emp_id" as "employee Id" ----------------------------------
select emp_id as 'employee ID' from employee;

-- Arithmatic operations (+,-,*,/) -----------------------------------------
-- Q1. Calculate annual salary of employee
select First_Name, salary*12 as 'Annual Salary' from employee;
-- Q2. Display ename, annual sal of employees
Select First_Name, Last_Name, salary*12 as 'Annual Salary' from employee;
-- Q3. Sisplay sal and Rs.100 more in sal
Select salary, salary+100 as 'Rs.100 more salary' from employee;
-- Q4. Display ename and hiredate of employee and calculate 15days sal
Select First_Name, Last_Name, Hire_Date, salary/2 as 'salary 15 Days' from employee;
-- Q5. Display sal of employee and deduct Rs.100 from sal
Select Salary, salary-100 as 'Deducted salary' from employee;

-- WHERE clause -----------------------------------------------------------
-- Q1. (EQUAL) show data of employee 104
select * from employee where Emp_ID=104;
-- Q2. (NOT) show data of all employee except employee 104
select * from employee where Emp_ID!=104;
-- Q3. (Less Than) Show all employee earning less than Rs.50000
select * from employee where Salary<50000;
-- Q4. (Greater Than) Show all employee earning more than Rs.50000
select * from employee where Salary>50000;
-- Q5. (Less Than Equal) Show all employee earning less or equal to Rs.50000
select * from employee where Salary<=50000;
-- Q6. (Greater Than Equal) Show all employee earning more than or equal to Rs.50000
select * from employee where Salary>=50000;

-- (BETWEEN - AND)----------------------------------------------------------
-- Show all employees earning between Rs. 50k to Rs.60k
select * from employee where Salary BETWEEN 50000 AND 60000;

-- (IN - to fetch group of records)-----------------------------------------
-- Q1. Show record of employee 101,105,110
select * from employee where emp_id IN(101,105,110);
-- (NOT IN - to fetch except the given group of records)--------------------
-- Show record of employee except 101,105,110
select * from employee where emp_id IN(101,105,110);

-- NULL --------------------------------------------------------------------
-- Q1. Show the record of all value where value of city is null
select * from employee where city is null;
-- Q2. (not null) Show the record of all value where value of city is not null
select * from employee where city is not null;

-- (LIKE- compares data with given expression (find/search)) --------------------------
-- Q1. (%-represents 0 or more than one character) Show the all the records where last name starts with"s"
select * from employee where last_name like 's%';
-- Q2. (_ represents only one character) Show the all the records where 2nd character of last name is "i"
select * from employee where last_name like '_i%';

-- ORDER BY (used to arrange in ascending or descending order) -------------------------------------
-- Q1. Show details of employee's salary in ascending order -----------------
select * from employee order by salary asc;
-- Q2. Show details of employee's salary in descending order -----------------
select * from employee order by salary desc;

-- AND & OR operator ---------------------------------------------------------
-- Q1. Show name of epmloyee whose department is "IT" and gender is "Male"
Select first_name, last_name from employee where department='IT' AND gender='Male';
-- Q2. Show name and department of epmloyee whose department is "IT" or gender is "Female"
Select first_name, last_name, department from employee where department='IT' OR gender='Female';

-- ----------- SQL FUNCTIONS -------------------------------------------------
-- -----------SINGLE ROW function --------------------------------------------
-- UPPER() - capitalise 
select upper(First_name) as First_Name from employee;
-- LOWER() - shows the data in lower case
select LOWER(First_name) as First_Name from employee;
-- CONCAT - Concatinates two column
select CONCAT(First_name," ",Last_Name) as Full_Name from employee;
-- LENGTH - return number of characters
select length(First_name) from employee where emp_id=108;
-- SUB-STRING - returns a specific part of a string 
select substr(First_Name,1,3) from employee;
-- REPLACE -----
select replace('Amit','i','A') from employee where First_Name='Amit';
-- ROUND --------
select ROUND(12.53);
-- MOD -----------
Select mod(12,3);
-- AGGRIGATE FUNCTION ---------------------------------------------------------
-- MAX() ----------- find max salary
Select MAX(Salary) from employee;
-- MIN() ----------- find min salary
Select MIN(Salary) from employee;
-- AVG() ----------- find avg salary
Select AVG(Salary) from employee;

-- COUNT * -returns total no of rows in a table -------------------------------
select count(*) from employee;
-- Q1. count number of employees working in IT department
select count(*) as Employees_In_IT from employee where department="IT";
-- if we mention column name, it will return not null values only
select count(city) from employee;
-- DISTINCT - counts only unique value ----------
select DISTINCT department from employee;
-- LIMIT - only shows rows upto limit value -------
select * from employee limit 2;
-- LIMIT_SKIP,SHOW - it will skip upto first value and then show upto 3 value --
select * from employee limit 2,3;

-- GROUP BY ---------------------------------------
-- Q1. count total employee according to their Department
select department, count(*) as Total_Employees from employee GROUP BY department;
-- HAVING - used for groups
-- Q. show department wise average salary having average salary 60000
select Department, AVG(salary) as Avg_sal from employee group by Department having Avg_sal>60000;

-- --------------------------------------------------------------------------------------------------
-- SUBQUERY
-- Q1. Display employees earning salary more than employee 104
select * from employee where salary> (select salary from employee where emp_id=104);

-- -------------------------------------------------------------------------------------------------------------------------------------
-- NOT NULL - restricts a column from having a Null value
create table student(s_id int NOT NULL, Name varchar(60), Age int);
insert into student values(1,"Amit",26);
insert into student values(null,"Sahi;",26); -- gives error because of null value
-- ---------------------------------------------------------------------------------
-- UNIQUE - a field or column
create table student1(s_id int NOT NULL UNIQUE, Name varchar(60), Age int);
insert into student1 values(1,"Amit",26);
insert into student1 values(1,"Amit",26); -- gives error because of duplicate value
-- ---------------------------------------------------------------------------------
-- CHECK - 
create table student2(s_id int NOT NULL CHECK(s_id>0), Name varchar(60) NOT nULL, Age int);
insert into student2 values(1, "Amit", 26);
-- ---------------------------------------------------------------------------------
-- DEFAULT - used to provide default value to a column
create table student3(s_id int NOT NULL CHECK(s_id>0), Name varchar(60) NOT NULL, Age int, city varchar(20) defalut 'Kolkata';
insert into student3  values(1, "Amit", 26, "Mumbai");
select * from student3;
insert into student3 (s_id, name, age) values(2,"Amrita",26); -- it will by default set city to kolkata
-- PRIMARY KEY - uniquely identifies each record in databse



-- Practice Question set ------------------------
-- Q1. Display last name and salary of all the employees earning more than 15000.
Select last_name, Salary from employee where salary>15000;
-- Q2. Display last name and salary of all the employees whose salary is in the range 15000 and 25000
Select last_name, Salary from employee where salary between 25000 AND 15000;
-- Q3. Display last name, Emp_ID and hire_date of all the employees who has joined in 2021
Select last_name, emp_id, hire_date from employee where hire_date like'2021%';
-- using YEAR function 
SELECT last_name, emp_id, hire_date FROM Employee WHERE YEAR(hire_date) = 2021;
-- Q4. Display last name of all the employees where the first letter of the last name is 's'.
select last_name from employee where last_name like's%';
-- Q5. Display first name of all employees whose last names contain 'a' and 'h';
SELECT f_name FROM Employee WHERE l_name LIKE '%a%' AND l_name LIKE '%h%';
-- Q6. Show top 3 Highest salary
select * from employee order by salary desc limit 3;
-- Q7. display employees in alphabetical orders as their first names
select * from employee order by first_name asc;
-- Q8. arrange first name in ascending order and then arrange salary in descending order
select * from employee order by first_name asc, salary desc;
-- Q9. Find the total salary paid by each department
select department, sum(salary) as Total_Salary from employee group by department;
-- Q10. Find the highest salary paid by each department
select department, MAX(salary) as Total_Salary from employee group by department;
-- Q11. Show department wise salary in descending order
select department, AVG(salary) as Avg_sal from employee group by department
														order by Avg_sal desc;
-- Q12. display the departments having more than 2 employess
select department, count(*) as employee_count from employee group by department having employee_count > 2;
-- Q13. Find the department with the highest average salary
select department, avg(salary) as average_salary from employee group by department order by average_salary desc limit 1;
-- Sub-Query questions
-- Q14. Find the records of employee whose salary is greater than average salary
Select * from employee where salary > (select avg(salary) from employee);
-- Q15. find the records of the employee whose salary is the lowest salary in the table.
select * from employee where salary = (select min(salary) from employee);
-- Q16. Find the records of the employee earning less than employee ID 101.
select * from employee where salary < (select salary from employee where emp_id = 101);
-- Q17. Find the records of the employee earning same salary as Emp_id 104.
select * from employee where salary = (select salary from employee where emp_id = 104);
-- Q18. Find the employees in department having someone from "Kolkata".
-- Q19.employee earning second highest salary
select max(salary) as second_largest_salary from employee where salary < (select max(salary) from employee);