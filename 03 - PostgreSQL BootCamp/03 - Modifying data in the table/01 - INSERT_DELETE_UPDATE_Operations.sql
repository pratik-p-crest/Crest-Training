create table customers(
	customer_id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(150),
	age INT
);
select * from customers;


-- insert data into table
insert into customers (first_name, last_name,email,age) values ('pratik', 'patel','pratik@gmail.com','22');
select * from customers;


-- insert multiple records into tables
insert into customers (first_name, last_name)
values
('dhruv','aghera'),
('meet ','parmar'),
('vedant','parmar');
select * from customers;


--insert data with quotes
insert into customers(first_name)
values
('Bill''O suvillan');
select * from customers;


--'RETURNING' to get info on return rows
insert into customers (first_name)
values('shahir');

-- after insert returning the rows
insert into customers(first_name)
values ('divam') returning *;

-- after inserting lets return the single column value not all row
insert into customers(first_name)
values ('nakrani') returning customer_id,first_name;


-- update data in the table
select * from customers;

update customers 
set email = 'dhruv@gmail.com'
where customer_id = 2

select * from customers;


-- update multiple records
update customers 
set 
email = 'dhruv@gmail.com',
age = 20
where customer_id = 2


select * from customers;


-- use 'RETURNING' to get updated rows
update customers
set
email = 'abc@gmail.com'
where customer_id = 3 returning *


-- update all record in a table
update customers
set is_enable = 'Y'
where customer_id = 1;
select * from customers ;                      

update customers
set is_enable = 'Y';
select * from customers ;  

update customers
set is_enable = 'Y'
RETURNING *;


-- delete record from table
delete from customers
where customer_id = 10;
select * from customers;


-- delete all the records
delete from customers;
select * from customers;


-- 