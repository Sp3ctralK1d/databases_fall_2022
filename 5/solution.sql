SELECT
  c.name,
  d.name,
  c.city,
  d.charge
from
  dealer as d full
  outer join client as c on d.id = c.dealer_id;

SELECT
  c.name,
  c.city,
  d.id,
  charge
from
  dealer as d
  inner join client as c on d.id = c.dealer_id
where
  charge > 0.12;

SELECT
  c.name,
  c.city,
  s.id,
  s.date,
  s.amount,
  d.name,
  d.charge
from
  client as c
  inner join dealer as d on d.id = c.dealer_id
  inner join sell s on c.id = s.client_id;

SELECT
  c.name,
  c.priority,
  d.name,
  s.id,
  s.amount
from
  client as c
  join dealer as d on d.id = c.dealer_id
  join sell as s on c.id = s.client_id
where
  s.amount > 2000
  and c.priority is not null;

--2--
create view view1 as
select
  count(distinct c.id),
  avg(s.amount),
  sum(s.amount),
  s.date
from
  client as c
  inner join sell as s on c.id = s.client_id
group by
  s.date
order by
  s.date;

select
  *
from
  view1;

create view view2 as
SELECT
  sum(amount),
  date
from
  sell
group by
  date
order by
  sum(amount) desc
limit
  5;

select
  *
from
  view2;

create view view3 as
SELECT
  COUNT(d.id),
  AVG(s.amount),
  SUM(s.amount),
  d.name,
  d.id
from
  sell as s
  join dealer as d on s.dealer_id = d.id
group by
  d.name,
  d.id;

select *
from
  view3;

create view view4 as
SELECT
  d.id,
  name,
  location,
  charge * sum(s.amount)
from
  dealer as d
  inner join sell as s on d.id = s.dealer_id
group by
  d.id,
  name,
  location,
  charge;

select
  *
from
  view4;

create view view5 as
SELECT
  COUNT(s.dealer_id),
  AVG(s.amount),
  SUM(s.amount),
  d.location
from
  dealer as d
  join sell as s on d.id = s.dealer_id
group by
  d.location;

select
  *
from
  view5;

create view view6 as
SELECT
  COUNT(s.client_id),
  AVG(s.amount),
  SUM(s.amount - c.priority),
  c.city
from
  sell as s
  join client c on s.client_id = c.id
group by
  c.city;

select
  *
from
  view6;

create view view7 as
SELECT
  c.city
from
  client as c
  join sell s on c.id = s.client_id
where
  c.priority > s.amount;

select
  *
from
  view7;