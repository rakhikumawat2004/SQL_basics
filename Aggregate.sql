-- aggregate function(multiple line function)=>will give you some result
-- distinct
-- distinct(continent)

use world;
select*from country;

select distinct continent from country;

select distinct continent , region from country;

-- aggregate=> to apply some calculation over set of rows
-- count(col)=> only data present will be counted
select count(indepyear) from country;
select count(*) from country;

select count(population),sum(population) from country;
select count(population),avg(population) from country;
select min(population),max(population) from country;

select count(continent) from country;
select count(continent),count(distinct continent) from country;

select count(indepyear),count(*) from country where continent='Asia';

select count(name),count(region),avg(LifeExpectancy),sum(population)
 from country where indepyear > (1947) and indepyear < (1998);
 
 select count( distinct name ,region),sum(population),
 max(LifeExpectancy),count(region) from country where name like 'a%' or name like 'd%';
 
  select count(name) ,count( distinct region),sum(population),
 max(LifeExpectancy),sum(capital) from country where name like 'A%' or name like 'D%';
 
 select count(name) from country where continent='asia';
 
-- groupby statement=> similar value to calculate / collect karne in a group
select continent from country group by continent;
-- select name from country group by name;

select continent , count(name) from country group by continent;

-- jis colimn ma grop by use kiya vhi column hi select kar sakte h but 
-- directly another column select nhi kar sakte handler

 select count(name),sum(population),indepyear from country group by indepyear;

use world;
select continent , count(name) from country group by continent;

select continent,count(name) from country group by continent;

select count(name) from country where continent='asia' and indepyear>1950;
select continent,count(name) from country where indepyear>1950 group by continent;

select * from country;

select continent , count(name) from country 
group by continent having count(name)>30;

select continent , sum(population) from country group by continent;

select continent , sum(population) from country
group by continent having sum(population)>0;

select continent , sum(population) from country
group by continent having sum(population)>30401150;

select indepyear ,count(name)  from country group by indepyear;

select indepyear ,count(name)  from country 
where indepyear>1930 group by indepyear;

select indepyear ,count(name)  from country where 
indepyear>1930 group by indepyear having count(name);

select count(name),GovernmentForm from country 
group by GovernmentForm having count(name)>20;

select count(capital),continent from country 
group by continent having count(capital)>30;

select GovernmentForm,count(name) from country
where capital>30 group by GovernmentForm;

select continent,count(name),count(region),sum(population) from country
where LifeExpectancy>38 group by continent having sum(population)>30401150;

select * from country;



 
 






