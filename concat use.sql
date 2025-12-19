  -- basic functions
  -- functions string
  -- case conversion
  use world;
  select name,upper(name),lower(name) from country;
  
  select name,code,concat(name,'-',code) from country;
  
  select name,code,concat(name,'-',code,'-','ans') from country;
  
  select name,code,concat(name,'$',code,'Shweta'),
  concat_ws('$',name,code,'shweta')from country;
  
  select name,code,concat(name,' ',code) from country
   where concat(name,' ',code)='Afghanistan AFG';
  
  -- north europe  europe
  -- where like %europe
  -- region like concat('%',continent)
  select name ,region,continent from country
  where region like concat('%',continent);
  
  select name,region from country where name like region;
  
  select name,region from country where name = region;
  
  select name, left(name,1) from country;
  
  select name, continent from country
  where left(continent,1)=left(name,1);
  
  select name, substr(name,1) from country;
  
  select name, substr(name,2,4) from country;
  
  select name, substr(name,-1) from country;
  
  select name, substr(name,-4,2) from country;
  
  select name, continent,substr(name,1,1),substr(continent,1,1)
  from country where substr(name,1,1)=substr(continent,1,1);
  
  select 8 from country where substr(name,1,3);
  
  select name, population from country where substr(name,1,3)='alg';
    
  select name, instr(name,'e') from country;
  
  select name,char_length(name) from country;
  
  select '    tushar ';
  select char_length('    tushar ');
  
  select char_length( trim('    tushar ') );
  select char_length( rtrim('    tushar ') );
  select char_length( ltrim('    tushar ') );
  
  select trim('    tuszzharzzzz');
  select trim( both 'z' from '    tuszz harzzzz' );
  
  select name,trim( both 'a' from name) from country;
  select name,trim( both 'A' from name) from country;
  select name,trim( both 'a' from trim(both 'A' from name)) from country;
  
-- lpad and rpad
-- when we want to define a column with fixed size
   select name,population,rpad(population,9,'#') from country; 
   select name,population,lpad(population,9,0) from country;
   
   select name, replace(name,'a','') from country;
  
-- numeric and date function 
  
  
  