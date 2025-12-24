use regex;
-- self join=>same one table join 
select * from employee;

-- in terms of employee
select emp.emp_id, emp.emp_name, emp.manager_id from employee as emp;

-- in reference of manager
select manager.emp_id, manager.emp_name from employee as manager;

select emp.emp_id, emp.emp_name,emp.manager_id,
manager.emp_id, manager.emp_name from employee as emp
join employee as manager
where emp.manager_id=manager.emp_id;

select emp.emp_id, emp.emp_name,emp.manager_id,
manager.emp_id, manager.emp_name,manager.salary from employee as emp
join employee as manager
where emp.manager_id=manager.emp_id;

select emp.emp_id, emp.emp_name,emp.manager_id,
manager.emp_id, manager.emp_name,manager.salary,emp.salary from employee as emp
join employee as manager
where emp.salary > manager.salary;



