use lab3;


drop table departmens;
drop table grand2;
drop table semestr2;
drop table studs;

delete from departmens;
delete from grand2;
delete from semestr2;
delete from studs;


insert into departmens(
dep_name,dep_phone,dep_room
)
values
('Веб-технологии','(17)209-53-61',423),
('Алгебра и защита информации','(17)209-50-49',414),
('Геометрия и топология','(17)209-51-23',416),
('Дифференциальные уравнения','(17)209-50-45',341),
('Математика и информатика','(17)209-50-48',420),
('Теоретическая и прикладная механика','(17)209-53-45',349);

insert into studs(
stud_name,stud_sex,dep_id
)
values
('Kurgey Evgeniy','M',1), ('Larioniv Vasiliy','M',1),
('Karpovich Dmitriy','M',2), ('Baranovskii Daria','F',6),
('Lutikova Alexandra','F',3), ('Sychnat Alexandr','M',4),
('Sveshnikova Diana','F',5), ('Gavris Maksim','M',6),
('Loshakov Sergey','M',4), ('Lybeshko Ivan','M',6),
('Sprinsyn Valiria','F',2), ('Polonina Yana','F',5),
('Myraviskii Eygenii','M',1), ('Kreidich Alexandra','F',1);

insert into Semestr2(
stud_id,mark_alg,mark_diff,mark_prog,mark_geom,mark_matan)
values
(1,7,6,8,6,7),(2,4,4,3,5,5),
(3,9,9,9,8,6),(4,7,8,7,9,10),
(5,3,4,4,3,5),(6,4,5,4,4,5),
(7,8,8,7,7,6),(8,10,10,9,10,10),
(9,3,5,5,5,6),(10,4,4,4,4,4),
(11,6,5,6,4,5),(12,7,5,4,6,7),
(13,2,2,2,2,2), (14,8,9,8,10,8);



select * from departmens;
select * from grand2;
select * from semestr2;
select * from studs;

select s.stud_id,s.stud_name as Имя, s.stud_sex as Пол,
d.dep_name as Кафедра,d.dep_phone as Телефон,d.dep_room as Аудитория, 
s2.mark_alg as Алг,s2.mark_diff as ДУ ,s2.mark_prog as Прога,s2.mark_geom as Геома,
s2.mark_matan as Матан,s2.GPA_2 as Средняя, g2.gr_size as 'Бабульки (:'
from studs as s 
inner join departmens as d on (s.dep_id = d.dep_id) 
inner join semestr2 as s2 ON (s.stud_id = s2.stud_id)
inner join grand2 as g2 ON (s.stud_id = g2.stud_id );

select d.dep_name, avg(s2.GPA_2) 
from semestr2 as s2
inner join studs as s on s.stud_id=s2.stud_id 
inner join departmens as d on s.dep_id=d.dep_id
group by d.dep_id;

