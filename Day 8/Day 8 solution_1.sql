-- drop table if exists job_skills;
-- create table job_skills
-- (
-- 	row_id		int,
-- 	job_role	varchar(20),
-- 	skills		varchar(20)
-- );
-- insert into job_skills values (1, 'Data Engineer', 'SQL');
-- insert into job_skills values (2, null, 'Python');
-- insert into job_skills values (3, null, 'AWS');
-- insert into job_skills values (4, null, 'Snowflake');
-- insert into job_skills values (5, null, 'Apache Spark');
-- insert into job_skills values (6, 'Web Developer', 'Java');
-- insert into job_skills values (7, null, 'HTML');
-- insert into job_skills values (8, null, 'CSS');
-- insert into job_skills values (9, 'Data Scientist', 'Python');
-- insert into job_skills values (10, null, 'Machine Learning');
-- insert into job_skills values (11, null, 'Deep Learning');
-- insert into job_skills values (12, null, 'Tableau');

-- select *, 
-- CASE 
-- WHEN SKILLS = 'SQL' OR  SKILLS = 'Python' OR SKILLS = 'AWS' OR SKILLS = 'Snowflake'
-- OR SKILLS = 'Apache Spark' THEN 'Data Engineer' 
-- WHEN SKILLS = 'Java' OR SKILLS = 'HTML' OR SKILLS = 'CSS'  THEN 'Web Developer' ELSE 'Data Scientist'
-- END AS job_desciption
-- from job_skills;

select row_id,
case 
when segment = 1 then 'Data Engineer' 
when segment = 2 then 'Web Developer' 
ELSE 'Data Scientist' end as job_role, skills
from 
(
	select * ,
	sum(case when job_role is null then 0 else 1 end) over (order by row_id) as segment
	from job_skills
) x
