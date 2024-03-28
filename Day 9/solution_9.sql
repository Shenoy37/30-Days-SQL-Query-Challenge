-- drop TABLE if exists orders;
-- CREATE TABLE orders 
-- (
-- 	customer_id 	INT,
-- 	dates 			DATE,
-- 	product_id 		INT
-- );
-- INSERT INTO orders VALUES
-- (1, '2024-02-18', 101),
-- (1, '2024-02-18', 102),
-- (1, '2024-02-19', 101),
-- (1, '2024-02-19', 103),
-- (2, '2024-02-18', 104),
-- (2, '2024-02-18', 105),
-- (2, '2024-02-19', 101),
-- (2, '2024-02-19', 106); 

-- (WITH cte1 as 
-- 	(select * , rank() over(partition by customer_id order by dates) as rank,lag(product_id)over(order by dates) as lag_product_id
-- 	from orders)
	
-- select *,CONCAT(lag_product_id,product_id)
-- from cte1
-- order by rank)

-- UNION

-- (WITH cte2 as 
-- 	(select * , rank() over(partition by customer_id order by dates) as rank,lag(product_id)over(order by dates) as lag_product_id
-- 	from orders)
	
-- select *,
-- CONCAT(lag_product_id,',',product_id)
-- from cte2
-- where lag_product_id =101 or lag_product_id =104
-- order by rank,customer_id)
-- order by rank,product_id,lag_product_id

select dates,cast(product_id as varchar) as products
from orders
-- where customer_id=1 and dates = '2024-02-18'
union
select dates,string_agg(cast(product_id as varchar),',') as products
from orders
-- where customer_id=1 and dates = '2024-02-18'
group by dates,customer_id
order by dates,products
