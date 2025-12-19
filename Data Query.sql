show databases;

-- to create the database(to organize data);
create database tata;
show databases;

use tata;

-- to see tables
show tables;

create table nexon(price int,color char(20));

use world;
show tables;

-- to see column of table country;
describe country;

-- print
select*from country;

-- to see three columns
select name,region,population from country;

-- any order you can print column
select name,population,region from country;

-- any mathematical work
select name,population,region,population-500 from country;

SELECT name,population,
region,population-500
from country;

select * from country;
 
 -- to filter we use WHERE clause
 select * from country where continent='Asia';
 
  select * from country where IndepYear=1984;
  
  select name,continent,indepyear from country where indepyear=1991;
  
  select * from country where continent in ('Asia','Africa');
  
  select name,continent,indepyear from country where indepyear in (1960,1991);  
  
  select * from country where indepyear between 1960 and 1991;
  
  select * from country where region != 'Southern Europe';  
  
  select name, continent,population*0.1 as populations from country;
  
  select*from country where LifeExpectancy in (75 ,77.4 ,63.7);
  
  select name continent,population,region from country where  population not between 5000 and 300000;
  
  -- like operator
  -- match the pattern 
  -- name --> letter start,letter include,letter end
  -- percentage( % )--> special character ,wild card character
  -- % --> zeroor more character
  -- ___( underscore ): only one character
  select * from country where name like 'A%';
  
  select * from country where name like 'An%';
  
  select * from country where name like '%a';
  
  select * from country where name like '%r';
  
  select * from country where name like '%r%';
  
  select * from country where name like '%ru%';
  
  select * from country where name not like '%ru%';  
  
  select * from country where name like 'Ir__';
  
  select * from country where name like 'Ira_'; 
  
  select * from country where name like '____';
  
  select * from country where name like '_u__';
  
  select * from country where name like '_u%';
  
  select * from country where name like '_u_%';
  
  select * from country where name like '_ua%';
  
  select name,continent from country where continent like 'N%';
  
  select name,continent from country where continent like '%p_';
  
  select name,continent from country where continent like '____';
  
  select name,continent,region from country where region like '_a%a_';
  
  select name,continent,region from country where region like '__c%sia';
  
  select name,continent,region from country where region in  ('North America','South America');
  
  -- basic functions
  
  
  
 
 
    
  