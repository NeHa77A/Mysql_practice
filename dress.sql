CREATE DATABASE dress_data;
USE dress_data;

CREATE TABLE IF NOT EXISTS dress(
Dress_ID VARCHAR(30),
Style VARCHAR(30),	
Price VARCHAR(30),	
Rating VARCHAR(30),
Size VARCHAR(30),	
Season VARCHAR(30),
NeckLine VARCHAR(30),	
SleeveLength VARCHAR(30),	
Material VARCHAR(30),
FabricType VARCHAR(30),
Decoration VARCHAR(30),
`Pattern Type` VARCHAR(30),	
Recommendation VARCHAR(30)); 

show columns from dress;
select * from dress;

LOAD DATA LOCAL INFILE "C:/Program Files/MySQL/Dress_data.csv"
INTO TABLE dress
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- csvsql --dialect mysql --snifflimit 100000 Dress_Sales.csv > output_sales.sql

SHOW VARIABLES LIKE 'local_infile';

