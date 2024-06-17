create database operation;
use operation;

-- join, union and indexing operation
CREATE TABLE course4 (
    course_name VARCHAR(50),
    course_id INT, 
    course_des VARCHAR(60),
    course_tag VARCHAR(60));
    
CREATE TABLE student (
student_id INT, 
    student_name VARCHAR(50),
student_enroll VARCHAR(60),
    student_course_id VARCHAR(60));
    
INSERT INTO course4 (course_name, course_id, course_des, course_tag) VALUES
('Mathematics', 101, 'Basic Mathematics course', 'MATH101'),
('Physics', 102, 'Introductory Physics course', 'PHYS102'),
('Chemistry', 103, 'Fundamental Chemistry course', 'CHEM103'),
('Biology', 104, 'General Biology course', 'BIO104'),
('Computer Science', 105, 'Introduction to Computer Science', 'CS105'),
('English Literature', 106, 'Study of English Literature', 'ENG106'),
('History', 107, 'World History Overview', 'HIST107'),
('Art', 108, 'Fundamentals of Art', 'ART108'),
('Deep Learning', 109, 'Course on Deep Learning techniques', 'DL109'),
('Natural Language Processing', 110, 'Course on NLP techniques and applications', 'NLP110'),
('Machine Learning', 111, 'Course on Machine Learning algorithms and applications', 'ML111');

-- Insert data into the student table
INSERT INTO student (student_id, student_name, student_enroll, student_course_id) VALUES
(1, 'Alice', '2024-01-01', '101'),
(2, 'Bob', '2024-01-01', '102'),
(3, 'Charlie', '2024-01-01', '103'),
(4, 'David', '2024-01-01', '104'),
(5, 'Eve', '2024-01-02', '105'),
(6, 'Frank', '2024-01-02', '106'),
(7, 'Grace', '2024-01-02', '107'),
(8, 'Heidi', '2024-01-02', '108'),
(9, 'Ivan', '2024-01-03', '101'),
(10, 'Judy', '2024-01-03', '102'),
(11, 'Mallory', '2024-01-03', '103'),
(12, 'Niaj', '2024-01-03', '104'),
(13, 'Olivia', '2024-01-04', '105'),
(14, 'Peggy', '2024-01-04', '106'),
(15, 'Sybil', '2024-01-04', '107'),
(16, 'Trent', '2024-01-04', '108'),
(17, 'Uma', '2024-01-05', '109'),
(18, 'Victor', '2024-01-05', '110'),
(19, 'Wendy', '2024-01-05', '111'),
(20, 'Xander', '2024-01-05', '109');

select * from course4;
INSERT INTO course4 (course_name, course_id, course_des, course_tag) VALUES
('DL', 120, 'Basic Mathematics course', 'MATH101');
INSERT INTO student (student_id, student_name, student_enroll, student_course_id) VALUES
(21, 'Neha', '2024-01-01', '1');

-- join operation
select c.course_id,c.course_name , c.course_des, s.student_id, s.student_name, s.student_course_id from course4 c 
inner join student s on c.course_id = s.student_course_id;

-- left join operation
select c.course_id,c.course_name , c.course_des, s.student_id, s.student_name, s.student_course_id from course4 c 
left join student s on c.course_id = s.student_course_id;

-- All course which is not enroll by anyone
select c.course_id,c.course_name , c.course_des, s.student_id, s.student_name, s.student_course_id from course4 c 
left join student s on c.course_id = s.student_course_id where s.student_id is null;

-- right join operation
select c.course_id,c.course_name , c.course_des, s.student_id, s.student_name, s.student_course_id from course4 c 
right join student s on c.course_id = s.student_course_id;

-- student who not buy course
select c.course_id,c.course_name , c.course_des, s.student_id, s.student_name, s.student_course_id from course4 c 
right join student s on c.course_id = s.student_course_id where c.course_id is null;

-- cross join operation
-- use cross join 
-- all combination 
-- complete data mapping 
select c.course_id,c.course_name , c.course_des, s.student_id, s.student_name, s.student_course_id from course4 c 
cross join student s on c.course_id = s.student_course_id;

-- without condititon
select c.course_id,c.course_name , c.course_des, s.student_id, s.student_name, s.student_course_id from course4 c 
cross join student s ;

-- indexing 
show index from course;
CREATE TABLE course (
    course_name VARCHAR(50),
    course_id INT, 
    course_des VARCHAR(60),
    course_tag VARCHAR(60),
    index(course_id)
    );
INSERT INTO course (course_name, course_id, course_des, course_tag) VALUES
('Mathematics', 101, 'Basic Mathematics course', 'MATH101'),
('Physics', 102, 'Introductory Physics course', 'PHYS102'),
('Chemistry', 103, 'Fundamental Chemistry course', 'CHEM103'),
('Biology', 104, 'General Biology course', 'BIO104'),
('Computer Science', 105, 'Introduction to Computer Science', 'CS105'),
('English Literature', 106, 'Study of English Literature', 'ENG106'),
('History', 107, 'World History Overview', 'HIST107'),
('Art', 108, 'Fundamentals of Art', 'ART108'),
('Deep Learning', 109, 'Course on Deep Learning techniques', 'DL109'),
('Natural Language Processing', 110, 'Course on NLP techniques and applications', 'NLP110'),
('Machine Learning', 111, 'Course on Machine Learning algorithms and applications', 'ML111');

show index from course1;

CREATE TABLE course1 (
    course_name VARCHAR(50),
    course_id INT, 
    course_des VARCHAR(60),
    course_tag VARCHAR(60),
    index(course_id,course_name)
    );
    
explain select * from course where course_id = '109'
ANALYZE TABLE course;

DESCRIBE course;

-- union operation
-- Perform a UNION operation
SELECT course_name AS name, course_id AS id
FROM course4
UNION
SELECT student_name AS name, student_id AS id
FROM student;


SELECT course_name AS name, course_id AS id
FROM course4
UNION all
SELECT student_name AS name, student_id AS id
FROM student;

-- CTE (common table expression)
with sample_student as(select * from course4 where course_id in (102,103,106))
select * from sample_student where course_name ='English Literature';

-- recursive cte(calling cte from cte like recursive = call again and again)
with recursive cte(n) as
(select 1 union all select n+1 from cte where n<5)
select * from cte;

with recursive neha as(
select 1 as n, 1 as p , 1 as q
union all
select n+1 , q+2, p+3 from neha where n<10
)
select * from neha;
