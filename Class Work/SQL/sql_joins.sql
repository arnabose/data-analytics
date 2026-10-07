use anp_d6155;

-- Creating two tables stu1, stu2 ---------------------------------
create table stu1(sid int, sname varchar(20), mobile varchar(15));
create table stu2(stu_id int, course varchar(20), fee double);

-- Inserting Values in both two tables ----------------------------
insert into stu1 values (1, "Ramesh", "7898765434"),
						(2, "Riya", "4567654345"),
                        (3, "Shankar", "9098123454"),
                        (4, "Sahil", "6890987654"),
                        (5, "Vikash", "6589098765");
insert into stu2 values (4, "Java", 6800),
						(5, "Python", 7500),
                        (6, "Java", 6800),
                        (7, "C++", 5000);

-- Viewing table contents ----------------------------------------
select * from stu1;
select * from stu2;

-- INNER JOIN / EQUI Join - Returns the common field present in both table---------------------------------------
select stu1.sid, stu1.sname, stu2.course from stu1 INNER JOIN stu2
		on stu1.sid=stu2.stu_id;
        
-- OUTER JOIN ----------------------------------------------------------------------
-- LEFT OUTER JOIN - returns Left table with common field present in both table will
select stu1.sid, stu1.sname, stu2.course from stu1 LEFT JOIN stu2
		on stu1.sid=stu2.stu_id;
-- RIGHT OUTER JOIN - returns Right table with common field present in both table will
select stu1.sid, stu1.sname, stu2.course from stu1 RIGHT OUTER JOIN stu2
		on stu1.sid=stu2.stu_id;
        
        
        
-- SELF JOIN - A table is joined ith itself - to implement use any join (left/right)
Create table employees ( emp_id INT PRIMARY KEY, ename varchar(50), manager_id INT);

INSERT INTO employees (emp_id, ename, manager_id) VALUES (1, 'A', NULL),
														(2, 'B', 1),
                                                        (3, 'C', 1),
                                                        (4, 'D', 2);
Select e.ename AS Employee, m.ename AS Manager From employees e
	LEFT JOIN employees m
    ON stu1.sid=stu2.stu_id;
                                        
                                        
-- CROSS JOIN ------------------------
CREATE TABLE Colors (color VARCHAR(20));
CREATE TABLE Sizes (size VARCHAR(5));

INSERT INTO Colors (color) VALUES
('Red'),
('Blue');

INSERT INTO Sizes (size) VALUES
('S'),
('M');

SELECT c.color, s.size
FROM Colors c
CROSS JOIN Sizes s; 
 