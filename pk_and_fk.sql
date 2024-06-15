CREATE DATABASE key_prim;
use key_prim;
CREATE TABLE course(
id int not null,
course_sub varchar(60),
course_status varchar(40),
number_of_enro int,
primary key (id)
);

INSERT INTO course values(1,'ML','active',100);
INSERT INTO course values(2,'DL','active',200);
SELECT * FROM course;

CREATE TABLE student(
student_id int,
course_sub varchar(60),
student_email varchar(60),
student_status varchar(40),
course_id int,
foreign key(course_id) references course(id)
);

-- one pk and related to many values (one to many)  
INSERT INTO student values (101,'ML','test@gmail.com','active',1);
INSERT INTO student values (101,'ML','test@gmail.com','active',1);
INSERT INTO student values (101,'ML','test@gmail.com','active',1);


CREATE TABLE payment(
course_id int,
course_name varchar(60),
student_launch_date varchar(60),
student_status varchar(40),
foreign key(course_id) references course(id)
);
INSERT INTO payment values (1,'ML','7th jun','active');
INSERT INTO payment values (1,'DL','11th jun','active');
INSERT INTO payment values (1,'NLPL','17th jun','active');
