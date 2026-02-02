-- Sequences
--------------------------------

-- -create a sequence
CREATE SEQUENCE IF NOT EXISTS test_seq;

SELECT nextval('test_seq') -- it will add 1 to previous value 

SELECT currval('test_seq') -- 2, gives current values of sequence

-- set a sequence
SELECT setval('test_seq',100)
SELECT currval('test_seq') -- 100

SELECT setval('test_seq',200,false);
SELECT currval('test_seq')--100;
SELECT nextval('test_seq') -- 200

-- fresh sequence and set strat value
CREATE SEQUENCE IF NOT EXISTS test_seq2 START WITH 500;


-- alter sequence
ALTER SEQUENCE test_seq RESTART WITH 300;
SELECT nextval('test_seq') -- 300

ALTER SEQUENCE test_seq RENAME TO my_seq;
SELECT currval('my_seq') --300;


-- create sequence with increment, min, max value, starts with.
----------------------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS seq3
INCREMENT 50
MINVALUE 400
MAXVALUE 6000
START WITH 800;

SELECT nextval('seq3'); -- 800
SELECT nextval('seq3'); -- 850

-- specify data type --> default bigint
create sequence if not exists test_seq_smallint as smallint;
create sequence if not exists test_seq_int as int;
create sequence if not exists test_seq_default;


-- create a descending sequence and cycle
-------------------------------------------
create sequence seq_asc;
select nextval('seq_asc')

create sequence seq_dsc
increment -1
minvalue 1
maxvalue 3
start 3
cycle;

select nextval('seq_dsc');-- 3,create a descending sequence and cycle
select nextval('seq_dsc'); -- 2
select nextval('seq_dsc'); -- 1
select nextval('seq_dsc'); -- 3, 
-- because of the cycle after minvalue it will start from the 3


-- Delete a sequence
----------------------------
drop sequence my_seq;

-- attaching sequence to a table
---------------------------------------
create table users(
	user_id serial primary key, -- SERIAL creates a sequence
	user_name varchar(50)
);

insert into users (user_name) values ('Pratik');

select * from users;

-- alter sequence tablename_columnname_seq restart with 100
alter sequence users_user_id_seq restart with 100

---------------------------------------------------------------
create table users2(
	user2_id int primary key,
	user2_name varchar(50)
);

create sequence users2_user2_id_seq
start with 100 owned by users2.user2_id;

alter table users2
alter column user2_id set default nextval('users2_user2_id_seq');

insert into users2 (user2_name) values ('Pratik');

select * from users2;



--  list all sequences in a database
select relname sequence_name
from pg_class
where 
relkind = 'S';

<<<<<<< HEAD


-- share one sequence between two tables
----------------------------------------------

create sequence common_fruits_seq start with 100;

create table apples (
	fruit_id int default nextval('common_fruits_seq') not null,
	fruit_name varchar(50)
);

create table mangoes (
	fruit_id int default nextval('common_fruits_seq') not null,
	fruit_name varchar(50)
);

insert into apples(fruit_name) values ('big apple');
insert into mangoes(fruit_name) values ('big mango');

select * from apples;
select * from mangoes;



-- create an alphanumeric sequence 
-------------------------------------------------
create table contacts (
	contact_id serial primary key,
	contact_name varchar(150)
);

insert into contacts (contact_name) values ('pratik');

select * from contacts;

drop table contacts;

create sequence table_seq;

create table contacts (
	contact_id text not null default ('ID' || nextval('table_seq')) ,
	contact_name varchar(150)
);

alter sequence table_seq owned by contacts.contact_id

insert into contacts (contact_name) values ('Pratik');

select * from contacts;
