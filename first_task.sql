show databases;
CREATE DATABASE IF NOT EXISTS bank_data;
USE bank_data;
CREATE TABLE IF NOT EXISTS bank_detail(
age int,
job varchar(50),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int,
housing varchar(30),
loan varchar(30),
contact varchar(30),
`day` int,
`month` varchar(30),
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30)
);

SELECT * FROM bank_detail;
INSERT INTO bank_detail VALUES (58,"management","married","tertiary","no",2143,"yes","no","unknown",5,"may",261,1,-1,0,"unknown","no");
INSERT INTO bank_detail VALUES (44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no");
INSERT INTO bank_detail VALUES
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(57,"services","married","secondary","no",162,"yes","no","unknown",5,"may",174,1,-1,0,"unknown","no"),
(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",0,"yes","no","unknown",5,"may",54,1,-1,0,"unknown","no"),
(28,"blue-collar","married","secondary","no",723,"yes","yes","unknown",5,"may",262,1,-1,0,"unknown","no"),
(56,"management","married","tertiary","no",779,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(32,"blue-collar","single","primary","no",23,"yes","yes","unknown",5,"may",160,1,-1,0,"unknown","no"),
(25,"services","married","secondary","no",50,"yes","no","unknown",5,"may",342,1,-1,0,"unknown","no"),
(40,"retired","married","primary","no",0,"yes","yes","unknown",5,"may",181,1,-1,0,"unknown","no"),
(44,"admin.","married","secondary","no",-372,"yes","no","unknown",5,"may",172,1,-1,0,"unknown","no"),
(39,"management","single","tertiary","no",255,"yes","no","unknown",5,"may",296,1,-1,0,"unknown","no"),
(52,"entrepreneur","married","secondary","no",113,"yes","yes","unknown",5,"may",127,1,-1,0,"unknown","no"),
(46,"management","single","secondary","no",-246,"yes","no","unknown",5,"may",255,2,-1,0,"unknown","no"),
(36,"technician","single","secondary","no",265,"yes","yes","unknown",5,"may",348,1,-1,0,"unknown","no"),
(57,"technician","married","secondary","no",839,"no","yes","unknown",5,"may",225,1,-1,0,"unknown","no"),
(49,"management","married","tertiary","no",378,"yes","no","unknown",5,"may",230,1,-1,0,"unknown","no"),
(60,"admin.","married","secondary","no",39,"yes","yes","unknown",5,"may",208,1,-1,0,"unknown","no"),
(59,"blue-collar","married","secondary","no",0,"yes","no","unknown",5,"may",226,1,-1,0,"unknown","no"),
(51,"management","married","tertiary","no",10635,"yes","no","unknown",5,"may",336,1,-1,0,"unknown","no"),
(57,"technician","divorced","secondary","no",63,"yes","no","unknown",5,"may",242,1,-1,0,"unknown","no"),
(25,"blue-collar","married","secondary","no",-7,"yes","no","unknown",5,"may",365,1,-1,0,"unknown","no");

SELECT count(*) FROM bank_detail;
SELECT age,loan, job from bank_detail;
SELECT `default` FROM bank_detail;

-- limited data show
SELECT * FROM bank_detail LIMIT 5;

SELECT * FROM bank_detail WHERE age = 33;

SELECT * FROM bank_detail WHERE age>= 60;

-- Record for age 60 and retired
SELECT * FROM bank_detail WHERE age =60 AND job ='retired';

SELECT * FROM bank_detail WHERE education="unknown" OR marital= "single";
SELECT * FROM bank_detail WHERE (education="unknown" OR marital= "single") AND balance<500;

-- find how many job are avuilable in record
SELECT DISTINCT job FROM bank_detail;

-- Arrange the data(acsending and desending)
SELECT * FROM bank_detail ORDER BY age;

-- Desending order
SELECT * FROM bank_detail ORDER BY age desc;

-- WITH THIS DATA try to find out sum,avg of balance 
SELECT AVG(balance) FROM bank_detail;

-- minimum balance
SELECT * FROM bank_detail order by balance limit 1;
SELECT min(balance) FROM bank_detail;
SELECT * FROM bank_detail WHERE balance in (SELECT min(balance) FROM bank_detail);

-- max value
SELECT max(balance) FROM bank_detail;

SELECT * FROM bank_detail WHERE balance in (SELECT max(balance) FROM bank_detail);
SELECT * FROM bank_detail WHERE loan ='yes';

-- job role is admin
SELECT * FROM bank_detail WHERE job = 'admin.'

-- what is avg balancebank_view
SELECT avg(balance) FROM bank_detail WHERE job ='admin.';

-- not having house
SELECT * FROM bank_detail WHERE housing= 'no';
SELECT balance, housing FROM bank_detail WHERE housing= 'no';

SELECT * FROM bank_detail;

-- Function writing
DELIMITER && 
CREATE procedure neha()
BEGIN
SELECT * FROM bank_detail;
END &&

call neha();

DELIMITER && 
CREATE procedure balnace_max()
BEGIN
SELECT * FROM bank_detail WHERE balance in (SELECT max(balance) FROM bank_detail);
END &&

CALL balnace_max();

DELIMITER && 
CREATE procedure job_role(IN neha varchar(30))
BEGIN
SELECT * FROM bank_detail WHERE job = neha;
END &&
call job_role('technician');


DELIMITER && 
CREATE procedure edu_mar(IN edu varchar(30), IN mar varchar(30))
BEGIN
SELECT * FROM bank_detail WHERE education=edu OR marital= mar;
END &&
call edu_mar('tertiary','married');

-- Views
CREATE VIEW bank_view as select age, job, marital, balance,education from bank_detail;
