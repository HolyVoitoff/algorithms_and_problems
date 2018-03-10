
-- -----------------------------------------------------
drop database lab4;
CREATE DATABASE lab4;
USE lab4;
drop database lab4;

CREATE TABLE departments(
dep_id INT PRIMARY KEY,
dep_name VARCHAR(50),
dep_phone VARCHAR(50),
dep_room SMALLINT,
dep_floor SMALLINT
);


CREATE TABLE exams(
ex_id INT PRIMARY KEY,
ex_mark INT,
sub_id INT,
std_id INT
);


CREATE TABLE studs(
std_id INT PRIMARY KEY,
std_name VARCHAR(30),
std_srn VARCHAR(30),
dep_id INT,
avg_score FLOAT DEFAULT 0,
sex ENUM('M','F'),
stipend INT(11) NULL DEFAULT 0,
std_adr VARBINARY(100) NULL DEFAULT NULL,
std_phone VARBINARY(100) NULL DEFAULT NULL); 


CREATE TABLE subjects(
sub_id INT PRIMARY KEY,
sub_name VARCHAR(30),
dep_id INT
);



