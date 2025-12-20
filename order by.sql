use sakila;
show tables;
select * from payment;

select count(*) from payment where amount=2.99;

select amount, count(*) from payment group by amount;

select customer_id,sum(amount) from payment where amount>3 group by customer_id;

select customer_id,sum(amount) from payment where month(payment_date)=5 group by customer_id;

select staff_id,max(amount),avg(amount),sum(amount)from  payment group by staff_id;

select max(amount),avg(amount),sum(amount) 
from payment where (customer_id%2=0) group by staff_id;

select staff_id,amount,count(amount) from payment where staff_id=1
group by amount having count(amount)>30;

select amount,count(amount) from payment where staff_id=1
group by amount having count(*)>30;

select count(customer_id),avg(amount),sum(amount), month(payment_date) 
from payment where staff_id=1 or  staff_id=2 group by month(payment_date);

select count(customer_id),avg(amount),sum(amount),extract(month from payment_date) 
from payment where staff_id=1 or  staff_id=2 group by extract(month from payment_date);

select count(customer_id),avg(amount),sum(amount), month(payment_date),year(payment_date) 
from payment where staff_id=1 or  staff_id=2 group by month(payment_date),year(payment_date);


-- order by
-- sort the data(ascending order and descending order)
select * from payment order by customer_id;
select * from payment order by customer_id desc;
select * from payment order by customer_id asc;

select * from payment order by customer_id,amount desc;
select * from payment order by customer_id desc,amount;


