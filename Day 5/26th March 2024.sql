
-- SELECT * FROM emp_transaction

--Building salary  report
-- create extension tablefunc;

select *,(basic+allowance+others)as gross,
(insurance+health+house)as total_deductions, 
((basic+allowance+others)-(insurance+health+house)) as net_pay
from crosstab('select emp_name,trns_type,amount
			   from emp_transaction order by emp_name,trns_type',
			 	'select distinct trns_type from emp_transaction order by trns_type')
	as result (employee varchar,
			   allowance numeric,
			   basic numeric,
			   others numeric,
			   insurance numeric,
			   health numeric,
			   house numeric
			  )

