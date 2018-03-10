use lab3;

alter table studs add address blob;
alter table studs add telephone blob;

UPDATE lab3.studs SET address=aes_encrypt('Chailitko,15-1','googlemaps'), telephone=aes_encrypt('291234567','googlemaps') WHERE stud_id='1';
UPDATE lab3.studs SET address=aes_encrypt('Krasnaya,18-25','googlemaps'), telephone=aes_encrypt('331234567','googlemaps') WHERE stud_id='2';
UPDATE lab3.studs SET address=aes_encrypt('Nezavisimosti,25-12','googlemaps'), telephone=aes_encrypt('441234567','googlemaps') WHERE stud_id='3';
UPDATE lab3.studs SET address=aes_encrypt('Aerodromaja,17-61','googlemaps'), telephone=aes_encrypt('251234567','googlemaps') WHERE stud_id='4';
UPDATE lab3.studs SET address=aes_encrypt('Aerodromaja,17-62','googlemaps'), telephone=aes_encrypt('297654321','googlemaps') WHERE stud_id='5';
UPDATE lab3.studs SET address=aes_encrypt('Gorodsoy Val,56-84','googlemaps'), telephone=aes_encrypt('337654321','googlemaps') WHERE stud_id='6';
UPDATE lab3.studs SET address=aes_encrypt('Syxarevskaya,36-7','googlemaps'), telephone=aes_encrypt('+447654321','googlemaps') WHERE stud_id='7';
UPDATE lab3.studs SET address=aes_encrypt('Germanovskaya,15-88','googlemaps'), telephone=aes_encrypt('257654321','googlemaps') WHERE stud_id='8';
UPDATE lab3.studs SET address=aes_encrypt('Mayakovskogo,8-108','googlemaps'), telephone=aes_encrypt('291622082','googlemaps') WHERE stud_id='9';
UPDATE lab3.studs SET address=aes_encrypt('Gurt\'eva,12-43','googlemaps'), telephone=aes_encrypt('251527156','googlemaps') WHERE stud_id='10';
UPDATE lab3.studs SET address=aes_encrypt('Lenina,19-72','googlemaps'), telephone=aes_encrypt('291523702','googlemaps') WHERE stud_id='11';
UPDATE lab3.studs SET address=aes_encrypt('Lobanka, 48-14','googlemaps'), telephone=aes_encrypt('331257146','googlemaps') WHERE stud_id='12';
UPDATE lab3.studs SET address=aes_encrypt('Kiseleva,81-25','googlemaps'), telephone=aes_encrypt('258892565','googlemaps') WHERE stud_id='14';


select s.stud_id,s.stud_name as Имя,
d.dep_name as Кафедра, aes_decrypt(address,'googlemaps') as Адрес, aes_decrypt(telephone,'googlemaps') as Телефон
from studs as s 
inner join departmens as d on (s.dep_id = d.dep_id) ;


UPDATE lab3.studs SET address='Nezavisti 4' WHERE stud_id='1'