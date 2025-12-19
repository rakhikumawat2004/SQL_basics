use world;
-- numeric and date function 
select LifeExpectancy,round(LifeExpectancy) from country;

select 30.68, round(30.641,2);
select 30.68, round(30.647,2); 
-- 456.12 
-- 6=one place,5=10 place,4=100 place
-- 6=nearest 10, 0 y fir 10
-- 76
-- 0 yh 100
-- 176 200 yh 0
-- round=round of to nearest 10th place nearest 1000

select 6.0012,round(437.12,-2);
select 6.0012,round(5667.12,-3);
select 6.0012,round(417.12,-1);
select 6.0012,round(437.0012,2);
select 456.68,round(437.0172,2);
select 456.68,round(456.68,1);
select 456.68,round(457.68,2);
select 456.68,round(457.68,-2);

select 456.68,round(3653.68,1), truncate(3653.68,1);

select mod(10,3), ceil(4.000001) ,floor(4.99999), pow(2,4);

-- date function now=current date and time
select now(),current_timestamp(),current_date(),current_time();

-- add date function ==> by default date add,(month,year,time)
select now(),adddate(now(),2),adddate(now(),interval 2 month);
select now(),adddate(now(),2),adddate(now(),interval -2 month);

select now(),adddate(now(),2),adddate(now(),interval 2 year);
select now(),adddate(now(),-2),adddate(now(),interval -2 year);

select now(),subdate(now(),2);
select now(),adddate(now(),2),adddate(now(),interval 2 hour);

select now(),year(now());

-- extract year,month,weeek,hour, minute
select now(),extract( year from now() );
select now(),extract( month from now() );
select now(),extract( hour from now() );
select now(),extract( week from now() );

-- date formate=> extract but with a string (message)
select now(),extract( year from now() ), date_format(now(),'year is %y');
select now(),extract( year from now() ), date_format(now(),'year is %Y');
select now(),extract( year from now() ), date_format(now(),'year is %M');
select now(),extract( year from now() ), date_format(now(),'year is %m');






