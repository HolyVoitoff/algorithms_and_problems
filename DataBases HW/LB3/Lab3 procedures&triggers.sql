use lab3;



/*1.Хранимая процедура для получения всех студенток, которые закончили сессию без
пересдач.*/

Delimiter //
create procedure 1_TopGirlsOnFaculty ()
begin 
select s.stud_name as Студентка ,s2.mark_alg as Алг,s2.mark_diff as ДУ ,s2.mark_prog as Прога,s2.mark_geom as Геома,
s2.mark_matan as Матан
from semestr2 as s2
inner join studs as s
on
s.stud_id=s2.stud_id
where stud_sex='F' and s2.mark_alg>=4 and s2.mark_diff>=4 and s2.mark_prog>=4 
and s2.mark_geom>=4 and s2.mark_matan>=4;
end//
Delimiter ;



/*2.Хранимая процедура для получения 3-ёх лучших студентов какой-либо кафедры по
среднему баллу.*/

Delimiter //
CREATE PROCEDURE 2_Top3Students()

BEGIN
SELECT d.dep_name as 'Специальность', s.stud_name as 'Студент', s2.GPA_2 as 'Средний балл'
FROM studs as s
INNER JOIN semestr2 as s2 ON s.stud_id=s2.stud_id
INNER JOIN departmens as d ON s.dep_id =d.dep_id
ORDER BY s2.GPA_2 DESC LIMIT 3;
END //
Delimiter ;



/*3.Хранимая процедура для изменения размера стипендии каждого студента в
зависимости от среднего балла.*/

Delimiter //
create procedure 3_RichBitch(in n float)
begin 
select
if(n<5,0,
if(n>=5 and n<6,70,
if(n>=6 and n<7,80,
if(n>=7 and n<8,90,
if(n>=8 and n<9,100,
if(n>=9 and n<=10,110,'incorrectly')))))) as 'Эт тебе на бухлишко (:';
END//
Delimiter ;



create table dep_gpa(
departmen varchar(40),
gpa float(4)
) engine = MYISAM;



/*4.Выведите средний балл студентов по каждой из кафедр. С помощью курсора,
запишите эти данные в отдельную таблицу.*/

Delimiter //
create procedure 4_DepRaiting()
begin 

declare departmen varchar(40);
declare gpa float;
declare is_end int default 0;
declare curs cursor for 

select d.dep_name , avg(s2.GPA_2) 
from semestr2 as s2
inner join studs as s on s.stud_id=s2.stud_id 
inner join departmens as d on s.dep_id=d.dep_id
group by d.dep_id;

declare continue handler for not found set is_end=1;
open curs;
addition:loop
fetch curs into departmen ,gpa ;
if is_end then leave addition;
end if;
insert into lab3.dep_gpa values(departmen ,gpa);
end loop addition;
close curs;
select * from dep_gpa;
delete from dep_gpa;
end//
Delimiter ;



/*5.Хранимая процедура для получения всех студентов, получивших пересдачу, по
каждому из предметов.*/

Delimiter //
create procedure 5_SoldiersDontCry()
begin 
select s.stud_name as 'Повезёт в другой раз'
from studs as s
inner join semestr2 as sem
on s.stud_id=sem.stud_id
where 
sem.mark_alg<4 or sem.mark_geom<4 or sem.mark_prog<4 or 
sem.mark_diff<4 or sem.mark_matan<4;
end//
Delimiter ;



/*6.Хранимая процедура для отчисления студента и удаления всех упоминаний о нём.*/ 

Delimiter //
create procedure 6_BurnMotherfucker()
begin 
declare exp_id int(3);
declare is_end int default 0;

declare curs cursor for 
select d.stud_id from semestr2,
(select stud_id,if(s.mark_alg<4,1,0) as a,if(s.mark_geom<4,1,0) as g,if(s.mark_prog<4,1,0) as p,
if(s.mark_matan<4,1,0) as m,if(s.mark_diff<4,1,0) as d
from semestr2 as s
) as d
where (d.a+d.g+d.d+d.p+d.m)>=3
group by stud_id;
declare continue handler for not found set is_end = 1; 

open curs;
deleting:loop
fetch curs into exp_id;
if is_end then leave deleting;
end if;
delete from studs where stud_id=exp_id;
delete from grand2 where stud_id=exp_id;
end loop deleting;
close curs;

end//
Delimiter ;

Delimiter //
create procedure 7_RepeatPlease ()
begin 


drop table departmens;
drop table grand2;
drop table semestr2;
drop table studs;

create table departmens(
dep_id int(5) primary key auto_increment,
dep_name varchar(40),
dep_phone varchar(20),
dep_room int(3)
);

create table studs(
stud_id int(8) primary key auto_increment,
stud_name varchar(30),
stud_sex enum('M','F'),
dep_id int(5) 
);


create table Semestr2(
sem2_id int(8) primary key auto_increment,
stud_id int(8),
mark_alg int(3),
mark_diff int(3),
mark_prog int(3),
mark_geom int(3),
mark_matan int(3),
GPA_2 float
);

create table grand2 (
gr2_id int(8) primary key auto_increment,
stud_id int(8),
gpa_2 float,
gr_size int(5)
);

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

update Semestr2 set GPA_2=(mark_alg+mark_diff+mark_prog+mark_geom+mark_matan)/5;

#вычисление размера стипендии
insert into grand2(
stud_id,gpa_2,gr_size)
select stud_id,gpa_2,if(mark_alg<4 or mark_diff<4 or
mark_prog<4 or mark_geom<4 or mark_matan<4,0,if(gpa_2<5,0,if(gpa_2>=5 and gpa_2<6,70,if(gpa_2>=6 and gpa_2<7,80,
if(gpa_2>=7 and gpa_2<8,90,if(gpa_2>=8 and gpa_2<9,100,if(gpa_2>=9 and gpa_2<=10,110,'Incorrectly')))))))
from semestr2;

end//
Delimiter ;



Delimiter //
create procedure 8_ShowMeWhatInsideYou ()
begin 
select s.stud_id,s.stud_name as Имя, s.stud_sex as Пол,
d.dep_name as Кафедра,d.dep_phone as Телефон,d.dep_room as Аудитория, 
s2.mark_alg as Алг,s2.mark_diff as ДУ ,s2.mark_prog as Прога,s2.mark_geom as Геома,
s2.mark_matan as Матан,s2.GPA_2 as Средняя, g2.gr_size as 'Бабульки (:'
from studs as s 
inner join departmens as d on (s.dep_id = d.dep_id) 
inner join semestr2 as s2 ON (s.stud_id = s2.stud_id)
inner join grand2 as g2 ON (s.stud_id = g2.stud_id );
end//
Delimiter ;



/*Триггер для автоматического подсчёта количества поступающих студентов.*/

Delimiter //
create trigger count_set after insert on studs
for each row
begin 
set @n=@n+1;
end//
Delimiter ;



/*Триггер для проверки данных об оценках на экзамене на корректность.*/

Delimiter //
create trigger count_sets after insert on semestr2
for each row
begin 
if (new.mark_alg<0 or new.mark_alg>10 or new.mark_geom>10 or
new.mark_geom<0 or new.mark_prog<0
or new.mark_prog>10 or new.mark_diff<0 or new.mark_diff>10 or new.mark_matan<0 or new.mark_matan>10) then
signal sqlstate '02000' set message_text="INCORRECTLY";
end if;
end//
Delimiter ;



/*Триггер, реализующий потерю стипендии при пересдаче, а также её
восстановлении, в случае исправления оценки.*/

Delimiter //
create trigger grand after update on semestr2
for each row
begin
if (new.mark_geom<4 ) then update semestr2
set grand2=0 where semestr2.sem2_id=new.sem2_id;
elseif (new.mark_geom>=4 ) then update semestr2
set grand2=20 where semestr2.sem2_id=new.sem2_id;
end if;
end//
Delimiter ;