select * from events;
select * from ticket_sales;

-- 1 Find the total quantity sold per event_id.
select event_id,sum(qty)from ticket_sales group by event_id;

-- 2 Find the total revenu per event_id.
select event_id,sum(qty*price_per_ticket) as total_revenu from ticket_sales group by event_id;

-- 3 Find monthly total revenue (group by month of sale_date). 
select month(sale_date),sum(qty*price_per_ticket) as total_revenu from ticket_sales group by month(sale_date);

-- 4 Find the maximum price_per_ticket per event_id.
select event_id,max(price_per_ticket) from ticket_sales group by event_id;

-- 5 Find total revenue per month and ticket_type.
select month(sale_date),ticket_type,sum(qty*price_per_ticket) as total_revenu from ticket_sales group by month(sale_date),ticket_type;

-- 6 List all sales with event_name and sale_date. sale_id event_name sale_date
select ts.sale_id,e.event_name,month(ts.sale_date) from events as e join ticket_sales as ts where e.event_id=ts.event_id; 

-- 7 Show event_name, ticket_type, qty for each sale.
select ts.ticket_type,e.event_name,ts.qty from events as e join ticket_sales as ts 
where e.event_id=ts.event_id;

-- 8 Show sales where the event city is Mumbai. sale_id event_name city sale_date
select e.event_name,e.city,ts.sale_date,ts.sale_id from events as e join ticket_sales as ts  
ON e.event_id = ts.event_id where e.city in ('mumbai');

-- 9 Show all events and matching sales.event_name sale_id sale_date
select e.event_name,e.city,ts.sale_date,ts.sale_id from events as e inner
join ticket_sales as ts ON e.event_id = ts.event_id;

-- 10 Show distinct event names that have at least one sale. event_name
select distinct e.event_name from events as e 
join ticket_sales as ts ON e.event_id = ts.event_id and sale_id is not null;

-- 11 Show each sale’s computed revenue with event name. sale_id event_name revenue
select ts.sale_id,e.event_name,(ts.qty * ts.price_per_ticket) as total_revenu 
from events as e join ticket_sales as ts ON e.event_id = ts.event_id;

-- 12 Find total quantity per event_name. event_name total_qty
select e.event_name,sum(ts.qty)from events as e join
ticket_sales as ts ON e.event_id = ts.event_id group by e.event_name;

-- 13 Find total VIP revenue per event_name. event_name vip_revenue
select e.event_name,sum(qty*price_per_ticket)as vip_revenue 
from events as e join ticket_sales as ts ON e.event_id = ts.event_id 
where ts.ticket_type = 'VIP' group by e.event_name;

-- 14 Find monthly revenue per city. city sale_month total_revenue
select e.city,month(ts.sale_date) as sale_month,sum(ts.qty*ts.price_per_ticket)as total_revenue from events as
e join ticket_sales as ts ON e.event_id = ts.event_id group by sale_month,e.city order by e.city;

-- 15 Find total quantity per city and ticket_type. city ticket_type total_qty
select e.city,ts.ticket_type,sum(ts.qty) from events as e join ticket_sales as ts
on e.event_id=ts.event_id group by e.city,ts.ticket_type order by e.city;

-- 16 Find sales that happened on the latest sale_date in the table. sale_id event_id sale_date ticket_type qty price_per_ticket
select sale_id,event_id,sale_date,ticket_type,qty,price_per_ticket
from ticket_sales where sale_date=(select max(sale_date) from ticket_sales);

-- 17 Find sales where revenue is greater than the overall average sale revenue.
select sale_id,event_id,(qty*price_per_ticket) as revenu from ticket_sales 
 where (qty*price_per_ticket)>(select avg(qty*price_per_ticket) from ticket_sales);

-- 18 Find events that have at least one VIP sale. event_id event_name
select distinct e.event_id,e.event_name from events as e join ticket_sales as ts
on e.event_id=ts.event_id where ts.ticket_type='VIP';

-- 19 Find events in cities that have at least one VIP sale.event_id event_name city
-- Hint: subquery will use the joins
 select event_id,event_name,city from events where city in
 (select e.city from events as e join ticket_sales as ts on e.event_id=ts.event_id
  where ts.ticket_type='VIP');

-- 20 Find events that have at least one sale in February 2025. event_id event_name city
 select distinct e.event_id,e.event_name,e.city from events as e join ticket_sales as ts 
 on e.event_id=ts.event_id where monthname(sale_date) ='February'and year(sale_date)='2025';

-- 21 For each event, return the highest price_per_ticket sale row.sale_id event_id sale_date ticket_type qty price_per_ticket
-- Hint: read the question twice
select * from ticket_sales where (event_id,price_per_ticket) in
(select event_id,max(price_per_ticket) from ticket_sales group by event_id);

-- 22 Show monthly total revenue and monthly total quantity, but only include months
-- where total revenue is at least 10,000. sale_month total_qty total_revenue
select month(sale_date) as sale_month,sum(qty) as total_qyt,sum(qty*price_per_ticket) as total_revenue
from ticket_sales group by month(sale_date) having total_revenue>=10000;

-- 23 Show month-wise count of sales rows, but only include months 
-- that have at least 3 sales rows. sale_month sales_rows
select month(sale_date) as sale_month,count(*) as sales_rows from ticket_sales
group by month(sale_date) having sales_rows>=3 order by month(sale_date);

-- 24 Show average revenue per sale row per month, but only 
-- include months where average sale revenue is above 4000.


-- 25 Show revenue per month and ticket_type, but only include groups 
-- where total revenue is at least 5000. sale_month ticket_type total_revenue

