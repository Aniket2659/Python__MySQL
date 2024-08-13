create database trigger_databases;
use trigger_databases;


CREATE TABLE employees(  
    name varchar(45) NOT NULL,    
    occupation varchar(35) NOT NULL,    
    working_date date,  
    working_hours varchar(10)  
);  
INSERT INTO employees VALUES    
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  

select * from employees;

INSERT INTO employees VALUES    
('Alexander', 'Actor', '2020-10-012', -13); 

-- before insert 

DELIMITER $$
create trigger before_insert_employee
before insert on employees for each row
begin
IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;  
END IF;  
END $$
DELIMITER ;

INSERT INTO employees VALUES    
('Alexander', 'Actor', '2020-10-012', -13); 












 