create table customer(c_id int,c_name varchar(20));
insert into customer values(10,'aman'),(11,'shubham');

create table orders(o_id int,city varchar(20));
insert into orders values(1009,'jaipur'),(10010,'goa');

drop table customer;
drop table orders;

create table customer(c_id int primary key,c_name varchar(20));
insert into customer values(10,'aman'),(11,'shubham');

create table orders(o_id int primary key,city varchar(20),c_id int,foreign key(c_id) references customer(c_id));
insert into orders values(1009,'jaipur',10),(10010,'goa',11),(10011,'J&K',10);

select * from customer;
select * from orders;

create table orders(o_id int primary key,city varchar(20),c_id int,foreign key(c_id) references customer(c_id));
insert into orders values(1009,'jaipur',10),(10010,'goa',11),(10011,'J&K',10),(9123,'japan',90);









