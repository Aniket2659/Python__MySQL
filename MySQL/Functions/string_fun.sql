show databases;
use bridgelabz;
select * from Employee;

 -- ascii() function
select ASCII(name) as first from Employee;

-- concat function
select concat(name,'-->',position) from Employee;

-- substring function
select substring(name,1,8) from Employee;

-- length function
select LENGTH(name) from Employee;

-- upper function
select UPPER(name) from Employee;

-- lower function
select LOWER(name) from Employee;

-- TRIM Function
select TRIM(name) from Employee;

-- replace function
select REPLACE(name,'Aniket','Anu') from Employee;

-- REVERSE FUNCTION
select REVERSE(name) from Employee;

-- right function
SELECT RIGHT(name, 3) FROM employees;

-- left function
SELECT LEFT(name, 5) FROM employees;






