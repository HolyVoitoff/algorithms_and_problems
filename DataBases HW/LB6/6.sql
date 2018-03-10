use lab4;
SELECT s.std_name as имя, s.std_srn as фамилия ,group_concat(distinct ex.ex_mark order by ex.std_id ASC separator ', ') as оценки, s.avg_score as средний_балл
FROM studs AS s 
inner join exams AS ex on s.std_id=ex.std_id 
inner join subjects as sub on sub.sub_id = ex.sub_id
group by s.std_name

;


SELECT s.std_name as имя, s.std_srn as фамилия , group_concat(distinct ex.ex_mark  ORDER by ex.ex_id ASC separator ',  ') as оценки
FROM studs AS s 
inner join exams AS ex on s.std_id=ex.std_id 
inner join subjects as sub on sub.sub_id = ex.sub_id
;

