-- find employee who earn more than the average salary of the employee

use corredb;
select * from employees where salary>
(select avg(salary) from employees);

with cte as
(select avg(salary) from employees)
 select * from employees where salary>
(select * from cte);
 
 select * from employees where salary>
(select * from cte);

-- find the who employee max salary equal salary of the employee
 select * from employees where salary=(select max(salary) from employees);
 
select max(salary) from employees where salary<(select max(salary) from employees);
 
 -- subquery to find the max salary then we find the second higest salary
 select * from employees where salary=
 (select max(salary) from employees where salary<(select max(salary) from employees));
 
-- find the empoyee who work in laocated in it and finance 
 
select * from departments where dept_name='IT' or  dept_name='FINANCE';

select * from employees where dept_id in
(select dept_id from departments where dept_name='IT' or  dept_name='FINANCE');

select * from employees where dept_id > any 
(select dept_id from departments where dept_name='IT' or  dept_name='FINANCE');

select * from employees where dept_id < any 
(select dept_id from departments where dept_name='IT' or  dept_name='FINANCE');

select * from employees where dept_id > all 
(select dept_id from departments where dept_name='IT' or  dept_name='FINANCE');

select * from employees where dept_id < all 
(select dept_id from departments where dept_name='IT' or  dept_name='FINANCE');

-- find the employees salary is greater than all employees in the hr department 
select dept_id from departments where dept_name='hr';

select max(salary) from employees where dept_id='10';

select * from employees where salary>all(select max(salary) from employees where dept_id='10');

select * from employees where salary>(select max(salary) from employees where dept_id=(
select dept_id from departments where dept_name='hr'));

select * from employees where salary> all (
select salary from employees as e join 
departments as d where e.dept_id=d.dept_id
and dept_name='hr');


-- find the
select * from employees where salary> any ( 
select salary from employees as e join 
departments as d where e.dept_id=d.dept_id
and dept_name='sales');


with cte as
(select d.dept_id,salary from employees as e join 
departments as d where e.dept_id=d.dept_id
and dept_name='sales')

-- getting employees with the same salary of sales but don't belong to sales ki dept_id
select * from employees where salary in (
select salary from cte) and dept_id not in (select dept_id from cte);

-- find the employees who earn more than the average salary of their department
select dept_id,avg(salary) from employees group by dept_id;
 -- correlated it is which every time executed any time and every row
 select emp_id,emp_name,dept_id,salary from employees as eout where salary>
(select avg(salary) from employees where dept_id=eout.dept_id);

with cte as(select dept_id,avg(salary) as avg_salary from employees group by dept_id)

 select*from employees as e join cte where e.dept_id=cte.dept_id
 and e.salary>cte.avg_salary;

-- find the departments whose average salary is greater than the over all average salary of all employees;
 select dept_id,avg(salary) from employees group by dept_id having avg(salary)>all
(select avg(salary) from employees as e where e.dept_id=dept_id);

-- find the employees who earn the more than the average salary of the IT departments

--  find the departments with the max total salary 
 select dept_id,sum(salary) as total from employees as e join departments as d 
 on  e.dept_id=d.dept_id group by dept_id 
 order by total desc limit 1,1 ;
 
  select dept_id,sum(salary) as total from employees  group by dept_id having total>=all
  (select sum(salary) as total from employees group by dept_id);
 
-- find the departments whose minimum salary is greater than the minimum salary of the sales department 
 
  select min(salary) as min_salary from employees group by dept_id  having min_salary>
 ( select min(salary) as min_salary from employees as e join departments as d 
  where  e.dept_id=d.dept_id and d.dept_name='sales');
 
   select dept_id,min(salary) as min_salary from employees group by dept_id  having min_salary>any
 ( select min(salary) as min_salary from employees as e join departments as d 
  where  e.dept_id=d.dept_id and d.dept_name='sales');
 
 
 
 
 
 
 
 


