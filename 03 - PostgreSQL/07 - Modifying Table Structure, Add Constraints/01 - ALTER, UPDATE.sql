CREATE DATABASE mydata
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE persons(
	person_id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL
);

SELECT * FROM persons;           

ALTER TABLE persons
ADD COLUMN age INT NOT NULL;
SELECT * FROM persons;

ALTER TABLE persons
ADD COLUMN nationality VARCHAR(20) NOT NULL,
ADD COLUMN email VARCHAR(100) UNIQUE;
SELECT * FROM persons;


-- rename table 
ALTER TABLE persons 
RENAME TO users;
SELECT * FROM users;

ALTER TABLE users 
RENAME TO persons;

-- rename column name
ALTER TABLE persons
RENAME COLUMN age TO person_age;
SELECT * FROM persons;

-- drop a column
ALTER TABLE persons
DROP COLUMN person_age;
SELECT * FROM persons;

ALTER TABLE persons
ADD COLUMN age INT NOT NULL;
SELECT * FROM persons;


-- change the data type of column
ALTER TABLE persons
ALTER COLUMN age TYPE INT;
SELECT * FROM persons;


---Set a default value
ALTER TABLE persons
ALTER COLUMN email1 SET DEFAULT 'abc@xyz';

SELECT * FROM persons

-----------------------------------------------------------------------
-- add a constraints to a column

CREATE TABLE web_links(
	link_id SERIAL PRIMARY KEY,
	link_url VARCHAR(255) NOT NULL,
	link_target VARCHAR(20)
);
SELECT * FROM web_links;


INSERT INTO web_links(link_url, link_target) 
values ('https://www.google.com','');

ALTER TABLE web_links
ADD CONSTRAINT unique_web_url UNIQUE(link_url);

INSERT INTO web_links(link_url, link_target) 
values ('https://www.google.com','');

INSERT INTO web_links(link_url, link_target) 
values ('https://www.amazon.com','');

SELECT * FROM web_links;


-- set column to accept only defined values
alter table web_links
add column is_enable varchar(2);

alter table web_links
add check (is_enable in ('Y','N'));

update web_links
set is_enable = 'Y'
where link_id = 3;

select * from web_links;