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
	release_date DESC; 


-- sort based on multiple column
SELECT *
FROM movies
ORDER BY
	release_date DESC,
	movie_name ASC;


-- here first movie name will be ordered and the by release date
SELECT *
FROM movies
ORDER BY
	movie_name ASC,
	release_date DESC;


-- order by with alias coloumn name
SELECT 
	first_name,
	last_name AS surname
FROM actors
ORDER BY last_name ;


SELECT 
	first_name,
	last_name AS surname
FROM actors
ORDER BY surname DESC;  -- you can use alias name as well


-- calculate length of the actor name with LENGTH function
SELECT
	first_name,
	LENGTH(first_name) 
FROM actors;

SELECT
	first_name,
	LENGTH(first_name) as len
FROM actors
ORDER BY
	len DESC;


SELECT 5 * 20


-- can use coloumn number to do order by
SELECT 
	first_name,
	last_name
FROM actors
ORDER BY
	1 ASC,
	2 DESC;

-- get unique values
SELECT
	DISTINCT movie_lang
FROM movies
ORDER BY movie_lang;


-- get unique director id
SELECT
	DISTINCT director_id
FROM movies
ORDER BY 1;


-- multiple distinct values
SELECT
	DISTINCT movie_lang, director_id  -- here it works on both coloumn's combination
FROM movies
ORDER BY 1;


-- all unique records from table
SELECT 
	DISTINCT *
FROM movies;