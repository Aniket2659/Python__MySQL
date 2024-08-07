show databases;
use bridgelabz;
select * from Employee;
START TRANSACTION;
UPDATE employee
SET salary = 60000
WHERE employee_id = 1;

SAVEPOINT salary_update;

UPDATE employee
SET position = 'Senior Developer'
WHERE employee_id = 2;

ROLLBACK TO salary_update;

COMMIT;
select * from Employee;