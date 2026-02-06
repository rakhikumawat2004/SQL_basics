use sakila;
select * from customer;
select * from payment;
select * from film;
select * from rental;
select first_name,active,
  case
      when active=1 then 'active customer'
      when active=0 then 'inactive customer'
   end as active_case
from customer;   
 
 
select * from film; 
select film_id,length,
  case
      when  length<120 then 'short'
      when  length between 121 and 148 then 'medium'
      else 'high'
   end as length_case
from film;     

 
select rating,count(*),
  case
      when  count(*)<120 then 'low count'
      when  count(*) between 121 and 148 then 'medium count'
      else 'high count'
   end as length_case
from film group by rating;    

select * from payment;
select * from customer;

select c.customer_id,first_name,sum(amount),
case
when sum(amount)<90 then 'low spend'
else 'high spend'
end as sum_amount
from payment as p join 
customer as c where
p.customer_id=c.customer_id
group by c.customer_id,c.first_name;

select * from rental;
select * from inventory;

create table newrental as select * from rental;

-- find how many times each film has been rental

select f.film_id,f.title,count(r.rental_id) as total_rentals
from film as f join inventory as i on f.film_id=i.film_id 
join rental as r on i.inventory_id=r.inventory_id
group by f.film_id,f.title order by f.title desc;

-- list pairs of customer who being to the same store
-- avoid duplicates and mirror pairs
-- select * from customer;
-- select c1.staff_id from customer as c1
-- join customer as c2 where c1.customer_id=c2.customer_id  

-- find the customer whose total payment a greater than the average total payment of all customer
select c.customer_id,c.first_name,sum(amount) from payment as p join customer as c 
on c.customer_id=p.customer_id group by customer_id,c.first_name having sum(amount)>
(select avg(amount) from payment);

-- find the films whose rental count is grater than the average rental per film
select f.film_id,f.title,count(r.rental_id) as total_rentals
from film as f join inventory as i on f.film_id=i.film_id 
join rental as r on i.inventory_id=r.inventory_id
group by f.film_id,f.title order by f.title desc;






   