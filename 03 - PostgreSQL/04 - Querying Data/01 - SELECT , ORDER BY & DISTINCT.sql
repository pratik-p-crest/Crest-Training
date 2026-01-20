-- select all data from table
select * from movies;
SELECT * FROM movies; 


-- select specific column name in 'SELECT' statement
SELECT 
	first_name FROM actors;

SELECT first_name,last_name FROM actors;


-- make alias for movie_name as "Movie Name"
SELECT 
	movie_name AS "Movie Name",
	movie_lang AS "Language"
FROM
	movies;

-- "AS" keyword is optional
SELECT 
	movie_name  "Movie Name",
	movie_lang  "Language"
FROM
	movies;


-- can not use single quote with "AS"
SELECT 
	movie_name AS 'Movie Name',
	movie_lang AS 'Language'
FROM
	movies;


-- assigning column AIAS to an expression

SELECT first_name,last_name FROM actors;

-- "||" works as addition like string in python
SELECT first_name || last_name FROM actors;


SELECT first_name || ' ' || last_name FROM actors;

-- let's make full name column
SELECT 
	first_name || ' ' || last_name AS "Full Name"
FROM
	actors;

-- get output using expression without using coloumn name
SELECT 2 * 10;



--ORDER BY
-- sort based on single coloumn

SELECT 
	*
FROM movies
ORDER BY
	release_date ASC;


SELECT 
	*
FROM movies
ORDER BY
	release_date;


--in descending order
SELECT 
	*
FROM movies
ORDER BY
	release_date D; 