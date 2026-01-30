-- CTE
-- common table expression=>ek temprary name of your sql query
-- jab ak sql statement use kar rhe h tabtak cte command chalti h
with tushar_cte as
(select * from sakila.actor where actor_id between 5 and 90)
select*from tushar_cte;

with tushar_cte as
(select * from sakila.actor where actor_id between 5 and 90)
select count(*)from tushar_cte;

-- they are not stored permanently in the database
-- it will help break down complex query into smaller,logical parts

select * from sakila.payment;

with cte as
(select *,month(payment_date) from sakila.payment)
select month(payment_date),count(*) from cte
group by month(payment_date);

with cte as
(select *,dense_rank() over(order by amount desc) as ranking from sakila.payment)
select * from cte where ranking = 2;

-- second highest amount for each customer
with cte as
(select *,dense_rank() over(partition by customer_id order by amount desc) as ranking from sakila.payment)
select * from cte where ranking = 2;

-- question of correalted subquery
-- select  emp_id,emp_name,department,salary from as e where 

-- cte
with cte as (
select department as dept, avg(salary) as deptsalary from employee group by department)
select emp_id,emp_name,department,salary from employee as e join cte where e.department=cte.department and salary>deptsalary;


-- to optimize join in sql -- filter the data and join in cte
-- grant authorication revoke ,authorization,differnce between cte and temp table











