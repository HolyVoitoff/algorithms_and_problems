select count(c.name)as number_of 
from country as c
where (select count(ci.name)
from city as ci where
ci.CountryCode = c.Code)=1
