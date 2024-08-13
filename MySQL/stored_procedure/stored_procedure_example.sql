use bridgelabz;
CREATE TABLE student_info (
    stud_id INT PRIMARY KEY,
    stud_code INT,
    stud_name VARCHAR(50),
    subject VARCHAR(50),
    marks INT,
    phone VARCHAR(15)
);
INSERT INTO student_info (stud_id, stud_code, stud_name, subject, marks, phone) VALUES
(1, 101, 'Mark', 'English', 68, '3454569357'),
(2, 102, 'Joseph', 'Physics', 70, '9876543569'),
(3, 103, 'John', 'Maths', 70, '97653269756'),
(4, 104, 'Barack', 'Maths', 90, '87698753256'),
(5, 105, 'Rinky', 'Maths', 85, '67531579757'),
(6, 106, 'Adam', 'Science', 92, '79642256864'),
(7, 107, 'Andrew', 'Science', 83, '56744237579'),
(8, 108, 'Brayan', 'Science', 85, '75234165670'),
(10, 110, 'Alexandar', 'Biology', 67, '2347346438');

select * from student_info;

-- create stored procedure without parameter
DELIMITER &&  
CREATE PROCEDURE get_students ()  
BEGIN  
    SELECT * FROM student_info WHERE marks > 70;  
END &&  
DELIMITER ;  

call get_students();

-- using in parameter

DELIMITER &&  
create procedure in_para(in in_var int)
begin
	select * from student_info where marks>in_var;
end &&
DELIMITER ;

call in_para(90);

-- using out parameter

DELIMITER //
create procedure out_para(OUT out_var int)
begin 
	select max(marks) into out_var from student_info;
end //
DELIMITER ;

call out_para(@m);
select @m;

-- inout parameter

DELIMITER $$
create procedure inout_para(inout inout_var int)
begin
	select Marks into inout_var from student_info where stud_id=inout_var;
end $$
DELIMITER ;

set @m=1;
call inout_para(@m);
select @m;




