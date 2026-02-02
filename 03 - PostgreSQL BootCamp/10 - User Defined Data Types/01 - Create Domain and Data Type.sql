--- User Defind Data types 
------------------------------------

---- DOMAIN
-------------
CREATE DOMAIN addr varchar(100) NOT NULL;

CREATE TABLE locations(
	address addr	
);

INSERT INTO locations (address) VALUES ('123 london')

SELECT * FROM locations;


CREATE DOMAIN positive_numeric INT NOT NULL CHECK (VALUE > 0)

CREATE TABLE sample(
	sample_id SERIAL PRIMARY KEY,
	value_nums positive_numeric
);

INSERT INTO sample (value_nums) VALUES (10);

SELECT * FROM sample;


INSERT INTO sample (value_nums) VALUES (-10); 
-- ERROR:  value for domain positive_numeric violates check constraint "positive_numeric_check" 
SELECT * FROM sample;



CREATE DOMAIN us_postal_codes AS TEXT 
CHECK(
	VALUE ~'^\d{5}$'
	OR VALUE ~'^\D{5}-d\{4}$'
)

CREATE TABLE addresses(
	address_id SERIAL PRIMARY KEY,
	postal_code us_postal_codes
);

INSERT INTO addresses (postal_code) VALUES ('10000');
SELECT * FROM addresses


-- for email
CREATE DOMAIN proper_email TEXT
CHECK (
    VALUE ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'    --- * -> for case insensitive inputs
);

CREATE TABLE client_names(
	client_name_id SERIAL PRIMARY KEY,
	email proper_email
)

INSERT INTO client_names (email) values ('a@gmail.com');
SELECT * FROM client_names;


-- create an Enumeration Type (Enum or Set of the values) Domain

CREATE DOMAIN valid_color VARCHAR(10)
CHECK (VALUE IN('red','green','blue'));

CREATE TABLE colors(
	color valid_color
);

INSERT INTO colors (color) VALUES ('green');
INSERT INTO colors (color) VALUES ('orange'); -- ERROR:  value for domain valid_color violates check constraint "valid_color_check" 
SELECT * FROM colors;


-- Get all domain in a schema

SELECT typname 
FROM pg_catalog.pg_type
JOIN pg_catalog.pg_namespace
ON pg_namespace.oid = pg_type.typnamespace
WHERE 
typtype = 'd' and nspname = 'public';

-- DROP a domain data type
-- drop a domain name

DROP DOMAIN positive_numeric 
-- ERROR:  cannot drop type positive_numeric because other objects depend on it
-- column value_nums of table sample depends on type positive_numeric 

DROP DOMAIN positive_numeric CASCADE;
SELECT * FROM sample;


DROP DOMAIN valid_color;

DROP DOMAIN valid_color;
SELECT * FROM colors;

-- create data type
CREATE TYPE address AS (
	city VARCHAR(50),
	country VARCHAR(20)
);

CREATE TABLE companies(
	comp_id SERIAL PRIMARY KEY,
	address address
);

INSERT INTO companies (address) VALUES (ROW('GANGTOK','INDIA'));
INSERT INTO companies (address) VALUES (ROW('london','UK'));
SELECT * FROM companies

-- (composite_column).field

SELECT (address).country FROM companies;
SELECT (address).city FROM companies;

-- (table_name.composite_column).field
SELECT (companies.address).city FROM companies;



CREATE TYPE inventory_item AS(
	product_name VARCHAR(200),
	supplier_id INT,
	price NUMERIC
);

CREATE TABLE inventory(
	inventory_id SERIAL PRIMARY KEY,
	item inventory_item
);

SELECT * FROM inventory;

INSERT INTO inventory (item) VALUES (ROW('pen',10,10));

SELECT (item).product_name FROM inventory WHERE (item).price > 5;


-- create ENUM data type
CREATE TYPE currency AS ENUM ('USD','EUR','INR')

SELECT 'INR' :: currency

ALTER TYPE currency ADD VALUE 'CHF' AFTER 'INR'

CREATE TABLE stocks(
	stock_id SERIAL PRIMARY KEY,
	stock_currency currency
);

INSERT INTO stocks (stock_currency) VALUES ('USD');
INSERT INTO stocks (stock_currency) VALUES ('POUND');
-- ERROR:  syntax error at or near "INSERT"
-- LINE 2: INSERT INTO stocks (stock_currency) VALUES ('POUND')
SELECT * FROM stocks;

-- DROP DATA TYPE
CREATE TYPE sample_type AS ENUM('a','b');

DROP TYPE sample_type;