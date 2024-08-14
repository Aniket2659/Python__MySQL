create database WINDOW_FUN;
USE WINDOW_FUN;

create table employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);


SELECT * from employee;

select dept_name ,max(salary)
from employee
group by dept_name;

-- window function

select * ,
max(SALARY) over(partition by DEPT_NAME ) as max_salary_dept
from employee;

-- row_number() window function

select *,
row_number() over(partition by dept_name order by emp_ID) as sr
from employee;

select * from (
	select *,
	row_number() over(partition by dept_name order by emp_ID) as sr
	from employee) as x
where x.sr<3;

-- rank() window function

select * ,
rank() over(partition by dept_name order by salary desc) as rnk
from employee; 

select * from (
	select * ,
	rank() over(partition by dept_name order by salary desc) as rnk
	from employee) x
where x.rnk<4;


-- dense_rank() function

select * ,
dense_rank() over(partition by dept_name order by salary desc) dense_rnk
from employee;

-- lag() and lead()

select * ,
lag(salary) over (partition by dept_name order by salary desc) lag_c,
lead(salary) over (partition by dept_name order by salary desc) lead_c
from employee;

-- some questions related to rank function
-- 1 Question: Rank employees within each department based on their salary in descending order.

select *,
rank() over(partition by dept_name order by salary desc) as rank_salary
from employee;

-- 2 Question: Calculate the average salary for each department.
select *,
avg(salary) over(partition by dept_name) avg_salary_dept
from employee;

-- 3 Question: Determine the highest and lowest salary within each department.

-- Query for highest salary in each departmenty

select emp_id,emp_name,dept_name,salary from (
	select * ,
	row_number() over(partition by dept_name order by salary) as min_max,
    row_number() over (partition by dept_name order by salary desc) as max_min
	from employee) as x
where x.min_max=1  or x.max_min=1;

-- 4 Question: Compare each employee's salary with the salary of the previous employee in their department.

select * ,
lag(salary) over (partition by dept_name order by salary desc) lag_c
from employee;

-- 5 Get the Total Number of Employees in Each Department:

select dept_name,
count(*) over(partition by dept_name) as count_no
from employee;

-- 6 Find the Top 3 Salaries within Each Department:

select * from(
    select  * ,
	rank() over(partition by dept_name order by salary desc) as rnk
	from employee) x
where x.rnk<4;
