-- logical operators

-- eqaual to                   =
-- greater than                >
-- less than                   <
-- greater than or equal to    >=
-- less than or equal to       <=
-- not equal to                <> or !=


-- movie length is greater than 100
SELECT *
FROM movies
WHERE 
	movie_length > 100
ORDER BY movie_length;


-- movie length is greater than 100 and equal to 100
SELECT *
FROM movies
WHERE 
	movie_length >= 100
ORDER BY movie_length;


-- movie length is less than 100 
SELECT *
FROM movies
WHERE 
	movie_length < 100
ORDER BY movie_length;


-- movie length is less than 100 and equal to 100
SELECT *
FROM movies
WHERE 
	movie_length <= 100
ORDER BY movie_length;


-- while querying dates, 
-- it is important to look how dates are stored
-- with date type it is by default stores in YYYY-MM-DD
SELECT * FROM movies

-- movies whose release date is greater than 2000
SELECT * FROM movies 
WHERE 
	release_date > '2000-12-31'
ORDER BY release_date


-- using text data type
SELECT * FROM movies 
WHERE 
	movie_lang > 'English' --anything other than english 
ORDER BY movie_lang  -- here it is like from 'E to Z' but not 'E' is there


SELECT * FROM movies 
WHERE 
	movie_lang < 'English' --anything other than english 
ORDER BY movie_lang  -- here it is 'A to E' but not 'E'


SELECT * FROM movies 
WHERE 
	movie_lang <> 'English'  --anything other than english 
ORDER BY movie_lang  


SELECT * FROM movies 
WHERE 
	movie_lang != 'English'  --anything other than english 
ORDER BY movie_lang


-- can we use quote when we are using numerical values 	
SELECT * FROM movies
WHERE movie_length > 100

SELECT * FROM movies
WHERE movie_length > '100'  -- it works same for both with or without quote


-- LIMIT clause
SELECT * FROM movies
ORDER BY movie_name
LIMIT 10;

-- top 5 movies by movie length
SELECT * FROM movies
ORDER BY movie_length DESC
LIMIT 5;


--top 5 oldest american directors
SELECT * 
FROM directors
WHERE nationality = 'American'
ORDER BY date_of_birth ASC
LIMIT 5;


-- using OFFSET
-- list 5 films starting from the fourth one ordered by movie_id
SELECT * FROM movies
ORDER BY movies_id
LIMIT 5 OFFSEt 4 -- it will give values from id 5 to 9


-- using FETCH
-- FETCH clause to retrieve a portion of rows returned by a query
-- equal to LIMIT clause
-- should use FETCH

/*
OFFSET start {ROW | ROWS}
FETCH {FIRST | NEXT} {row_count} {ROW | ROWS} ONLY
*/

-- the offset start is an integer that must be Zero or positive. by default it is 0.
-- in case the start is greater than the number of rows in the result set, no rowa are returened

-- get first row
SELECT * FROM movies
FETCH FIRST 1 ROW ONLY


--  top 5 movie based on the length
SELECT * FROM movies
ORDER BY movie_length DESC
FETCH FIRST 5 ROW ONLY

SELECT * FROM movies
ORDER BY movie_length DESC
OFFSET 5
FETCH FIRST 5 ROW ONLY


-- Using IN and NOT IN
-- returns TRUE or FALSE , works like  their names checks whether it is in the list or not

SELECT *  FROM movies
WHERE movie_lang = 'English' OR movie_lang = 'Chinese' OR movie_lang = 'Japanese'
ORDER BY movie_lang

--using IN
SELECT * FROM movies
WHERE 
	movie_lang IN ('English','Chinese','Japanese')
ORDER BY movie_lang


--using BETWEEN and NOT BETWEEN

-- an operator to match a value against a range of values
-- returns TRUE  or FALSE

-- all actors birth between 1991 and 1995
SELECT * FROM actors
WHERE date_of_birth BETWEEN '1991-01-04' AND '1995-12-31'
ORDER BY date_of_birth;



--- LIKE and NOT LIKE pattern matching 
--- Examples 
     --- ' % '-> any number of char
	 --- ' _ ' -> only one single char
	 
SELECT 'hello' LIKE '%llo'  -- true    
SELECT 'hello' LIKE '%e%'  -- true    
SELECT 'hello' LIKE 'he%'  -- true    
SELECT 'hello' LIKE '%ll'   -- false
SELECT 'hello' LIKE '_ello'  -- true 
SELECT 'hello' LIKE '%l_' -- true

--- Queries

---get all actors with starting name with a char a
SELECT first_name FROM actors WHERE first_name LIKE 'A%'  --- case sensetive

---get all actors with name ending with a char a
SELECT first_name FROM actors WHERE first_name LIKE '%a'

---get all actors name with five later name
SELECT * FROM actors WHERE first_name LIKE '_____'

---actors name with 'l' at second place in its name
SELECT * FROM actors WHERE first_name LIKE '_l%'

---for avoiding case sensetive we can use ILIKE 
SELECT * FROM actors WHERE first_name ILIKE 'tim'  --ILIKE IS not case sensititve



--- NULL and NOT NULL 
---find actors name with missing or null birth date
SELECT * FROM actors WHERE date_of_birth IS NULL

---find actors with missing name and missing birth date
SELECT * FROM actors WHERE first_name IS NULL OR date_of_birth IS NULL

---get all movies where domestic value is null
SELECT m2.movie_name , m1.revenues_domestic FROM movies_revenues as m1 
JOIN movies as m2 on m1.movie_id = m2.movie_id
WHERE m1.revenues_domestic IS NULL

---get all movies where either domestic or international revenues is null
SELECT m2.movie_name , m1.revenues_domestic , m1.revenues_international 
FROM movies_revenues as m1 
JOIN movies as m2 on m1.movie_id = m2.movie_id
WHERE m1.revenues_domestic IS NULL OR m1.revenues_international IS NULL

SELECT m2.movie_name , m1.revenues_domestic , m1.revenues_international 
FROM movies_revenues as m1 
JOIN movies as m2 on m1.movie_id = m2.movie_id
WHERE m1.revenues_domestic IS NULL AND m1.revenues_international IS NULL

---using NOT NULL
---movie whoose domestic revenues is not null
SELECT m2.movie_name , m1.revenues_domestic 
FROM movies_revenues as m1 
JOIN movies as m2 on m1.movie_id = m2.movie_id
WHERE m1.revenues_domestic IS NOT NULL