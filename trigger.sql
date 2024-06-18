-- Create trigger 
create database trig;

use trig;
CREATE TABLE course (
    course_id INT, 
    course_name VARCHAR(50),
    course_des VARCHAR(60),
    course_mentor VARCHAR(60),
    course_price int,
    course_discount int,
    create_date date
    );
    
create table course_update(
course_mentor_update varchar(50),
course_price_update int,
course_discount_update int
);

-- tigger
delimiter $$
create trigger course_before_insert
before insert 
on course 
for each row
begin 
    set new.create_date = sysdate();
end;
$$
delimiter ;

INSERT INTO course (course_id, course_name, course_des, course_mentor, course_price, course_discount) VALUES
(2, 'mL', 'Basic Mathematics Course', 'John Doe', 400, 20);
-- it will create date and 

select * from course;

-- for user
CREATE TABLE course1 (
    course_id INT, 
    course_name VARCHAR(50),
    course_des VARCHAR(60),
    course_mentor VARCHAR(60),
    course_price int,
    course_discount int,
    create_date date,
    user_val varchar(60)
    );
    
-- tigger
delimiter $$
CREATE TRIGGER course1_before_insert
BEFORE INSERT 
ON course1 
FOR EACH ROW
BEGIN 
    SET NEW.create_date = SYSDATE();
    SET NEW.user_val = USER();
END;
$$
delimiter ;

select * from course1;

select user();

INSERT INTO course1 (course_id, course_name, course_des, course_mentor, course_price, course_discount) VALUES
(2, 'mL', 'Basic Mathematics Course', 'John Doe', 400, 20);

select * from course1;

-- checkpoint can be apply 
create table test1(
c1 varchar(50),
c2 date,
c3 int);


create table test2(
c1 varchar(50),
c2 date,
c3 int );


create table test3(
c1 varchar(50),
c2 date,
c3 int );

delimiter //
create trigger to_update_others
before insert on test1 for each row 
begin
	insert into  test2 values("xyz",sysdate(),23354);
	insert into  test3 values("xyz",sysdate(),23354);
end; //

insert into test1 values ("abc",sysdate(),234234);
select * from test1;
select * from test2;
select * from test3;
-- value are updated in one test1 it will update in all table test2, and test3

use operation;
select * from course;

-- case
-- highlight one batch
SELECT *,
    CASE 
        WHEN course_name = 'Machine Learning' THEN 'This is your batch'
        ELSE 'This is not your batch'
    END AS statement
FROM course;

SELECT *,
    CASE 
        WHEN LENGTH(course_name) = 7 THEN 'Length 7'
        ELSE 'No length'
    END AS statement
FROM course;

update course set course_name = case
when course_name = 'Deep Learning' then 'DL'
end;

UPDATE course
SET course_name = CASE
    WHEN course_name = 'Deep Learning' THEN 'DL'
    ELSE course_name  -- Keep the original name for rows that don't match
END
WHERE course_name = 'Deep Learning';

