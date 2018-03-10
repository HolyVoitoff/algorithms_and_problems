use lab4;


CREATE VIEW v1 (name, surname)
 AS
 SELECT std_name, std_srn
 FROM studs 
 WHERE dep_id=3;
 
CREATE VIEW v2 (name, surname)
 AS
 SELECT std_name, std_srn
 FROM studs AS s, exams AS ex
 WHERE ex.std_id=s.std_id AND sub_id=2;
 
CREATE VIEW v3 (dep_id, dep_name, avg_score, sub_name)
 AS
 SELECT sub.dep_id, dep.dep_name, ROUND(AVG(ex.ex_mark), 2) AS avg_score, sub.sub_name FROM subjects AS sub
   LEFT JOIN exams AS ex ON ex.sub_id = sub.sub_id
   LEFT JOIN departments AS dep ON dep.dep_id = sub.dep_id
   GROUP BY (sub.sub_id);


select * from departments;

SELECT dep_id AS depid, dep_name, COUNT(*) AS qty_all,
       (SELECT COUNT(*) FROM v3 WHERE avg_score > 7 AND v3.dep_id = depid) AS qty_above_7
  FROM v3
  WHERE dep_id IS NOT NULL
  GROUP BY dep_id
  HAVING qty_all/2 < qty_above_7;
 
CREATE VIEW v4 (Sex, Avg_PE )
 AS 
 SELECT s.sex, AVG(ex.ex_mark)
 FROM studs AS s, exams AS ex
 WHERE s.std_id=ex.std_id AND ex.sub_id=6
 GROUP BY s.sex;
 

CREATE VIEW v5 (floor, avg_score)
 AS
 SELECT SUBSTRING(dep_room,1,1) as flr, ROUND(AVG(ex.ex_mark), 2) AS avg_score FROM departments AS dep
   LEFT JOIN subjects AS sub ON sub.dep_id = dep.dep_id
   LEFT JOIN exams AS ex ON ex.sub_id = sub.sub_id
   GROUP BY flr;
   
   
SELECT st.std_id AS stdid, st.dep_id, dep.dep_name, dep.dep_floor AS std_floor, st.std_name, st.std_srn, floor, v5.avg_score,
  (SELECT COUNT(*) FROM exams AS ex WHERE ex.std_id = stdid AND ex.ex_mark > v5.avg_score) AS qty_ex 
  FROM studs AS st
  JOIN departments AS dep ON dep.dep_id = st.dep_id
  JOIN v5 ON floor = dep.dep_floor
  HAVING qty_ex > 2;


CREATE VIEW v6
AS
select temp.dep_name,  ROUND(sum(temp.bad) / count(1)*100,2) as percent from (
SELECT d.dep_name, s.std_name, s.std_srn, max(ex.ex_mark < 4) as bad FROM exams AS ex,studs AS s, departments as d WHERE s.std_id = ex.std_id and d.dep_id = s.dep_id
group by s.std_id
) as temp
group by temp.dep_name;


CREATE VIEW v7(name, surname, subid, mark, stipend)
AS
SELECT s.std_name, s.std_srn, ex.sub_id, ex.ex_mark, s.stipend
FROM studs AS s, exams AS ex
WHERE s.std_id=ex.std_id;
