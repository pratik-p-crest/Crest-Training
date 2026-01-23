-- upper, lower and initcap
-----------------------------------------------------
select upper('pratik patel'); -- PRATIK PATEL

select 
	upper(first_name) as first_name,
	upper(last_name) as last_name
from directors;

select lower('PRATIK PATEL'); -- pratik patel

select initcap('I am groot'); -- make first letter of each word capital

select initcap(first_name || ' ' || last_name) as full_name
from directors 
order by full_name;

-- left and right
----------------------------------------
select left('ABCD', 1); -- left returns first n characters from left
-- here it will return 1 character from left => here A

select left('ABCD', -1); -- "-1" mean it will give all characters from left except last one
-- for '-2' it will give all characters from left except last 2 character


-- Get initial for all directors name
select left(first_name, 1) as initial 
from directors 
order by 1;

-- get first 6 characters from all movies
select 
	movie_name,
	left(movie_name, 6)
from movies;

select right('ABCD', 3); 
select right('ABCD', -2);

select last_name, right(last_name, 2)
from directors 
where right(last_name, 2) = 'on';


-- reverse
select reverse('Pratik patel');

-- split part 
select split_part('1,2,3', ',', 3); -- output: 3
select split_part('1,2,3', ',', 2); -- output: 2

select split_part('one, two, three', ',', 1); -- one

-- Get release year of all movies

select
	movie_name,
	release_date,
	split_part(release_date::text, '-',1) as release_year
from movies;

select * from movies;


-- trim, btrim, ltrim and rtrim
select 
	trim(leading from '    Pratik Patel     '), -- 'Pratik Patel     '
	trim(leading from '     Pratik Patel      '), -- 'Pratik Patel      '
	trim('   Pratik Patel     '); 'Pratik Patel'


-- removing leading zeros
select trim(leading '0'
			from
				cast(00000012345 as text)
); -- 12345

select ltrim('yummy','y'); -- ummy

select rtrim('yummy','y'); -- yumm

select btrim('yummy','y'); -- umm


-- lpad and rpad
--------------------------------
select lpad ('Databsae', 15, '*'); -- '*******Databsae'
select rpad ('Databsae', 15, '*'); -- 'Databsae*******'

select 
	mv.movie_name,
	r.revenues_domestic,
	lpad('*', cast(trunc(r.revenues_domestic / 10) as int), '*') as chart
from movies mv
inner join movies_revenues r on r.movie_id = mv.movie_id
order by 3 desc nulls last;
	
select * from movies;

-- LENGTH
---------------------------------------------------
select length ('Pratik Patel');

select length(cast (10900000 as text));

select char_length(' ');

select char_length(null);

select 
	first_name || ' ' || last_name as full_name,
	length(first_name || ' ' || last_name) as full_name_length
from directors 
order by full_name_length desc;


-- position
-----------------------------------------------
select position('el' in 'Pratik Patel');

-- strpos
select strpos('world bank','bank');


select
	first_name,
	last_name
from directors
where strpos(last_name, 'on')>0;

-- substring
select substring('what a wonderful day' from 2 for 8);

select substring('what a wonderful day' for 8);


-- repeat
select repeat('-x-', 50);

-- replace
select replace('Pratik', 'tik', 'nit'); -- 'Pranit'