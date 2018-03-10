select c.Population *(
select cl.Percentage
from country as c
inner join
countrylanguage as cl
on c.Code = cl.CountryCode
where cl.language = 'Russian' and c.name = 'Belarus')/100  as number_of from country as c
Where c.name = 'Belarus'