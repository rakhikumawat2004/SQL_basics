use regex;
select * from students;
select * from enrollments;
select s.student_id,s.student_name,e.enrollment_id,e.course_name
from students as s left join enrollments as e on s.student_id=e.student_id; 
select s.student_id,s.student_name,e.enrollment_id,e.course_name
from students as s left join enrollments as e on s.student_id=e.student_id
where enrollment_id is NULL;
 
select s.student_name,s.student_id,count(e.enrollment_id)
from students as s left join enrollments as e on s.student_id=e.student_id
group by student_id;

select s.student_name,s.student_id,count(e.enrollment_id)
from students as s join enrollments as e on s.student_id=e.student_id
group by student_id;

-- course_name is null in this table
-- did not use groupby in student name,and use the id because this is unique
select s.student_name,s.student_id,count(e.course_name)
from students as s left join enrollments as e on s.student_id=e.student_id
group by student_id having count(e.course_name)>2;

-- a sql query to find the course each major
select count(student_id) from students group by major;

-- total credits for each major
select s.major,sum(e.credits)from students as s 
join enrollments as e on s.student_id=e.student_id
group by s.major;


select*,char_length(student_name) from students;
select char_length(student_name),count(student_id) from students
group by char_length(student_name);

select char_length(s.student_name),count(e.enrollment_id)
from students as s join enrollments as e on s.student_id=e.student_id
group by char_length(student_name);

-- find the highest count of
select char_length(s.student_name),count(e.enrollment_id)
from students as s join enrollments as e on s.student_id=e.student_id
group by char_length(student_name)
order by count(e.enrollment_id) desc limit 3;
