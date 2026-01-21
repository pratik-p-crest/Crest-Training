---- DATE / TIME
--- date time timestamp timestampz interval
---  4    8    

CREATE TABLE table_dates(
	id serial primary key,
	employee_name varchar(100) NOT NULL,
	hire_date DATE NOT NULL,
	add_date DATE DEFAULT CURRENT_DATE
);

SELECT * FROM table_dates;

INSERT INTO table_dates(employee_name,hire_date)
values
	('pratik','2026-01-05'),
	('mistry','2026-01-05'),
	('maitreya','2026-01-05');
SELECT * FROM table_dates;

SELECT NOW(); -- timestamp with time zone


 -- TIME

 CREATE TABLE table_time(
	id serial primary key,
	class_name varchar(10) not null,
	start_time TIME NOT NULL,
	end_time TIME NOT NULL
 );

 SELECT * FROM table_time;

 INSERT INTO table_time (class_name, start_time, end_time)
 VALUES
 	('math','08:00:00','09:00:00'),
 	('chemistry','09:01:00','10:00:00');
 SELECT * FROM table_time;

-- current time
SELECT CURRENT_TIME   -- 11:06:03.593105+05:30


-- current time with precision
SELECT CURRENT_TIME(2) -- 11:07:20.530000+05:30

-- local time
SELECT CURRENT_TIME,LOCALTIME  --11:08:35.832987+05:30, 11:08:35.832987


SELECT  time '10:00' - time '04:00'  --- 06:00:00

-- using interval
interval 'n type'

-- n = nmbers
-- type = second, minute, hours, day, month, year.....

SELECT 
CURRENT_TIME,                                -- 11:14:00.883526+05:30
CURRENT_TIME + interval '2 hours' as result; -- 13:13:31.109868+05:30


---- timestamp & timestamptz 
--------------------------------

CREATE TABLE table_time_tz(
	ts TIMESTAMP,
	tstz TIMESTAMPTZ
);

INSERT INTO table_time_tz(ts,tstz) values
('2020-02-22 10:10:20', '2020-02-22 10:10:20') -- 2020-02-22 10:10:20, 2020-02-22 10:10:20+05:30 

SELECT * FROM table_time_tz;

SHOW TIMEZONE -- Asia/Calcutta;
SET TIMEZONE = "Asia/Calcutta";

SELECT CURRENT_TIMESTAMP -- 2026-01-21 11:33:36.544375+05:30

SELECT TIMEOFDAY(); -- Wed Jan 21 11:31:22.302794 2026 IST
SELECT TIMEZONE('Asia/Singapore','2025-06-30 10:00:00'); -- 2025-06-30 12:30:00


-- UUID 
-----------------
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

SELECT uuid_generate_v1();             -- ot totally unique , last factor is fixed on device and current time stamp
-- "dc015d16-6d22-11f0-9e7d-038d1c094262"

SELECT uuid_generate_v4();               --- totally unique
-- output: "9961322f-270a-48b5-aea0-ffe5a8a8fa2e"


CREATE TABLE uuid(
	product_id UUID DEFAULT uuid_generate_v4(),
	product_name varchar(200) 
);

INSERT INTO uuid(product_name)
VALUES ('ABC')

SELECT * FROM uuid