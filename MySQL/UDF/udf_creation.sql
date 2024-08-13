use aniket;
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

-- User Defined Function

DELIMITER $$
create function udf(s_marks int) returns varchar(205)
deterministic no sql reads sql data
begin
	declare result varchar(250);
	select max(marks) into result from student_info where marks=s_marks;
    
    return result;
end $$
DELIMITER ;
select udf(92);
