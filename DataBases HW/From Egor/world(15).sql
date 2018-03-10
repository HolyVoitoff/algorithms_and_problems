
select c.name,c.Continent,temp.maxgnp
from (select country.continent,max(country.gnp)as maxgnp
from country
group by country.continent
)as temp,country as c
where c.continent =temp.continent and c.gnp=temp.maxgnp
and temp.maxgnp>0