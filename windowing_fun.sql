Create database dummy;
use dummy;
create table student(
student_id int,
student_btach varchar(30),
student_name varchar(30),
student_stream varchar(30),
student_marks int,
student_mail varchar(30)
);
insert into student values(101,'DL','neha','IT',83,'neha@gmail.com'),
(102,'ML','abc','CS',78,'abc@gmail.com'),
(103,'DL','prashant','IT',45,'prashant@gmail.com'),
(104,'ML','priyanshu','CS',78,'priyanshu@gmail.com'),
(105,'ML','sachin','CS',77,'sachin@gmail.com'),
(106,'NLP','rohit','ME',28,'rohit@gmail.com'),(107,'DL','sneha','CS',89,'sneha@gmail.com'),
(108,'NLP','ritika','IT',67,'ritika@gmail.com'),
(109,'NLP','harsh','IT',40,'harsh@gmail.com'),
(110,'DL','lakshy','ME',67,'lakshy@gmail.com'),
(111,'DL','raju','IT',78,'raju@gmail.com'),
(112,'DL','gayatri','ME',90,'gayatri@gmail.com'),
(113,'DSA','gouri','CS',56,'gouri@gmail.com'),
(114,'DSA','rohan','IT',58,'rohan@gmail.com'),
(115,'DSA','vishal','CO',52,'vishal@gmail.com'),
(116,'DL','priya','CO',82,'priya@gmail.com'),
(117,'DL','riya','IT',36,'riya@gmail.com')
;
select * from student;
DELETE FROM student
WHERE student_id= 101 limit 1;
DROP table student;

-- aggregation base windowing function
-- Mean, avg, sum, 
SELECT student_btach, sum(student_marks) from student group by student_btach;
-- min marks
SELECT student_btach, min(student_marks) from student group by student_btach;

-- avg marks
SELECT student_btach, avg(student_marks) from student group by student_btach;

-- count for batch
select count(student_btach) from student;

-- Number of studnt in batch
select student_btach,count(*) from student group by student_btach;

-- find the ranking of each batch student
-- limit 2,1 where 2 for record and onward and 1 for how much datawant
select * from student where student_btach ='DL' order by student_marks desc limit 2,1; -- issue when repeted data is there
select * from student where student_btach ='DL' order by student_marks desc;

-- windowing function
-- rank den rank
select * from student;
select student_id, student_btach, student_stream, student_marks ,
row_number() over(order by student_marks) as 'row_number' from student;

-- every couse have diferent rank according to marks
select student_id, student_btach, student_stream, student_marks ,
row_number() over(partition by student_btach order by student_marks) as 'row_number' from student;

-- from every batch give me topper name 
SELECT *
FROM (
    SELECT 
        student_id, 
        student_btach, 
        student_stream, 
        student_marks, 
        ROW_NUMBER() OVER(PARTITION BY student_btach ORDER BY student_marks DESC) AS row_num
    FROM student
) AS test
WHERE row_num = 1;

-- if there is repeated then use rank
SELECT *
FROM (
    SELECT 
        student_id, 
        student_btach, 
        student_stream, 
        student_marks, 
        ROW_NUMBER() OVER(PARTITION BY student_btach ORDER BY student_marks DESC) AS row_num,
        rank() over(order by student_marks desc ) as 'row_rank'
    FROM student
) AS test
WHERE row_num = 1;

-- if there is reapeted then rank will different
select student_id, student_btach, student_stream, student_marks ,
row_number() over(order by student_marks desc) as 'row_number', 
rank() over(order by student_marks desc ) as 'row_rank' from student;

-- dense_rank
select student_id, student_btach, student_stream, student_marks ,
row_number() over(order by student_marks desc) as 'row_number', 
rank() over(order by student_marks desc ) as 'row_rank' ,
dense_rank() over(order by student_marks desc ) as 'row_dense_rank'
from student;

-- name find
SELECT *
FROM (
    SELECT 
        student_id, 
        student_btach, 
        student_stream, 
        student_marks, 
        ROW_NUMBER() OVER(PARTITION BY student_btach ORDER BY student_marks DESC) AS row_num,
        dense_rank() over(order by student_marks desc ) as 'row_rank'
    FROM student
) AS test
WHERE row_num = 1;