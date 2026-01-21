-- Numbers Data types

-- numbers column can hold various data type but not NULL values
-- math operation can be performed
-- two main types of numbers
-- 1. INtEGERS  -> whole numbers +ve and -ve
-- 2. FIXE-POINT, FLOATING=POINT -> two format of whole numbers


-- INTERGERS

-- smallint         2 bytes 
-- integer          4 bytes
-- bigint           8 bytes 

-- Auto increment integer data type : SERIAL
-- smallserial      2 bytes 
-- serial           4 bytes
-- bigserial        8 bytes 


CREATE TABLE table_serial(
	product_id SERIAL,
	product_name VARCHAR(10)
);

SELECT * FROM table_serial;

INSERT INTO table_serial(product_name) values ('pen'),('pencil'),('Sharpner');
SELECT * FROM table_serial;


-- DECIMAL NUMBERS
------------------------------------------------
------------------------------------------------

-- decimal represents whole numbers plus fraction of whole numbers

-- FIXED POINT NUMBERS
------------------------
--NUMERIC(precision, scale)

-- precision     -> max numbers of digts to the left and right of the decimal point
-- scale         -> number of digits allowable on the right of the decimla point

-- numerice(10,2)  --- will return two digits of the right of the decimal points


-- FLOATING NUMBERS
----------------------
-- two types
-- 1. real      allow precision to 6 decimal digits
-- 2. double    alloe precision to 15 decimal digits

--- Fixed Numbers  - size variable 
    --- numeric(10,2) 99999999.99    - fixed point 

--- Floating Numbers  
    --- real               - 4 byte  - floating point  - 6-8 decimal 
	--- double precision   - 8 byte  - floating point  - 15-17  decimal


CREATE TABLE table_numbers(
	col_numeric NUMERIC(20,5),
	real REAL,
	double DOUBLE PRECISION
);
SELECT * FROM table_numbers; 

INSERT INTO table_numbers (col_numeric, real,double)
VALUES 
(.9,.9,.9),
(132.2,1.231567745,13423456671.2315677);


