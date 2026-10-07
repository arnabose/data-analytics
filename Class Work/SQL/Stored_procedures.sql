-- STORED PROCEDURES - set of sql statements set inside database and can be executed whenever needed (like functions)
-- delimiter is a symbol used to tell the client where statement ends. -------------
use anp_d6155;

-- 1. create a procedure to show all employee data from table
DELIMITER //
create procedure GetAllEmployee()
begin
select * from employee;
end //
DELIMITER ;

-- 2. Passing value through procedure (HR department)
DELIMITER //
create procedure GetAllEmployeeByDept(in dept varchar(50))
begin
select * from employee where department=dept;
end //
DELIMITER ;

-- 3. Passing two value through procedure (HR and IT department)
DELIMITER //
create procedure GetAllEmployeeByDept1(in dept varchar(50),in dept1 varchar(50))
begin
select * from employee where department in (dept,dept1);
end //
DELIMITER ;

-- 4. Passing two value through procedure (HR and IT department)
DELIMITER //
create procedure GetAllEmployeeByDept1(in dept varchar(50),in dept1 varchar(50))
begin
select * from employee where department in (dept,dept1);
end //
DELIMITER ;

-- 5. Create a procedure which shows dept wise total employee, total salary, avg salary, highest salary, lowest salary
DELIMITER //
create procedure GetDeptWiseSalary()
begin
select department, count(*) as Total_Employee, sum(salary) as Total_Salary, avg(Salary) as Avg_salary, min(salary) as Lowest_Salary, Max(salary) as Highest_Salary from employee group by department;
end //
DELIMITER ;

-- 6. storing value in passed container
DELIMITER //
create procedure GetTotalEmployee(out t int)
begin
select count(*) into t from employee;
end //
DELIMITER ;

-- 7. INOUT operator
DELIMITER //
create procedure GetDeptEmployee(inout var int)
begin
select salary into var from employee where Emp_ID=var;
end //
DELIMITER ;
set @h=101;                   -- setting excernal variable data
call GetDeptEmployee(@h);
select @h;

-- calling procedures (also can be called from other sql tabs
call GetAllEmployee();
call GetAllEmployeeByDept('HR');
call GetAllEmployeeByDept1('HR','IT');
call GetDeptWiseSalary();

-- storing in "@h" container
call GetTotalEmployee(@h);
select @h;