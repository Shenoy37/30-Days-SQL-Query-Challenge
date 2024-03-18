-- DROP TABLE IF EXISTS FOOTER;
-- CREATE TABLE FOOTER 
-- (
-- 	id 		INT PRIMARY KEY,
-- 	car 		VARCHAR(20), 
-- 	length 		INT, 
-- 	width 		INT, 
-- 	height 		INT
-- );

-- INSERT INTO FOOTER VALUES (1, 'Hyundai Tucson', 15, 6, NULL);
-- INSERT INTO FOOTER VALUES (2, NULL, NULL, NULL, 20);
-- INSERT INTO FOOTER VALUES (3, NULL, 12, 8, 15);
-- INSERT INTO FOOTER VALUES (4, 'Toyota Rav4', NULL, 15, NULL);
-- INSERT INTO FOOTER VALUES (5, 'Kia Sportage', NULL, NULL, 18); 

-- with cte as
-- 	(SELECT *,
-- 	case when "length" is not null then "length" else 0 end as valid_length,
-- 	case when width is not null then width else 0 end as valid_width,
-- 	case when height is not null then height else 0 end as valid_height
-- 	FROM FOOTER) ,
	
with cte as
	(select *,
	 case when "length" is not null then 1 else 0 end as length_flag,
	 case when width is not null then 1 else 0 end as width_flag
	 from footer),
	
	cte2 as (select *,
			 sum(length_flag) over(order by id) as length_segment,
			 sum(width_flag) over(order by id) as width_segment
			 from cte)
select car,
first_value("length") over(partition by length_segment order by id) as "length_needed",
first_value(width) over(partition by width_segment order by id) as "width_needed",
height
from cte2
order by id desc 
limit 1

