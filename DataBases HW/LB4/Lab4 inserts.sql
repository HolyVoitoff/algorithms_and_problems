use lab4;


INSERT INTO departments (dep_id, dep_name, dep_phone, dep_room,dep_floor) VALUES
(1,'Rfatlhf алгебра и защита информации','(17)209-50-49',428,4),
(2,'Кафедра геометрии и топологии','(17)209-51-23',417,4),
(3,'Кафедра дифференциальных уравнений','(17)209-50-45',341,3),
(4,'Кафедра веб-программирования','(17)209-53-61',298,2),
(5,'Кафедра теории функции','(17)209-53-45',408,4);


select * from studs;
INSERT INTO studs (std_id,std_name,std_srn,sex,dep_id) VALUES 
(1,'Evgeniy','Kurgey','M',1),
(2,'Alexandr','Karpovich','M',2),
(3,'Diana','Sveshnikova','F',1),
(4,'Yana','Polonina','F',2),
(5,'Ivan','Lybeshko','M',3),
(6,'Sergey','Loshakov','M',4),
(7,'Elizaveta','Lutikova','F',3),
(8,'Daria','Larina','F',4),
(9,'Maksim','Gavris','M',5),
(10,'Alexandra','Kreidich','F',5)
;

UPDATE lab4.studs SET std_adr=aes_encrypt('Chailitko,15-1','googlemaps'), std_phone=aes_encrypt('291234567','googlemaps') WHERE std_id='1';
UPDATE lab4.studs SET std_adr=aes_encrypt('Krasnaya,18-25','googlemaps'), std_phone=aes_encrypt('331234567','googlemaps') WHERE std_id='2';
UPDATE lab4.studs SET std_adr=aes_encrypt('Nezavisimosti,25-12','googlemaps'), std_phone=aes_encrypt('441234567','googlemaps') WHERE std_id='3';
UPDATE lab4.studs SET std_adr=aes_encrypt('Aerodromaja,17-61','googlemaps'), std_phone=aes_encrypt('251234567','googlemaps') WHERE std_id='4';
UPDATE lab4.studs SET std_adr=aes_encrypt('Aerodromaja,17-62','googlemaps'), std_phone=aes_encrypt('297654321','googlemaps') WHERE std_id='5';
UPDATE lab4.studs SET std_adr=aes_encrypt('Gorodsoy Val,56-84','googlemaps'), std_phone=aes_encrypt('337654321','googlemaps') WHERE std_id='6';
UPDATE lab4.studs SET std_adr=aes_encrypt('Syxarevskaya,36-7','googlemaps'), std_phone=aes_encrypt('+447654321','googlemaps') WHERE std_id='7';
UPDATE lab4.studs SET std_adr=aes_encrypt('Germanovskaya,15-88','googlemaps'), std_phone=aes_encrypt('257654321','googlemaps') WHERE std_id='8';
UPDATE lab4.studs SET std_adr=aes_encrypt('Mayakovskogo,8-108','googlemaps'), std_phone=aes_encrypt('291622082','googlemaps') WHERE std_id='9';
UPDATE lab4.studs SET std_adr=aes_encrypt('Gurt\'eva,12-43','googlemaps'), std_phone=aes_encrypt('251527156','googlemaps') WHERE std_id='10';


INSERT INTO subjects VALUES
(1,'Алгебра', 1),
(2,'Геометрия', 2),
(3,'Компьютерная математика', 3),
(4,'Программирование', 4),
(5,'Математический анализ', 5),
(8,'ТФКП', 5);


select * from studs;
INSERT INTO exams VALUES
(1,6,1,1),
(2,4,2,1),
(3,7,3,1),
(4,9,4,1),
(5,7,5,1),
(6,7,1,2),
(7,4,2,2),
(8,6,3,2),
(9,9,4,2),
(10,8,5,2),
(11,9,1,3),
(12,2,2,3),
(13,4,3,3),
(14,7,4,3),
(15,3,5,3),
(16,9,1,4),
(17,4,2,4),
(18,6,3,4),
(19,4,4,4),
(20,8,5,4),
(21,9,1,5),
(22,4,2,5),
(23,6,3,5),
(24,4,4,5),
(25,2,5,5);



EXPLAIN SELECT s.std_name, s.std_srn FROM studs AS s
    WHERE s.sex = 'F' AND 
    NOT EXISTS (SELECT * FROM exams AS ex WHERE s.std_id = ex.std_id AND ex.ex_mark < 4);
CREATE INDEX exams_std_id_mark ON exams (std_id, ex_mark);

DROP INDEX exams_std_id_mark ON exams;
EXPLAIN SELECT s.std_name, s.std_srn FROM studs AS s
    WHERE s.sex = 'F' AND 
    NOT EXISTS (SELECT * FROM exams AS ex WHERE s.std_id = ex.std_id AND ex.ex_mark < 4);


EXPLAIN SELECT dep_name, sub_name FROM departments AS dep
          JOIN subjects AS sub ON sub.dep_id = dep.dep_id;

CREATE INDEX subjects_dep_id ON subjects (dep_id);

EXPLAIN SELECT dep_name, sub_name FROM departments AS dep
          JOIN subjects AS sub ON sub.dep_id = dep.dep_id;

