select c.name
from country as c
where c.SurfaceArea>(select SurfaceArea from 
country where name ='Belarus')
