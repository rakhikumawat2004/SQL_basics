-- select department_name,avg(salary) from employee group by department_name;

-- select e.name,e.salary,e.department,d.department from employee join
-- department where e.department=d.department and e.salary>d.salary;

select*from employee;

select department_name,avg(salary) from employee group by department_name;

select ename,salary,department_name from employee
where salary>(select avg(salary) from employee as e 
where e.department_name=employee.department_name);

select ename,salary,department_name from employee
where salary=(select min(salary) from employee as e 
where e.department_name=employee.department_name);

select ename,salary,department_name from employee
where salary<=all(select salary from employee as e 
where e.department_name=employee.department_name);






