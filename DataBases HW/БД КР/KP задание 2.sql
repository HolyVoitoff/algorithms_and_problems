USE world;

# Выведите название столицы, и количество официальных языков для каждой страны.
SELECT co.Name AS COUNTRY , ci.Name AS CAPITAL , COUNT(clang.CountryCode) AS OFFICIAL_LANG 
FROM country AS co, city AS ci, countrylanguage AS clang 
WHERE (co.Capital = ci.ID OR ISNULL(co.Capital)) AND co.Code = clang.CountryCode AND clang.IsOfficial = 'T' 
GROUP BY country

# Выведите названия стран Южной Америки, в которых среднее население по стране 
# превосходит значение (M1+M2)/2, где М1-наименьшее население города на континенте, 
# М2 – наибольшее население города на континенте.

/*SELECT t2.Name FROM (SELECT MIN(ci.Population) AS min , MAX(ci.Population) AS max 
FROM country AS co INNER JOIN city AS ci ON co.Code = ci.CountryCode 
WHERE co.Continent = "South America" 
GROUP BY co.Continent) AS t1 , (SELECT co.Name , AVG(ci.Population) AS average FROM country AS co INNER JOIN city AS ci ON ci.CountryCode = co.Code 
WHERE co.Continent = "South America" 
GROUP BY co.Name) AS t2 
WHERE t2.average < (t1.min + t1.max)/2;*/