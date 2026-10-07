use anp_d6155;
select * from employee;
-- inserting value in dataset
insert into employee values (113,"Rohit","saha","Male","HR","2022-11-01","Kolkata","7898765456");

-- RANK --------------------------------------------------------------------------------
-- Q1. Rank salary wise
select first_name, salary, Rank() over (order by salary desc) as sal_rank from employee;

-- PARTITION ---------------------------------------------------------------------------
-- Q1. Department wise salary rank
select first_name, Department, salary, Rank() over (Partition by Department
			order by salary desc) as dept_rank from employee;
		
select *, row_number() over(order by salary desc) as Row_no from employee;

-- DENSE RANKING (after repetative ranks, it will continue to next rank----
select First_Name, salary, dense_rank() over (order by salary desc) as sal_rank from employee;

-- LAG ------------------------------------
-- Q1. shows the Pre ranked salary (previous ranked salary) -----------------------------------------------------------------
select First_Name, salary, lag(salary) over (order by salary) as Pre_salary from employee;
-- Q2. Difference in salaries by rank --------------------------------------------------------
select First_Name, salary, salary-Lag(salary) over (order by salary) as Salary_diff from employee;

-- LEAD ---------------------------
-- Q1. shows the next ranked salary  (next salary)
select First_Name, salary, lead(salary) over (order by salary) as next_salary from employee;
-- Q2. first arrange descending order, then 1st rank will be highest salary
select First_Name, Department, salary, first_value(salary) over (partition by department order by salary desc) as high_sal from employee;
-- Q2. first arrange ascending order, then 1st rank will be lowest salary
select First_Name, Department, salary, first_value(salary) over (partition by department order by salary) as lowest_sal from employee;


