use aniket;
select * from employees;

SHOW VARIABLES LIKE 'secure_file_priv';

SELECT * 
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Datasets.csv'
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM employees;
