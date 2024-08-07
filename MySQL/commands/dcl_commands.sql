show databases;
use bridgelabz;
select * from Employee;
GRANT SELECT, UPDATE ON employees TO 'root'@'localhost';
REVOKE UPDATE ON employees FROM 'root'@'localhost';

