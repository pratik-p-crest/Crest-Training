-- Types of operator

-- 1 COMPARISION, 2. LOGICAL, 3. ARITHMETIC

-- using WHERE clause
-- syntax :-
/*
SELECT 	
	coloumn list
FROM table name
WHERE
	conditions
*/

-- AND | OR opertors

--filtering rows based on text value
-- using text as criteria in WHERE clause , 
-- the ṭext value must be surrounded by single inverted comma('')

SELECT * FROM movies;

SELECT * FROM movies
WHERE
	movie_lang = 'English';

SELECT * FROM movies
WHERE
	movie_lang = 'Japanese';


-- using multiple conditions
-- AND & OR operators with two seperate fields

SELECT * FROM movies
WHERE
	movie_lang = 'English' AND age_certificate = '18';

-- OR operator
SELECT * FROM movies 
WHERE 
	movie_lang = 'English' OR movie_lang = 'Chinese'
ORDER BY movie_lang;

-- AND operator
SELECT * FROM movies 
WHERE 
	movie_lang = 'English' AND director_id = 8

-- AND & OR operator
SELECT * FROM movies 
WHERE 
	movie_lang = 'English' 
	OR movie_lang = 'Chinese'
	AND age_certificate = '15'
ORDER BY movie_lang;
-- here order matters

SELECT * FROM movies 
WHERE 
	movie_lang = 'English' 
	AND age_certificate = '15'
	OR movie_lang = 'Chinese'
ORDER BY movie_lang;

-- correct way
SELECT * FROM movies 
WHERE 
	(movie_lang = 'English' OR movie_lang = 'Chinese')
	AND age_certificate = '12'
ORDER BY movie_lang;


-- can we use WHERE befor FROM 	
SELECT *
FROM movies
WHERE
	movie_lang = 'English';


SELECT *
WHERE
	movie_lang = 'English'; -- can not use tis syntax
FROM movies

--can we use WHERE after ORDER BY
SELECT *
FROM movies
WHERE 
	age_certificate = '15'
ORDER BY movie_lang;


SELECT *
FROM movies
ORDER BY movie_lang
WHERE 
	age_certificate = '15'; -- can not use this also


-- order of execution with AND & OR operator
-- AND operator is processed first and then after OR 
-- AND works as 'multiplications' and OR as 'addition'

SELECT * FROM actors;

-- can we use coloumn aliases with WHERE.
SELECT 	
	first_name,
	last_name as surname
FROM actors
WHERE surname = 'Allen';  -- can not use aliases


-- how SQL execute WHERE 
-- after the FROM clause
-- before the SELECT clause

-- FROM | WHERE | SELECT | ORDER BY

SELECT *
FROM movies
WHERE
	movie_lang = 'English'
ORDER BY 
	movie_length DESC; 