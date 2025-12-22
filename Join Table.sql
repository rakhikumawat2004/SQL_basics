use sakila;
select * from actor;  -- actor_id=pk
select * from film_actor;  -- actor_id=fk
select count(actor_id),count(distinct(actor_id)) from actor;

select a.first_name,a.actor_id from actor as a
join
film_actor as fa
where a.actor_id=fa.actor_id;

select * from film;
select * from film_actor;

-- composid key = two or more keys join in the table
desc film_actor;
desc film;

select fa.film_id,fa.actor_id ,f.title from film_actor as fa
join film as f
where fa.film_id=f.film_id; -- many actor can work in one move so,many to one

select * from actor;  
select * from film_actor;
select * from film;

-- how to multiple table join
select a.actor_id,a.first_name,fa.film_id,fa.actor_id,f.film_id,f.title 
from actor as a 
join 
film_actor as fa 
join
film as f
where a.actor_id=fa.actor_id and f.film_id=fa.film_id;








