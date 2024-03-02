
with trail_1 as 
	(
	select t1.hut1 as start_hut,m1.name as start_hut_name,
		m1.altitude as start_hut_altitude,t1.hut2 as end_hut
	from mountain_huts m1
	join trails t1 on m1.id = t1.hut1
	),
	
	trail_2 as
	(select t2.*,m2.name as end_hut_name,m2.altitude as end_hut_altitude,
	case when t2.start_hut_altitude>m2.altitude then 1 else 0 
	end as altitude_flag
	from trail_1 t2
	join mountain_huts m2 on m2.id = t2.end_hut),

	cte_final as 
	(select 
	case when altitude_flag=1 then start_hut else end_hut end as start_hut,
	case when altitude_flag=1 then start_hut_name else end_hut_name end as start_hut_name,
	case when altitude_flag=1 then end_hut else start_hut end as end_hut,
	case when altitude_flag=1 then end_hut_name else start_hut_name end as end_hut_name
	from trail_2)

--1 3 5
--2 3 5
--3 5 4
--1 5 4

select 
c1.start_hut_name as startpt,
c1.end_hut_name as middlept,
c2.end_hut_name as endpt
from cte_final c1
join cte_final c2 on c1.end_hut =c2.start_hut
order by c1.start_hut_name


