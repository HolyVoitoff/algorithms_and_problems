#create database LAB2;
#use lab2;

/*create table shop (
Aut_id int(8),
Author1 varchar(20),
Author2 varchar(20),
Title varchar(20),
ISBN int(11),
Prise float,
Cust_Name varchar(20),
Cust_Adress varchar(30),
Purch_Date date
)*/


/*insert into shop (
Aut_id,Author1,Author2,Title,ISBN,Prise,Cust_Name,Cust_Adress,Purch_Date)
values
(1,'David Sklar','Adam Tracht.','PHP Cookbook',0596101015,44.99,'Emma Brown','Rainbow,Los Angeles,90014','2009-03-03'),
(2,'Danny Goodman','','Dynamic HTML',0596527403,59.99,'Darren Ryder','Emily,Richmond,23219','2008-12-19'),
(3,'Hugh E.Williams','David Lane','PHP and MySQL',0596005436,44.95,'Earl B.Thurston','Gregory,Frankfort,40601','2009-06-22'),
(4,'David Sklar','Adam Tracht.','PHP Cookbook',0596101015,44.99,'Darren Ryder','Emily,Richmond,23219','2008-12-19'),
(5,'Rasmus Lerdorf','Kevin Tatroe','Programming PHP',0596006815,34.99,'David Miller','Cedar,Waltham,02154','2009-06-16')*/

#select * from shop;

#==============================1НФ==============================
/*create table buyer(   
buer_id int(8) primary key auto_increment,
name1 varchar(20),
adress varchar(30),
date1 date
)*/

/* добавим покупателей
insert into buyer (
buer_id, name1,adress,date1
) values
(1,'BONES','East Side, LA, st 220','1995-06-11')

insert into buyer (
name1,adress,date1
) values
('Night lovell','West Side, CA, av. 12','1935-02-9')
*/

#select Aut_id,Cust_Name ,Cust_Adress ,Purch_Date from shop


/*insert into buyer (
buer_id, name1,adress,date1
) values
(9,'XEXS','East Side, LA, st 220','1995-06-11')*/
#DELETE FROM buyer WHERE  buer_id = '1' OR buer_id ='2';# удаляется ток по id. хз почему


#select * from buyer; 
#ПОПРАВИМ ТАБЛИЦУ ПОКУПАТЕЛЕЙ

/*alter table buyer
add column state varchar(30),
add column street varchar(30),
add column index1 int(6)*/
/*update buyer
set state = substring_index(adress,',',1) where buer_id>0 */
/*update buyer
set adress = right(adress,length(adress)-length(state)-1) where buer_id>0 */

/*update buyer
set street = substring_index(adress,',',1) where buer_id>0 ;
update buyer
set adress = right(adress,length(adress)-length(street)-1) where buer_id>0 ;
update buyer
set index1 = substring_index(adress,',',1) where buer_id>0 ;
update buyer
set adress = right(adress,length(adress)-length(index1)-1) where buer_id>0 ;
alter table buyer drop column adress*/

#ALTER TABLE `buyer` CHANGE `state` `street` varchar(20);

/*create table adress
( state1 varchar(20), street varchar(30),index1 int(6) ) ;*/

/*insert into adress
(state1,street,index1) values ()*/;

 #select * from buyer;

/*create table writers (
writ_id int(8) primary key auto_increment,
author_1 varchar(20),
author_2 varchar(30)
);*/

/*insert into writers (
writ_id,author_1,author_2
) values ()*/

/*select Aut_id,Author1,Author2 from shop
group by Aut_id*/

#==============================2НФ==============================

/*create table Aut1 (
Author varchar(20),
Title varchar(20),
Prise varchar(20)
)*/

/*create table Aut2 (
Author varchar(20),
Title varchar(20),
Prise varchar(20)
)*/

/*insert into Aut1 (
author,title,prise
) values ();

insert into Aut2 (
author,title,prise
) values (); */

/*select Author1,title,prise from shop
group by title;

select Author2,title,prise from shop
group by title*/

/*create table isbn(
isbn int(11),
Prise varchar(20)
)*/

/*insert into isbn (
isbn,prise
) values ()*/


#select isbn,prise from shop group by isbn

#alter table buyer drop column buer_id 

#==============================2НФ==============================
/*
create table buyer_date(
Buyer_name varchar(20),
DOB date
);
/*insert into buyer_date (
Buyer_name,DOB
)*/

#select name1,date1 from buyer group by name1;

/*create table street_index(
street varchar(20),
PI varchar(20)
);

/*insert into street_index (
street,PI
)*/

#select street,index1 from buyer group by street;

/*create table title_aut1(
Author varchar(20),
Title varchar(20)
);

create table title_aut2(
Author varchar(20),
Title varchar(20)
);

/*insert into title_aut1 (
Author,title
)*/

#select Author,title from aut1 group by title

/*insert into title_aut2 (
Author,title
)*/

#select Author,title from aut2 group by title

