use and_d6155;
select * from employee;

create view emp_details as select First_Name, Last_name, Department from employee;
select * from emp_details;

create view hr_names as select First_Name, Last_Name from employee where Department = "HR";
select * from hr_names;