-- sub query
use sakila;
select* from payment;

select amount from payment where payment_id=5;
select* from payment where amount=0.99;

-- ()=>nested query
select* from payment where amount=(select amount from payment where payment_id=5);

select amount from payment where payment_id=23;
select* from payment where amount!=3.99;
select payment_id,amount from payment where amount!=(select amount from payment where payment_id=23);


select month(payment_date),amount from payment where payment_id=6;
select * from payment where month(payment_date)=6;

select payment_id,amount,payment_date,customer_id from payment where month(payment_date)=
(select month(payment_date)from payment where payment_id=6);


select * from payment  where payment_id=7;
select * from payment where staff_id=1;

select * from payment where staff_id=(select staff_id from payment  where payment_id=7);

select max(amount) from payment;
select * from payment where amount=11.99;

select * from payment where amount=(select max(amount) from payment);


select amount from payment where rental_id=1725;
select count(amount) from payment group by amount;
select * from payment where amount<4.99;

select amount,count(amount) from payment 
where amount<(select amount from payment where rental_id=1725) 
group by amount;


select month(payment_date)from payment where customer_id=1 and payment_id=3;
select * from payment where month(payment_date)>6;

-- single row sub query(nested=> return 1 row only)

select month(payment_date),sum(amount) from payment where month(payment_date)>
(select month(payment_date) from payment where customer_id=1 and payment_id=3)
group by month(payment_date);






