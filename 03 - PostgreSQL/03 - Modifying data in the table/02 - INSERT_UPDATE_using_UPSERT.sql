create table t_tags (
	id serial primary key,
	tag text unique,
	update_date timestamp default now() 	
);

insert into t_tags(tag) values
('pen'),
('pencil');

select * from t_tags;

-- let's insert a record , on conflict do nothing

insert into t_tags (tags)
values ('pen')
on conflict (tag) 
do 
	nothing;
-- this query states that while inserting data in tags if there is already same values then do nothing

select * from t_tags


-- let's insert a record,on conflict set new values
insert into t_tags (tag)
values ('pen')
on conflict (tag) 
do 
	update set
		tag = excluded.tag,
		update_date = now();

select * from t_tags