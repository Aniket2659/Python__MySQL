show databases;
use bridgelabz;
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100),
    salary int,
    hire_date DATE,
    PRIMARY KEY (employee_id)
);
ALTER TABLE Employees
ADD COLUMN email VARCHAR(100);
ALTER TABLE Employees
DROP COLUMN email;
INSERT INTO Employees (name, position, salary, hire_date)
VALUES 
    ('Aniket Babar', 'Software Developer', 85000.00, '2023-01-15'),
    ('prathmesh Sharma', 'Data Analyst', 70000.00, '2022-05-20'),
    ('shantnu Rawde', 'Project Manager', 95000.00, '2021-11-30'),
    ('Akash Shirke', 'Quality Assurance', 65000.00, '2023-03-10'),
    ('Ananya pandey', 'UI/UX Designer', 72000.00, '2022-07-25'),
    ('Ram Lad', 'System Administrator', 80000.00, '2021-09-15'),
    ('Pratiksha Yadav', 'HR Manager', 60000.00, '2022-02-05'),
    ('Rohit Babar', 'Database Administrator', 85000.00, '2023-04-12'),
    ('Aditi Lohar', 'Network Engineer', 78000.00, '2022-10-18'),
    ('Sahil Vichare', 'DevOps Engineer', 88000.00, '2023-06-22');
    
SELECT * FROM Employees;
UPDATE Employees
SET salary = 90000.00
WHERE employee_id = 1;
DELETE FROM Employees WHERE employee_id = 5;
SELECT * FROM Employees;





