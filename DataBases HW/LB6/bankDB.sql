
create database lab6;
use lab6;

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `acc_type` enum('card','deposite') DEFAULT NULL,
  `acc_balance` double DEFAULT NULL,
  `acc_number` varchar(50) NOT NULL,
  `acc_start_date` datetime NOT NULL,
  `acc_owner` int(11) DEFAULT NULL,
  PRIMARY KEY (`acc_number`),
  KEY `acc_owner` (`acc_owner`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`acc_owner`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `account` VALUES ('card',1000,'9112 3515 0809 9863','2017-11-30 10:39:32',1),('card',2000,'9112 7890 1298 3330','2017-11-30 10:39:55',1);


DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_op` int(11) DEFAULT NULL,
  `app_sender` varchar(50) DEFAULT NULL,
  `app_recipient` varchar(50) NOT NULL,
  `app_time` datetime DEFAULT NULL,
  `app_value` double DEFAULT NULL,
  `app_contr_number` double NOT NULL,
  PRIMARY KEY (`app_id`),
  KEY `app_op` (`app_op`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`app_op`) REFERENCES `operations` (`op_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `operations`;

CREATE TABLE `operations` (
  `op_id` int(11) NOT NULL AUTO_INCREMENT,
  `op_type` enum('refil','cut','transfer') DEFAULT NULL,
  PRIMARY KEY (`op_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(30) DEFAULT NULL,
  `person_surname` varchar(30) NOT NULL,
  `person_adress` varchar(50) DEFAULT NULL,
  `person_status` enum('regular','vip') DEFAULT NULL,
  `person_date` date NOT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `person` VALUES (1,'Alexander','Kushnerov','Minsk,Nezavisimosty 4','vip','1991-10-22');

