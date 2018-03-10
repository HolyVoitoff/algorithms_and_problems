select c.name
 from country as c
 where (select ci.Population from city as ci where ci.ID = c.Capital) > 
(select avg(ci.Population) from city as ci Where ci.CountryCode = c.Code)