use apexon;
create table importing(
email varchar(500),
Identifier int,
First_name varchar(500),
Last_name varchar(500))
;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/email_column_rearranged.csv'
INTO TABLE importing
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from importing;
