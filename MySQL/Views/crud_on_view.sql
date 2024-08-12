use aniket;
-- Create StudentDetails table
CREATE TABLE StudentDetails (
    S_ID INT PRIMARY KEY,
    NAME VARCHAR(255),
    ADDRESS VARCHAR(255)
);

INSERT INTO StudentDetails (S_ID, NAME, ADDRESS)
VALUES
    (1, 'Harsh', 'Kolkata'),
    (2, 'Ashish', 'Durgapur'),
    (3, 'Pratik', 'Delhi'),
    (4, 'Dhanraj', 'Bihar'),
    (5, 'Ram', 'Rajasthan');

-- Create StudentMarks table
CREATE TABLE StudentMarks (
    ID INT PRIMARY KEY,
    NAME VARCHAR(255),
    Marks INT,
    Age INT
);

INSERT INTO StudentMarks (ID, NAME, Marks, Age)
VALUES
    (1, 'Harsh', 90, 19),
    (2, 'Suresh', 50, 20),
    (3, 'Pratik', 80, 19),
    (4, 'Dhanraj', 95, 21),
    (5, 'Ram', 85, 18);

select * from StudentDetails;
select * from StudentMarks;

-- create view from single table

CREATE  VIEW MARKS as
SELECT NAME, Marks
FROM StudentMarks;

select * from MARKS;


-- create view from multiple tables
create view complex_view as
select StudentDetails.ADDRESS, StudentDetails.NAME, StudentMarks.Marks
from StudentDetails, StudentMarks
where StudentDetails.S_ID=StudentMarks.ID;

select * from complex_view;

-- delete views

drop view complex_view;

-- update view
update complex_view
set name='aniket'
where Marks=90;

select * from complex_view;




 


