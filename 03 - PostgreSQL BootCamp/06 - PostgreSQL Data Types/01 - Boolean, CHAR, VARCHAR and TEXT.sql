-- Datatypes
CREATE TABLE boolean_data(
	id_no SERIAL PRIMARY KEY,
	is_available BOOLEAN NOT NULL
);

INSERT INTO boolean_data (is_available)
VALUES (TRUE),
	   (FALSE),
	   ('true'),
	   ('false'),
	   ('y'),
	   ('n'),
	   ('yes'),
	   ('no'),
	   ('1'),
	   ('0');

SELECT * FROM boolean_data   --- all give boolean output; 


--- check condition on boolean column
SELECT * FROM boolean_data WHERE is_available = TRUE;
SELECT * FROM boolean_data WHERE is_available = 'y';
SELECT * FROM boolean_data WHERE is_available = '0';
SELECT * FROM boolean_data WHERE is_available = 'yes';

SELECT * FROM boolean_data 	

ALTER TABLE boolean_data 
ALTER COLUMN is_available
SET DEFAULT FALSE;


-- Characters data types
---CHARACTER(n) === CHAR(n) , DEFAULT VALUE of len is 1, FIXED LEN
---CHARACTER VARRYING VARCHAR  , NO DEFAULT VALUE, NOT FIXED
---TEXT MAX CAPACITY 1 GB

SELECT CAST('Pratik' AS char(10)) AS "name";
--"Pratik    "  -- here rest of 4 space rest as blank space, waste of space

SELECT 'Pratik'::char(10) AS "name"; 
--"Pratik    " -- still the same result
SELECT 'Pratik'::char AS "name"; 
--"P" only one default value

SELECT 'Pratik' :: varchar(10);
--'Pratik' only get exact number of character

SELECT 'This is a PostgreSQL' :: varchar(10);
--'This is a' only get 10 number of character


--TEXT :     variable length column, any size
-- unlimited length but max upto 1 GB

SELECT 'This handout will help you understand how paragraphs are formed, how to develop stronger paragraphs, and how to completely and clearly express your ideas.' :: text;
-- output: 'This handout will help you understand how paragraphs are formed, how to develop stronger paragraphs, and how to completely and clearly express your ideas.'


CREATE TABLE table_characters(
	col_char CHAR(10),
	col_varchar VARCHAR(10),
	col_text TEXT
);

SELECT * FROM table_characters;

INSERT INTO table_characters(col_char,col_varchar,col_text)
VALUES ('ABC','abc','XYZ'),
		('ABC','abc','XYZ'), 
		('ABC','abc','XYZ');

SELECT * FROM table_characters;