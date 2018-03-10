use cw2;

select * from company;

select * from pass_in_trip;

select * from trip;


create view day_trip_count
as
select c.name as 'Название компании',count( p.name) as 'Дневные рейсы' from trip as t 
inner join company as c on c.ID_comp = t.ID_comp 
inner join pass_in_trip as pit on t.trip_no = pit.trip_no
inner join passenger as p on pit.ID_psg = p.ID_psg where t.time_out between '1900-01-01 12:00:00' and '1900-01-01 17:59:00'
group by c.name;

create view evening_trip_count
as
select c.name as 'Название компании',count( p.name) as 'Вечерние рейсы' from trip as t 
inner join company as c on c.ID_comp = t.ID_comp 
inner join pass_in_trip as pit on t.trip_no = pit.trip_no
inner join passenger as p on pit.ID_psg = p.ID_psg where t.time_out between '1900-01-01 18:00:00' and '1900-01-01 22:59:00'
group by c.name;

create view night_trip_count
as
select c.name as 'Название компании',count( p.name) as 'Ночные рейсы' from trip as t 
inner join company as c on c.ID_comp = t.ID_comp 
inner join pass_in_trip as pit on t.trip_no = pit.trip_no
inner join passenger as p on pit.ID_psg = p.ID_psg where t.time_out between '1900-01-01 23:00:00' and '1900-01-01 23:59:00'
group by c.name;

create view morning_trip_count
as
select c.name as 'Название компании',count( p.name) as 'Утренние рейсы' from trip as t 
inner join company as c on c.ID_comp = t.ID_comp 
inner join pass_in_trip as pit on t.trip_no = pit.trip_no
inner join passenger as p on pit.ID_psg = p.ID_psg where t.time_out between '1900-01-01 05:00:00' and '1900-01-01 11:59:00'
group by c.name;







use db1;
select  category as 'Категория', count(FID) as 'Количество' from film_list
group by category;





drop database task3;
create database task3;
use task3;

CREATE TABLE IF NOT EXISTS triangles (
  id INT NOT NULL ,
  vertA_Xcord DOUBLE NOT NULL,
  vertA_Ycord DOUBLE NOT NULL,
  vertB_Xcord DOUBLE NOT NULL,
  vertB_Ycord DOUBLE NOT NULL,
  vertC_Xcord DOUBLE NOT NULL,
  vertC_Ycord DOUBLE NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

drop trigger is_correct;

Delimiter //

CREATE  trigger is_correct before insert on riangles
for each row
begin
set @side_a=SQRT(POW((new.vertA_Xcord - new.vertB_Xcord),2) + POW((new.vertA_Ycord - new.vertB_Ycord),2));
set @side_b=SQRT(POW((new.vertB_Xcord - new.vertC_Xcord),2) + POW((new.vertB_Ycord - new.vertC_Ycord),2));
set @side_c=SQRT(POW((new.vertC_Xcord - new.vertA_Xcord),2) + POW((new.vertC_Ycord - new.vertA_Ycord),2));

if (@side_a+@side_b<=@side_c or 
    @side_a+@side_c<=@side_b or 
    @side_b+@side_c<=@side_a) then 
    
signal sqlstate '02000' set message_text="INCORRECTLY";
end if;
end//

Delimiter ;



select * from triangles;

INSERT INTO `task3`.`Triangles` (`id`, `vertA_Xcord`, `vertA_Ycord`, `vertB_Xcord`, `vertB_Ycord`, `vertC_Xcord`, `vertC_Ycord`) VALUES ('1', '1', '1', '1', '6', '5', '1');

create view right_triangles
as
select * from triangles WHERE
POW(SQRT(POW((vertA_Xcord - vertB_Xcord),2) + POW((vertA_Ycord - vertB_Ycord),2)),2) + 
POW(SQRT(POW((vertB_Xcord - vertC_Xcord),2) + POW((vertB_Ycord - vertC_Ycord),2)),2) = 
POW(SQRT(POW((vertC_Xcord - vertA_Xcord),2) + POW((vertC_Ycord - vertA_Ycord),2)),2)  
OR
POW(SQRT(POW((vertA_Xcord - vertB_Xcord),2) + POW((vertA_Ycord - vertB_Ycord),2)),2) + 
POW(SQRT(POW((vertC_Xcord - vertA_Xcord),2) + POW((vertC_Ycord - vertA_Ycord),2)),2) = 
POW(SQRT(POW((vertB_Xcord - vertC_Xcord),2) + POW((vertB_Ycord - vertC_Ycord),2)),2)
OR
POW(SQRT(POW((vertB_Xcord - vertC_Xcord),2) + POW((vertB_Ycord - vertC_Ycord),2)),2)  + 
POW(SQRT(POW((vertC_Xcord - vertA_Xcord),2) + POW((vertC_Ycord - vertA_Ycord),2)),2) = 
POW(SQRT(POW((vertA_Xcord - vertB_Xcord),2) + POW((vertA_Ycord - vertB_Ycord),2)),2)  
;

INSERT INTO `task3`.`triangles` (`id`, `vertA_Xcord`, `vertA_Ycord`, `vertB_Xcord`, `vertB_Ycord`, `vertC_Xcord`, `vertC_Ycord`) 
VALUES ('2', '0', '0', '1', '1', '2', '2');