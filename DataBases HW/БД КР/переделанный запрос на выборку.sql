
USE world;

# Выведите название столицы, и количество официальных языков для каждой страны.
select t2.country,t2.city,t1.lang
from (select c.name,count(cl.language) as lang,c.code as code
from country as c
inner join
countrylanguage as cl
on c.code=cl.countrycode
where cl.isofficial='T'
group by c.name) as t1
inner join
(select c.name as country,ci.name as city,ci.id as id,c.code as code
from country as c
inner join city as ci
on c.capital=ci.id) as t2
on t1.code=t2.code
group by t2.country