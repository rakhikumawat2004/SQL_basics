-- view=>
-- view is virtual statement
-- donot store the data physically but will access the data from the existing table

-- advatages
-- it is make your complex eassy
-- it is security rows and columns

-- two types of views
-- 1.simple view
-- 2.complex view

use resgex1;
create table newactor as 
select actor_id,first_name from sakila.actor where actor_id between 1 and 3;

select * from newactor;

-- 1.simple view
-- any dml change will be visible on orginal table
-- where is created
create view actor_v as
select *,substr(first_name,2) from newactor;

select * from actor_v;

select*from newactor;

create view actor_v2 as
select * from newactor where actor_id in (1,2);
select*from newactor;
insert into newactor values(4,'riya');
select*from newactor;
select * from actor_v2;

-- subquery , join,groupby,having,windows function and aggregate function use in view
-- when view does not use dml query exists and view is not operate 
-- the changes will be orginal table

create table newpayment as
select payment_id,amount from sakila.payment where payment_id between 1 and 7;

select* from newpayment;

create view payment_v as
select count(*) from newpayment;

select* from payment_v;
insert into payment_v values(10);






