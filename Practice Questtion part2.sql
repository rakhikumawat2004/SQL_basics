use world;
-- how many countries are there is countthe population
-- between 8000 and 70000
select continent,population,
case 
    when population between 8000 and 70000 then 'true'
    end as 'status' from country;
    
    select continent,
count(case 
    when population between 8000 and 70000 
    then 1 else 0
    end) as 'status' from country
    group by continent;
    
    select continent,
sum(case 
    when population between 8000 and 70000 
    then 1 else 0
    end) as 'status' from country
    group by continent;
    
    select continent,
sum(case 
    when continent='North America',population between 8000 and 70000 
    then 1 else 0
    end) as 'status' from country
    group by continent;      