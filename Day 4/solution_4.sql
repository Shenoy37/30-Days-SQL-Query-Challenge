--Dropping the table 
-- drop table if exists Q4_data;
-- create table Q4_data
-- (
-- 	id			int,
-- 	name		varchar(20),
-- 	location	varchar(20)
-- );
-- insert into Q4_data values(1,null,null);
-- insert into Q4_data values(2,'David',null);
-- insert into Q4_data values(3,null,'London');
-- insert into Q4_data values(4,null,null);
-- insert into Q4_data values(5,'David',null);
-- select * from q4_data
-- with cte as
-- 	(select min(id),min(name),min(location),
-- 	case when name is not null then (select location from q4_data where location is not null) end as new_location
-- 	from q4_data )
-- select ,name,new_location from cte group by id order by name,new_location desc
-- -- limit 1 offset 1
select min(id), min(name),min(location) from q4_data
select max(id), min(name),min(location) from q4_data
