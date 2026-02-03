use sakila;

create table test100 as select actor_id,first_name from actor where actor_id between 1 and 10;

select * from test100;
desc test100; -- no primary key

explain select * from test100 where actor_id=5;

-- indexs like datastruture which is use access our the data in a faster way rather than searching the data
-- types of index=> cluster index and non-culster index

-- culster index=> data arrange in asc order ya sorted way
-- ek hi table ma cluster index ho sakta h

insert into test100 values('14','abc'),('13','def'),('11','aman'),('12','shubham');
select * from test100;

-- alter statement
alter table test100 add primary key(actor_id);
select * from test100;

explain select * from test100 where first_name='NICK';

-- drop table test100;
-- non cluster index=>it create another column

create index indx1 on test100(actor_id);
show index from test100;
-- drop table indx1-- ;
explain select * from test100 where actor_id=5;


explain select * from test100 where first_name='aman';  
insert into test100 values('12','abc');
insert into test100 values('15','abc');

show index from test100;

drop index indx1 on test100;
show index from test100;

create index indx_composite on test100(actor_id,first_name);
show index from test100;

explain select * from test100 where actor_id>10 and first_name='abc';

explain select * from test100 where actor_id>15 and first_name='abc';

insert into test100 values('104','john'),('103','johin'),('101','johsh'),('102','johhv');
select * from test100;

drop index indx_composite on test100;
show index from test100;

-- starting index three charactors ke according banaynge

create index index_3_chr on test100(first_name(3));
show index from test100;
explain select * from test100 where first_name='JOHNNY';
explain select * from test100 where first_name='JOH';
select * from test100;

explain select * from test100 where first_name like'JOH%';

-- partial index=> subset of rows
explain select * from test100 where first_name like'alic%';

-- read the index 

