-- drop table if exists Day_Indicator;
-- create table Day_Indicator
-- (
-- 	Product_ID 		varchar(10),	
-- 	Day_Indicator 	varchar(7),
-- 	Dates			date
-- );
-- insert into Day_Indicator values ('AP755', '1010101', to_date('04-Mar-2024','dd-mon-yyyy'));
-- insert into Day_Indicator values ('AP755', '1010101', to_date('05-Mar-2024','dd-mon-yyyy'));
-- insert into Day_Indicator values ('AP755', '1010101', to_date('06-Mar-2024','dd-mon-yyyy'));
-- insert into Day_Indicator values ('AP755', '1010101', to_date('07-Mar-2024','dd-mon-yyyy'));
-- insert into Day_Indicator values ('AP755', '1010101', to_date('08-Mar-2024','dd-mon-yyyy'));
-- insert into Day_Indicator values ('AP755', '1010101', to_date('09-Mar-2024','dd-mon-yyyy'));
-- insert into Day_Indicator values ('AP755', '1010101', to_date('10-Mar-2024','dd-mon-yyyy'));
-- insert into Day_Indicator values ('XQ802', '1000110', to_date('04-Mar-2024','dd-mon-yyyy'));
-- insert into Day_Indicator values ('XQ802', '1000110', to_date('05-Mar-2024','dd-mon-yyyy'));
-- insert into Day_Indicator values ('XQ802', '1000110', to_date('06-Mar-2024','dd-mon-yyyy'));
-- insert into Day_Indicator values ('XQ802', '1000110', to_date('07-Mar-2024','dd-mon-yyyy'));
-- insert into Day_Indicator values ('XQ802', '1000110', to_date('08-Mar-2024','dd-mon-yyyy'));
-- insert into Day_Indicator values ('XQ802', '1000110', to_date('09-Mar-2024','dd-mon-yyyy'));
-- insert into Day_Indicator values ('XQ802', '1000110', to_date('10-Mar-2024','dd-mon-yyyy'));

-- select * from Day_Indicator

SELECT product_id,day_indicator,dates
FROM
(
	select *, extract ('isodow' from dates) as day_of_week ,
	CASE
	WHEN SUBSTRING(day_indicator,extract ('isodow' from dates)::int,1) = '1' THEN 1 ELSE 0  
	END AS Date_num
	from Day_Indicator
)X

WHERE Date_num=1


