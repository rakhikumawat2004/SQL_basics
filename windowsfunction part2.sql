USE window_fn_practice;
select *, rank() over(order by city) from employees;
select *, dense_rank() over(order by city) from employees;
select *, row_number() over(order by city) from employees;

select *, rank() over(partition by department order by salary) from employees;

select *, row_number() over(order by salary desc) from employees;

select *, rank() over(order by salary desc) from employees;

select *, dense_rank() over(order by salary desc) from employees;

select *, row_number() over(partition by department order by salary desc) from employees;

select *, rank() over(partition by department order by salary desc) from employees;

select *, Lead(salary) over() from employees;
select *, Lead(salary,2) over() from employees;

select *, Lag(salary,1) over() from employees;
select *, Lag(salary,3) over() from employees;

select *, Lead(salary) over(partition by department) from employees;
select *, Lag(salary) over(partition by department order by hire_date) from employees;

select *, Lag(salary) over(partition by department order by hire_date) ,
salary -lag(salary,1) over(partition by department order by hire_date) from employees;

select *, Lag(salary) over(order by salary),
lead(salary) over(order by salary) from employees;


select *, sum(amount) over(partition by emp_id order by sale_date) from sales;

select *, sum(amount) over(partition by emp_id order by sale_date) from sales;

select *, sum(amount) over() from sales;

select *, avg(salary) over(partition by department) from employees;

-- intermidiate level 01
-- sub query is to save a variable named as teampdata
-- first the subqyery is solved save to the variable
-- and then we acess the column and we filter out the data
select* from(select*,row_number() over(partition by department order by salary)as row_value
from employees)tempdata where row_value<=2;

select*,avg(salary) over(partition by department),
salary-avg(salary) over(partition by department) from employees; 

select*,sum(salary) over(),
rank() over(order by salary),
percent_rank() over(order by salary) 
from employees;

SELECT *,
    MIN(sale_date) OVER (PARTITION BY emp_id) AS min_sale_date,
    MAX(sale_date) OVER (PARTITION BY emp_id) AS max_sale_date
FROM sales;

SELECT *, NTILE(4) over(order by salary) FROM employees;

select *,month(sale_date),sum(amount) OVER (partition by sale_date order BY Sale_Date)from sales;

SELECT sale_id, sale_date, amount,
AVG(amount) OVER (
ORDER BY sale_date, sale_id
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS moving_avg_3
FROM sales;



