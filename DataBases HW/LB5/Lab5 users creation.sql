use lab3;

#DROP USER 'student'@'localhost';
CREATE USER 'student'@'localhost' IDENTIFIED BY 'googlemaps1';
GRANT select ON lab3.* TO 'student'@'localhost';

#DROP USER 'rewriter'@'localhost';
CREATE USER 'rewriter'@'localhost' IDENTIFIED BY 'googlemaps2';
GRANT select, update, insert ON lab3.* TO 'rewriter'@'localhost';

DROP USER 'decanat_worker'@'localhost';
CREATE USER 'decanat_worker'@'localhost' IDENTIFIED BY 'googlemaps3';
GRANT GRANT OPTION ON lab3.* TO 'decanat_worker'@'localhost';

CREATE USER 'entranceCommisr'@'localhost' IDENTIFIED BY 'googlemaps4';
GRANT insert ON lab3.studs TO 'entranceCommis'@'localhost';

CREATE USER 'DEworker'@'localhost' IDENTIFIED BY 'googlemaps5';
GRANT insert,select ON lab3.semestr2 TO 'DEworker'@'localhost';

CREATE USER 'DB_struct_editor'@'localhost' IDENTIFIED BY 'googlemaps6';
GRANT ALL PRIVILEGES ON *.* TO 'DB_struct_editor'@'localhost';


DROP USER 'test_admin'@'localhost';
CREATE USER 'test_admin'@'localhost' IDENTIFIED BY '11111';
GRANT Create user ON *.* TO 'test_admin'@'localhost' with grant option;


FLUSH PRIVILEGES;