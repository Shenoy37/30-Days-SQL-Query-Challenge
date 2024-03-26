-- SELECT * FROM STUDENT_TESTS

select test_id,marks
from 
(
	select test_id,marks, lag(marks,1,0) over (order by test_id) as prev_marks
	from student_tests
)output_1
where marks>prev_marks


select test_id,marks
from 
(
	select test_id,marks, lag(marks) over (order by test_id) as prev_marks
	from student_tests
)output_2
where marks>prev_marks


