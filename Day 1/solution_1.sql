-- -- Create table
-- CREATE TABLE Brands (
--     Brand1 VARCHAR(50),
--     Brand2 VARCHAR(50),
--     Year INT,
--     Custom1 INT,
--     Custom2 INT,
--     Custom3 INT,
--     Custom4 INT
-- );

-- -- Insert data
-- INSERT INTO Brands (Brand1, Brand2, Year, Custom1, Custom2, Custom3, Custom4)
-- VALUES
-- ('apple', 'samsung', 2020, 1, 2, 1, 2),
-- ('samsung', 'apple', 2020, 1, 2, 1, 2),
-- ('apple', 'samsung', 2021, 1, 2, 5, 3),
-- ('samsung', 'apple', 2021, 5, 3, 1, 2),
-- ('google', NULL, 2020, 5, 9, NULL, NULL),
-- ('oneplus', 'nothing', 2020, 5, 9, 6, 3);

-- SELECT * FROM Brands

with cte as
		(select *,
		case when brand1<brand2 then concat(brand1,brand2,year)
			 else concat(brand2,brand1,year) end as pair_id FROM brands) ,
		
	 cte_rn as 
	 (select *, row_number() over (partition by pair_id order by pair_id) as rn from cte)
	 
select *
from cte_rn
where rn=1 or (custom1<>custom3 and custom2<>custom4)