select c.name
from country as c
inner join
countrylanguage as cl
on c.Code =cl.CountryCode
group by c.name
having count(cl.Language)=1