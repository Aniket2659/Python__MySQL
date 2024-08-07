show databases;
use bridgelabz;
select * from Employee;

-- count  functions
select COUNT(*) from Employee;

-- sum function
select SUM(salary) from Employee;


-- average function
select AVG(salary) from Employee;

-- max  function
select MAX(salary) from Employee;

-- MIN function
select MIN(salary) from Employee;

-- GROUP_CONCAT FUNCTION
SELECT GROUP_CONCAT(name) FROM employees;

-- variance function
SELECT VARIANCE(salary) FROM employees;

-- rand function
SELECT RAND();

-- sqrt() function
select SQRT(4);









