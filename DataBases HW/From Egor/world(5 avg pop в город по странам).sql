select ci.name,avg(ci.Population)
from city as ci
group by ci.name