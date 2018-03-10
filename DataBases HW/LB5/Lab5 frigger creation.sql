

DELIMITER //
create trigger stud_info_encrypter BEFORE INSERT ON studs
for each row 
begin
set new.address = aes_encrypt(new.address, 'googlemaps');
set new.telephone = aes_encrypt(new.telephone, 'googlemaps');
end //
DELIMITER ;

DELIMITER //
create trigger stud_info BEFORE UPDATE ON studs
for each row 
begin
set new.address = aes_encrypt(new.address, 'googlemaps');
set new.telephone = aes_encrypt(new.telephone, 'googlemaps');
end //
DELIMITER ;


insert into studs(
stud_name,stud_sex,dep_id,address,telephone
)
values
('Sinkevish Nasta','F',3, 'Sharangovisha, 80-25','332056856');


