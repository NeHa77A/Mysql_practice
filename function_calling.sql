CREATE DATABASE sales;
USE sales;
SELECT * FROM superstore_sales;
SELECT count(*) from superstore_sales;

-- Fucntion creating 
DELIMITER $$
CREATE FUNCTION add_to_col(a INT)
RETURNS INT
DETERMINISTIC 
BEGIN 
    DECLARE b INT;
    SET b = a + 10;
    RETURN b;
END $$
DELIMITER ;

SELECT MAX(sales) from superstore_sales;

SELECT add_to_col(15);
SELECT * FROM superstore_sales;

-- IF WE WANT TO INCERASE THE VALUE TO INCEASE WHEN IT IS DISPLAY
SELECT quantity FROM superstore_sales;
SELECT add_to_col(quantity) from superstore_sales;

-- compare
SELECT quantity,add_to_col(quantity) from superstore_sales;

-- create a fuction where it take profite and discound and give me total profite
DELIMITER $$
CREATE FUNCTION final_profits(profit Int, discount int)
returns int
deterministic 
begin 
declare final_profit int;
set final_profit = profit -discount;
return final_profit;
end $$

SELECT profit,discount ,final_profits(profit,discount) from superstore_sales;

-- real discount
-- (20,6) 20 for decimal and 6 after point(dot)
DELIMITER $$
CREATE FUNCTION final_profit_real(profit DECIMAL(20,6), discount DECIMAL(20,6), sales DECIMAL(20,6))
RETURNS DECIMAL(20,6)
DETERMINISTIC
BEGIN
    DECLARE final_profit DECIMAL(20,6);
    SET final_profit = profit - (sales * discount);
    RETURN final_profit;
END $$
DELIMITER ;

-- function calling
SELECT profit, discount, sales , final_profit_real(profit, discount, sales) from superstore_sales;

DELIMITER $$
CREATE FUNCTION int_to_str(a Int)
RETURNS varchar(30)
DETERMINISTIC 
BEGIN 
    DECLARE b varchar(30);
    set b =a;
    RETURN b;
END $$
DELIMITER ;

-- calling function
SELECT int_to_str(sales) from superstore_sales;

DELIMITER $$
CREATE FUNCTION mark_sale(sales INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE flag_sales VARCHAR(255);
    IF sales < 100 THEN 
        SET flag_sales = 'Super affordable product';
    ELSEIF sales >= 100 AND sales < 300 THEN
        SET flag_sales = 'Affordable product';
    ELSEIF sales >= 300 AND sales < 600 THEN
        SET flag_sales = 'Moderate product';
    ELSE 
        SET flag_sales = 'Expensive product';
    END IF;
    RETURN flag_sales;
END $$
DELIMITER ;

select mark_sale(100);
select sales , mark_sale(sales) from superstore_sales;

CREATE TABLE loop_table(val int);

-- loop 
DELIMITER $$
CREATE PROCEDURE generate_data1()
BEGIN
    DECLARE var INT DEFAULT 10;

    generate_loop: LOOP
        INSERT INTO loop_table VALUES (var);
        SET var = var + 1;
        IF var = 100 THEN
            LEAVE generate_loop;
        END IF;
    END LOOP generate_loop;
END $$
DELIMITER ;


call generate_data1();
select * from loop_table;

DELIMITER $$
CREATE PROCEDURE divide_3()
BEGIN
    DECLARE var INT DEFAULT 10;

    generate_loop: LOOP
        INSERT INTO loop_table VALUES (var);
        
        IF var %3= 0 THEN
        SET var = var +1;
        if var = 100 then 
            LEAVE generate_loop;
        END IF;
        END IF;
    END LOOP generate_loop;
END $$
DELIMITER ;
create table divide(var int);
select * from divide;
call divide_3();