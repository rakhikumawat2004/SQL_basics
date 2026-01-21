-- table
-- DDL statement()
-- create ,drop,alter,truncate

create database resgex1;
create table test1(sno int);  -- table create(sno column)

describe test1;

-- DML(insert data)
-- DML (insert, update,delete,merge)
insert into test1 values(10);
select * from test1;

insert into test1(sno) values(11);
select * from test1;

insert into test1(sno) values(20),(null),(30); -- 3 rows insert multiple values
select * from test1;

select count(sno),count(*) from test1;

create table test2(sno int not null,salary int);
insert into test2(sno,salary) values(20,1000);
insert into test2(sno,salary) values(20,null);
insert into test2(sno,salary) values(null,1000);-- we have a set constrant (have)
insert into test2(sno) values(1000);
insert into test2(salary) values(1000);-- error (because no null and no default set)

select * from test2;

create table test3(sno int not null default 80 ,salary int);
insert into test3(salary) values(1000);
insert into test3(sno) values(5000);

select * from test3;

-- unique
create table test4(sno int not null ,salary int unique default 100);
insert into test4(sno,salary) values(1000,20000);
insert into test4(sno,salary) values(1001,20000);
insert into test4(sno) values(700);
select * from test4;
insert into test4(sno) values(600);

select * from test4;



create table test5(sno int not null ,salary int unique default 100);
insert into test5(sno,salary) values(1000,20000);
insert into test5(sno,salary) values(1001,20000); -- error duplicates value
insert into test5(sno) values(700);

select * from test5;

insert into test5(sno) values(600); -- error 100 is value already in table

insert into test5(sno,salary) values(1001,null); -- multiple null values can inserted
insert into test5(sno,salary) values(1001224,null);

select * from test5;

--  check constraints
-- condition
-- check col_name and condition

create table test7(sno int,salary int,
check(sno between 1 and 100),
check(salary in (1000,2000)));

insert into test7(sno,salary) values(4,1000);
select * from test7;
insert into test7(sno,salary) values(150,1000);
insert into test7(sno,salary) values(90,1500);

drop table test7;

create table test7(sno int,salary int,
constraint regex_test7_sno_chk check(sno between 1 and 100), 
constraint regex_test7_salary_chk check(salary in (1000,2000)));

insert into test7(sno,salary) values(4,1000);
select * from test7;
insert into test7(sno,salary) values(150,1000);
insert into test7(sno,salary) values(90,1500);

create table employee(
emp_id int primary key,
emp_name varchar(50),
emp_email varchar(60) unique default 'abc@gmail.com',
college_name varchar(200) not null default 'abc',
emp_age int constraint emp_age_chk check(emp_age>18),
guardiant_name varchar(50) check(guardiant_name=reverse(guardiant_name)));

insert into employee(emp_id,emp_name,emp_email,college_name,emp_age,guardiant_name)
values (1,'Shweta Kumawat','xyz@gmail.com','rcert',20,'naman');

select * from employee;

















