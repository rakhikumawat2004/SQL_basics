-- TCL
-- transaction control language
-- set of logiacl statements(parmanent nhi h)
-- update 
-- used to handel the logical statement and parmanent save the data in table
use regex;

create table actor_cp2 as select actor_id,first_name from sakila.actor
where actor_id between 1 and 5;

select * from actor_cp2;
insert into actor_cp2  values(6,'tushar');

-- auto commit => enable -- do not need start transaction command use
set @@autocommit=0;
select @@autocommit;

insert into actor_cp2  values(7,'testtoo');
select * from actor_cp2;

-- in case if you run any dml operation new write down start transaction-
-- transaction is start


-- transaction stop
-- tcl ka koi bhi statement  use kanre per roll back and commit the transaction is stop
-- any ddl operation create alter drop truncate ka use karke bhi transaction stop hom jata ha
 
-- commit statement is  datbase changes parmanently save 
commit;

insert into actor_cp2  values(8,'testtoo');
select * from actor_cp2;

-- roll back is use previous transaction is disable
-- jha last changes kiya ho vha tak data print ho jata h
update actor_cp2 set actor_id=1000;
select * from actor_cp2;

rollback;
select * from actor_cp2;
commit;

-- enable
set @@autocommit=1; -- start transaction command use
select @@autocommit;

-- start transaction is start and inser table 
start transaction;
insert into actor_cp2  values(11,'amazon');
select * from actor_cp2;
commit;
rollback;

start transaction;
insert into actor_cp2  values(12,'flipcart');
select * from actor_cp2;

start transaction;
insert into actor_cp2  values(13,'flipcart');
select * from actor_cp2;
create table xyz(id int);

-- ddl statement tab use karte jab humne table pending ho to ddl satetment use karte tab table save ho jati h

start transaction;
insert into actor_cp2  values(14,'abc');
insert into actor_cp2  values(15,'cdf');

delete from actor_cp2 where actor_id in (2,3,5);

select * from actor_cp2;

start transaction;
insert into actor_cp2  values(14,'sagf');
insert into actor_cp2  values(15,'fgvdhcv');

delete from actor_cp2 where actor_id in (7,9);

select * from actor_cp2;

rollback;
select * from actor_cp2;

-- save apne kam ko specifically save karna hota h just like a check point
start transaction;
insert into actor_cp2  values(19,'sagf');
insert into actor_cp2  values(20,'fgvdhcv');
savepoint db_actor_cp2_savepoint1;
select * from actor_cp2;
delete from actor_cp2 where actor_id in (7,9);
rollback;
select * from actor_cp2;

rollback to db_actor_cp2_savepoint1;
select * from actor_cp2;
commit;

