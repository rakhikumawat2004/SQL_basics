select * from actor_cp;

update actor_cp set lname="goyal" where fname ="ZERO";
select * from actor_cp;

-- delete from actor_cp;
select * from actor_cp;

 truncate actor_cp;
 
-- truncate is a DDl statement do not provide any condition
-- cannot the data reverd data=>rollbse
-- in case if you executed DDl statement donot use rollback

-- delete is a DMl statement do  provide any condition
-- we can use rollback in delete

-- object=> a structure that can be use store,manage and refer the data.
-- drop vsdelete vs truncate?

-- windows function 
-- it is use to perform the calculation on set of rows.
-- windows functions are use to apply set of rows with refernce to current row.
-- it measurely three parts
-- over=> to apply the function over a window(a set of rows)

use world;
select * from country;

select code,name,population from country;

select code,name,continent,
population,(select sum(population) from country) from country;

-- over is to apply logic to set of rows and  each row show the  particular value
select code,name,continent,population, 
sum(population) over() from country;

select code,name,continent,population, 
sum(population) over(), avg(population) 
over() from country;


-- partition by=>same as group by which is use to apply logic into groups
select code,name,continent,population, 
sum(population) over(partition by continent)
from country;

select code,name,continent,population, 
sum(population) over(partition by name)
from country;


-- running sum,cumulative sum
-- use order by

select code,name,continent,population, 
sum(population) over(order by population)patient_records
from country;



