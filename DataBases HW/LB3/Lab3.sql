create database lab3;
use lab3;

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

#вычисление среднего бала 
update Semestr2 set GPA_2=(mark_alg+mark_diff+mark_prog+mark_geom+mark_matan)/5;

#вычисление размера стипендии
insert into grand2(
stud_id,gpa_2,gr_size)
select stud_id,gpa_2,if(mark_alg<4 or mark_diff<4 or
mark_prog<4 or mark_geom<4 or mark_matan<4,0,if(gpa_2<5,0,if(gpa_2>=5 and gpa_2<6,70,if(gpa_2>=6 and gpa_2<7,80,
if(gpa_2>=7 and gpa_2<8,90,if(gpa_2>=8 and gpa_2<9,100,if(gpa_2>=9 and gpa_2<=10,110,'Incorrectly')))))))
from semestr2;





