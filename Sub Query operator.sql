use sakila;
select* from payment;
-- single row subquery
-- ek query =>1 rows return

-- 0.99 and 5.99
select* from payment where amount=(select amount from payment where payment_id=2 or payment_id=3);

select* from payment where amount=(select amount from payment where payment_id=2 or payment_id=3);

select* from payment where amount in (select amount from payment where payment_id=2 or payment_id=3);

select* from payment where amount not in (select amount from payment where payment_id=2 or payment_id=3);

select* from payment where amount= any(select amount from payment where payment_id=2 or payment_id=3);

select* from payment where amount> any(select amount from payment where payment_id=2 or payment_id=3);

select* from payment where amount>=any(select amount from payment where payment_id=2 or payment_id=3);

select* from payment where amount<any(select amount from payment where payment_id=2 or payment_id=3);

select* from payment where amount>all(select amount from payment where payment_id=2 or payment_id=3);

select* from payment where amount<all(select amount from payment where payment_id=2 or payment_id=3);

select* from payment where amount<=all(select amount from payment where payment_id=2 or payment_id=3);

-- any=> kisi bhi query ma particular given value se comparision
-- all=> kisi bhi query ma all given value se comparision

select * from payment where month(payment_date) in 
(select month(payment_date) from payment where payment_id=2 or payment_id=3);

select * from payment where amount>all
(select amount from payment where 
payment_id=2 or payment_id=3 or payment_id=4 or 
payment_id=5 or payment_id=6 or payment_id=7 or payment_id=8 );

select * from payment where amount>all
(select amount from payment where 
payment_id in (2,3,4,5,6,7,8));







