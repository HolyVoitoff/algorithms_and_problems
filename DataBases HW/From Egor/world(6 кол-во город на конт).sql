select c.Continent,count(ci.Name)
from country as c,city as ci
group by c.Continent