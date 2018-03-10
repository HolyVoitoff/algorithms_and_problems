use finalproject;



select * from players;

#=========================================PLAYERS====================================================================================
INSERT INTO `finalproject`.`players` (`player_id`, `name`, `surname`, `city`) VALUES ('1', 'Леонид', 'Якубович', 'Москва');
INSERT INTO `finalproject`.`players` (`player_id`, `name`, `surname`, `city`) VALUES ('2', 'Анастасия', 'Бритикова', 'Минск');
INSERT INTO `finalproject`.`players` (`player_id`,`name`, `surname`, `city`) VALUES ('3','Александр', 'Кушнеров', 'Минск');
INSERT INTO `finalproject`.`players` (`player_id`,`name`, `surname`, `city`) VALUES ('4','Даниил', 'Ишутин', 'Киев');
INSERT INTO `finalproject`.`players` (`player_id`,`name`, `surname`, `city`) VALUES ('5','Даниил', 'Поперечный', 'Санкт-Петербург');
INSERT INTO `finalproject`.`players` (`player_id`,`name`, `surname`, `city`) VALUES ('6','Амер', 'аль-Баркави', 'Амман');
INSERT INTO `finalproject`.`players` (`player_id`,`name`, `surname`, `city`) VALUES ('7','Роман', 'Кушнарёв', 'Новосибирск');
INSERT INTO `finalproject`.`players` (`player_id`,`name`, `surname`, `city`) VALUES ('8','Екатерина', 'Чеботарь', 'Уфа');



select * from customers;

#=========================================CUSTOMERS====================================================================================

INSERT INTO `finalproject`.`customers` (`customer_id`,`name`, `surname`, `city`) VALUES ('1', 'Илья', 'Ильюк', 'Киев');
INSERT INTO `finalproject`.`customers` (`customer_id`,`name`, `surname`, `city`) VALUES ('2','Тони', 'Старк', 'Нью-Йорк');
INSERT INTO `finalproject`.`customers` (`name`, `surname`, `city`) VALUES ('Пеппер ', 'Подс', 'Нью-Йорк');
INSERT INTO `finalproject`.`customers` (`name`, `surname`, `city`) VALUES ('Виталий', 'Громяко', 'Венеция');
INSERT INTO `finalproject`.`customers` (`name`, `surname`, `city`) VALUES ('Анастасия', 'Синкевич', 'Минск');
INSERT INTO `finalproject`.`customers` (`name`, `surname`, `city`) VALUES ('Дмитрий', 'Ларин', 'Санкт-Петербург');
INSERT INTO `finalproject`.`customers` (`name`, `surname`, `city`) VALUES ('Александра', 'Крейдич', 'Минск');
INSERT INTO `finalproject`.`customers` (`name`, `surname`, `city`) VALUES ('Андрей', 'Красовский', 'Санкт-Петербург');
INSERT INTO `finalproject`.`customers` (`name`, `surname`, `city`) VALUES ('Дмитрий', 'Комаровский', 'Тель-Авив');
INSERT INTO `finalproject`.`customers` (`customer_id`, `name`, `surname`, `city`) VALUES ('1000', 'Поле', 'Чудес', 'Москва');



select * from staff;

#=========================================STAFF====================================================================================
INSERT INTO `finalproject`.`staff` (`guide_id`, `name`, `surname`) VALUES ('1', 'Ангелина', 'Пашкевич');
INSERT INTO `finalproject`.`staff` (`name`, `surname`) VALUES ('Ксения', 'Чеботарь');
INSERT INTO `finalproject`.`staff` (`name`, `surname`) VALUES ('Мариан', 'Толочко');
INSERT INTO `finalproject`.`staff` (`name`, `surname`) VALUES ('Николай', 'Аленский');



select * from tours;

#=========================================TOURS====================================================================================

INSERT INTO `finalproject`.`tours` (`tour_id`, `name`, `date`, `ticket_cost`, `tour_organization_cost`, `guide_id`) VALUES ('1', 'Тестовая экскурсия', '2016-08-24', '5', '15', '4');
INSERT INTO `finalproject`.`tours` (`tour_id`, `name`, `date`, `ticket_cost`, `tour_organization_cost`, `guide_id`) VALUES ('2', 'Экскурсия 1', '2016-08-25', '7', '20', '2');



select * from organizations;

INSERT INTO `finalproject`.`organizations` (`organization_id`, `name`, `city`) VALUES ('1000', 'Поле Чудес', 'Москва');
INSERT INTO `finalproject`.`organizations` (`organization_id`, `name`, `city`) VALUES ('1', 'Московский Зоопарк', 'Москва');
INSERT INTO `finalproject`.`organizations` (`organization_id`, `name`, `city`) VALUES ('2', 'Краевой Музей', 'Смоленск');



select * from gifts;

INSERT INTO `finalproject`.`gifts` (`gift_id`, `name`, `cost`, `buyer_id`, `donated_to_org_id`, `donater_player_id`) VALUES ('1', 'Бурый медведь Аркадий', '2550', '1000', '1', '3');
INSERT INTO `finalproject`.`gifts` (`gift_id`,`name`, `cost`, `buyer_id`, `donated_to_org_id`, `donater_player_id`) VALUES ('2','Водка Absolute с ароматом зачёта по БД', '45', '1000', '1000', '3');
INSERT INTO `finalproject`.`gifts` (`gift_id`,`name`, `cost`, `buyer_id`, `donated_to_org_id`, `donater_player_id`) VALUES ('3','Матрёшка ручной работы', '30', '1000', '1000', '5');
INSERT INTO `finalproject`.`gifts` (`gift_id`,`name`, `cost`, `buyer_id`, `donated_to_org_id`, `donater_player_id`) VALUES ('4','Балалайка ручной работы', '150', '1000', '1000', '6');




select * from gift_specification;

INSERT INTO `finalproject`.`gift_specification` (`gift_spec_id`, `is_unique`, `is_sold`, `is_dotaned`, `gift_type`, `gift_id`) VALUES ('1', '1', '0', '1', '2', '1');
INSERT INTO `finalproject`.`gift_specification` (`gift_spec_id`, `is_unique`, `is_sold`, `is_dotaned`, `gift_type`, `gift_id`) VALUES ('2', '1', '0', '0', '1', '2');
INSERT INTO `finalproject`.`gift_specification` (`gift_spec_id`, `is_unique`, `is_sold`, `is_dotaned`, `gift_type`, `gift_id`) VALUES ('3', '1', '0', '0', '0', '3');
INSERT INTO `finalproject`.`gift_specification` (`gift_spec_id`, `is_unique`, `is_sold`, `is_dotaned`, `gift_type`, `gift_id`) VALUES ('4', '1', '0', '0', '0', '4');




