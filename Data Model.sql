use world;
select * from city;
describe city;
select * from country;

-- city(id primary key) , country code  is the forien key
select count(code),count(distinct code) from country;
-- code (primary key)

select cy.id,cy.name,cy.countrycode from city as cy;
select cnt.code,cnt.name,cnt.continent from country as cnt;

-- join
select cy.id,cy.name,cy.countrycode,cnt.code,
cnt.name,cnt.continent 
from city as cy
join
country as cnt
where cy.countrycode=cnt.code;

select ct.name,ct.population,ctry.name,
ctry.governmentform from city as ct
join
country as ctry
where ct.countrycode=ctry.code;

select*from countrylanguage;

select cot.name,cot.population,ctlg.language,
ctlg.percentage from country as cot
join
countrylanguage as ctlg
where cot.code=ctlg.countrycode;





