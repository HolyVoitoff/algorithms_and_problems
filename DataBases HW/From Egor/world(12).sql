select c.name ,c.Code
from country as c
where right (c.name,1)=right(c.Code,1)
and left(c.name,1)=left(c.code,1);
