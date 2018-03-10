  select c.Name, ci.Name
  from country as c
  
inner join city as ci
  
where c.Capital=ci.ID
