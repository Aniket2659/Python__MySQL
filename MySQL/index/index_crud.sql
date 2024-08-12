use aniket;
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);
INSERT INTO employees (first_name, last_name, department, salary, hire_date)
VALUES
('John', 'Doe', 'Engineering', 60000, '2022-01-15'),
('Jane', 'Smith', 'Marketing', 55000, '2021-06-12'),
('Alice', 'Johnson', 'Engineering', 75000, '2020-09-05'),
('Bob', 'Brown', 'Sales', 50000, '2019-11-20'),
('Charlie', 'Davis', 'Engineering', 65000, '2023-03-10');

select * from employees;

create index idx_dept on employees(department);
select * from employees
where department='Engineering';

EXPLAIN SELECT * FROM employees WHERE department = 'Engineering';

drop index idx_dept on employees;
