Select * from employees;

Select *, sum(salary) over(),
sum(salary) over(partition by department) ,
sum(salary) over(partition by department,city)from employees;

-- Over(order by) : it gives result in ascending order according to the column
-- Running sum/ cummulative sum 
Select *,
sum(salary) over(order by salary) from employees;

Select *,
sum(salary) over(order by emp_id) from employees;

Select *,
sum(salary) over(order by full_name) from employees;

Select *,
sum(salary) over(order by city) from employees;

Select *,
sum(salary) over(order by month(hire_date)) from employees;

-- need to get the running sum of salary of each department

Select *,
sum(salary) over(partition by department order by salary) from employees;

-- row_number() => To define a unique value

Select *,
row_number() over(partition by department) from employees;

Select *,
row_number() over(partition by department order by hire_date) from employees;

-- rank() => It will give you the ranking for the values if there are same values and the ranking will be shared
-- rank() => It will give you the ranking for the values if there are same values and the ranking will be shared
-- and the next consecutive ranking will be skipped

Select *,
rank() over(order by city) from employees;

-- dense_rank() => It will work as rank() function but the ranking here will not be skipped.

-- Q. You have to give the highest ranking in each department
Select *,
rank() over(order by city),
dense_rank()over(order by city) from employees;

Select *,
dense_rank() over(partition  by department order by salary) from employees;

-- Q. In windows function what is the difference between rank(),dense_rank() & row_number