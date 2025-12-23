use regex;
select * from customers;
select* from orders;
select ct.customer_id,ct.customer_name,od.order_id,od.customer_id,od.amount
from customers as ct
join orders as od
where ct.customer_id=od.customer_id;

select ct.customer_id,ct.customer_name,od.order_id,od.customer_id,od.amount
from customers as ct
Inner join orders as od
on ct.customer_id=od.customer_id;

-- outer join
select ct.customer_id,ct.customer_name,od.order_id,od.customer_id,od.amount
from customers as ct
left join orders as od
on ct.customer_id=od.customer_id;

select ct.customer_id,ct.customer_name,od.order_id,od.customer_id,od.amount
from customers as ct
right join orders as od
on ct.customer_id=od.customer_id;

-- natural join => natural join work like the inner join when columns name same in two tables
-- natural join => natural join work like the cross join when columns name not same in two tables

select ct.customer_id,ct.customer_name,od.order_id,od.customer_id,od.amount
from customers as ct
natural join orders as od;

alter table customers rename column customer_id to c_id;
desc customers;

select ct.c_id,ct.customer_name,od.order_id,od.customer_id,od.amount
from customers as ct
natural join orders as od;

-- crossjoin/cartsian join => every row of one table connected to the every row of another table.(many to many relationship)
select ct.c_id,ct.customer_name,od.order_id,od.customer_id,od.amount
from customers as ct
cross join orders as od;

select c.customer_name,sum(amount)
from customers as c 
join orders as o
where c.c_id=o.customer_id
group by customer_name;

select c.customer_name,sum(amount)
from customers as c 
join orders as o
where c.c_id=o.customer_id
group by customer_name
having sum(amount)>300;

use sakila;
select * from actor;
select * from film actor;
select a.first_name,a.actor_id,count(fa.film_id) from actor as a
join film_actor as fa
where a.actor_id=fa.actor_id
group by a.actor_id,a.first_name;








