--- Array
----------------

CREATE TABLE mobile_register(
	mb_id SERIAL,
	mobile text[]
);

INSERT INTO mobile_register (mobile)
VALUES ('{12345-67890,12345-67890,12345-67890}'),
       ('{12345-67890,12345-67890,12345-67890}');

SELECT * FROM mobile_register; -- {12345-67890, 12345-67890, 12345-67890}

SELECT mobile[1] FROM mobile_register; -- 12345-67890


--- hstore
-------------

CREATE EXTENSION IF NOT EXISTS "hstore";

CREATE TABLE library1(
	book_id SERIAL,
	book_info hstore
);

INSERT INTO library1 (book_info)
VALUES ('
			"book_name" => "xyz",
			"author_name" => "zxy",
			"price" => "100"
'), 
('
			"book_name" => "abc",
			"author_name" => "cba",
			"price" => "200"
');

SELECT * FROM library1;

SELECT book_info->'book_name' FROM library1



--- JSON
--- we have normal JSON and JSONB for binary data
--- JSON supports white spaces and identation but not JSONB
--- JSONB supports fast searching and indexing 

CREATE TABLE json(
	id serial primary key,
	docs JSON
);

INSERT INTO json(docs)
VALUES 
	('[1,2,3,4,5]'),
	('[2,3,4,5,6]'),
	('{"Key" : "Value"}');

SELECT * FROM json;

SELECT * FROM json
WHERE docs @> '2';    --- not working cause we have data type JSON its working in JSONB

ALTER TABLE json
ALTER COLUMN docs TYPE JSONB;

SELECT * FROM json
WHERE docs @> '2'; 

SELECT * FROM json
WHERE docs @> '{"Key":"Vlaue"}'   

CREATE INDEX ON json USING GIN (docs jsonb_path_ops );



--- NETWORK ADRESSES
--- cidr -> ipv4 and ipv6 networks
--- inet -> ipv4 and ipv6 with host 
--- macaddr  -> mac adresses
--- macaddr8  -> mac adresses EUI-64 format 


CREATE TABLE ip(
	id SERIAL,
	ip INET
);

INSERT INTO	 ip(ip)
VALUES ('4.234.22.245'),
		('192.34.5.6');

SELECT * FROM ip;

SELECT ip, set_masklen(ip,24)  AS "Masked" FROM ip;  --- denote masked bits at the end 

SELECT ip, set_masklen(ip,24) AS "Masked", 
			set_masklen(ip::cidr,24) AS "CIDR" ,
			ip::cidr   --- By default masked bits 32
FROM ip;