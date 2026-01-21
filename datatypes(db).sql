-- int decimal
-- tiny int ,small int, mediumint , int ,bigint
-- 1byte,2 byte,3byte,4byte,8byte
-- 1byte=8bit, 2**8=256(-128 to 127)
use regex1;
create table yash1(salary tinyint);
insert into yash1 values(127);
insert into yash1 values(128);

create table yash2(salary float,price double);
insert into yash2 values(100.6781214,100.81214);
insert into yash2 values(100.6781214,400.24365);
select * from yash2;

-- string value char vs varchar()
-- fixed sized character
-- variable length character

create table yash3(name varchar(20),gender char(10));
insert into yash3 values('tushar','male'),('aman','male'),('shweta','female');
insert into yash3 values('raj        ','male        ');
select * from yash3;
select length(name),length(gender) from yash3;
-- char is white space is trunctae 
-- varchar do not turncate , only will upto the length of the column 
-- according use the length and truncate the white space

-- DDL 
-- create(table)
-- drop,truncate,alter

create table raj123(col int);

-- create a table using table(CTAS) 
create table actor_cp as
select first_name,last_name from sakila.actor;

select * from actor_cp;

drop table actor_cp; -- table structure and data both are deleted
select * from actor_cp;

create table actor_cp as
select first_name as fname,last_name as lname from sakila.actor
where actor_id between 10 and 14;

select * from actor_cp;

-- alter 
alter table actor_cp add column (salary int );

alter table actor_cp add constraint new_key primary key(fname); -- primary key add
desc actor_cp;

alter table actor_cp drop column lname; -- column drop

alter table actor_cp rename column salary to newsalary;
desc actor_cp;
select * from actor_cp;

-- DML
-- insert
-- update col=values
-- edit=prefrences=sql editor
-- delete is a dml operation
update actor_cp set newsalary=900;

update actor_cp set newsalary=800 where fname='UMA';
select * from actor_cp;













