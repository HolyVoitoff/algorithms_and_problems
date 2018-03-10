#USE world;

#1.Выведите список всех стран и столиц.
/*SELECT country.name,city.name
FROM country inner join city ON country.code = city.countrycode
where city.id=country.Capital;*/

#2.Выведите список всех стран с населением более 10 млн. человек
#SELECT country.name FROM country WHERE Population > 10000000;

#3.Выведите список всех стран Европы, ВНП которых превышает 3000.
/*SELECT c.name AS Страна , c.GNP AS ВВП
FROM country AS c WHERE GNP > 3000 AND continent = 'Europe';*/

#4.Сколько стран мира используют русский язык?
/*SELECT COUNT(name) AS Количество FROM country AS c INNER JOIN countrylanguage AS cl ON c.code = cl.CountryCode
WHERE Language = 'Russian';*/

#5.Найдите среднее население в городах каждой страны.
/*SELECT c.name, AVG(ci.Population ) 
FROM country as c INNER JOIN city AS ci ON c.Code=ci.CountryCode
GROUP BY c.name;*/

#6.Найдите количество городов на каждом континенте
/*SELECT c.Continent AS CONTINENT, COUNT(ci.Name) AS CITYs
FROM city AS ci INNER JOIN country AS c ON ci.CountryCode = c.Code
GROUP BY c.Continent;*/


#=======================JUST FOR LULZ ======================================
/*SELECT c.Code,
c.Name AS СТРАНА, c.Population AS НАСЕЛЕНИЕ_СТРАНЫ, ci.Name AS ГОРОД, 
ci.Population AS НАСЕЛЕНИЕ_ГОРОДА, cl.Language AS ЯЗЫК, cl.IsOfficial AS ОФ, 
c.GNP AS ВВП, c.Continent AS КОНТИНЕНТ, c.IndepYear AS ГОД_ОСНОВАНИЯ
FROM city AS ci
INNER JOIN country AS c ON ci.CountryCode = c.Code 
INNER JOIN countrylanguage AS cl ON c.Code = cl.CountryCode
WHERE
 #c.IndepYear > 0 AND
 #c.IndepYear IS NOT NULL AND 
 cl.IsOfficial = 'T' AND
 c.capital = ci.ID
GROUP BY c.Name;*/
#===========================================================================

#7.Найдите страны, в которых население столицы превышает среднее население
#по городам страны. (используйте вложенный запрос)
/*SELECT c.name, ci.Name
FROM 
country AS c INNER JOIN city AS ci
ON ci.CountryCode = c.code
WHERE ci.id IN
(
SELECT c.capital
FROM country AS c
) AND ci.population<(c.Population-ci.Population)
GROUP BY (c.name)*/

#8.Сколько стран представлены в таблице, только своими столицами
/*select count(c.name)
from country as c,
city as ci
where ci.CountryCode=c.code and ci.id in
( # список IDшников столиц
select c.capital
from country as c
) having count(ci.name)=1;*/

#9.Найдите все страны, в которых используют 1 язык.
/*select c.name
from country as c
inner join
countrylanguage as cl
on c.code=cl.countrycode
group by(c.Name)
having count(cl.Language)=1;*/

#10.Найдите страны по площади превышающие Республику Беларусь.
/*select c.name
from country as c, country as b
where c.SurfaceArea > b.SurfaceArea and b.Name="Belarus";*/

#10.
/*select c.name AS СТРАНА
from country as c,
( #вычисление площади РБ
select co.SurfaceArea
from country as co
where co.name="Belarus"
) as b
where c.SurfaceArea>b.SurfaceArea ;*/

#11.Найдите страны, названия которых начинаются с буквы «A».
/*select c.name
from country as c
where c.name like 'A'; # OR left(c.name,1)='A' */

#12.Найдите страны, в которых код страны и название страны начинаются и заканчиваются одинаково.
/*select c.name, c.Code
from country as c
where left(c.name,1)=left(c.code,1) and 
right(c.name,1)=right(c.code,1);*/


#13. Какое количество населения используют русский язык в Республике Беларусь?
/*select cl.Percentage/100*c.Population as rus
from country as c
inner join
countrylanguage as cl
on c.Code=cl.CountryCode
where cl.language="Russian" and c.Name="Belarus";*/

#14.Выведите список всех стран, которые получили независимость в 20-ом веке.
/*select c.Name,c.IndepYear
from country as c
where c.IndepYear<2000 and c.IndepYear>=1900 
group by (c.Name);*/

#15. Найдите страны с максимальным ВНП на каждом континенте.
/*select cntr.Continent, cntr.name, temp.maxgnp
from 
(
select country.continent, max(country.gnp) as maxgnp
from country
group by country.continent
) as temp, country as cntr
where 
cntr.continent = temp.continent and 
cntr.gnp = temp.maxgnp and 
temp.maxgnp > 0*/

