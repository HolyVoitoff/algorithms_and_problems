
USE lab6;


ALTER TABLE account
  ADD COLUMN acc_number_b VARBINARY(100);
UPDATE account
  SET acc_number_b = AES_ENCRYPT(acc_number, 'Key');
ALTER TABLE account
  DROP COLUMN acc_number;
ALTER TABLE account
  CHANGE COLUMN acc_number_b acc_number VARBINARY(100);


ALTER TABLE appointment
  ADD COLUMN app_sender_b VARBINARY(100),
  ADD COLUMN app_recipient_b VARBINARY(100);
UPDATE appointment
  SET app_sender_b = AES_ENCRYPT(app_sender, 'Key'),
      app_recipient_b = AES_ENCRYPT(app_recipient, 'Key');
ALTER TABLE appointment
  DROP COLUMN app_sender,
  DROP COLUMN app_recipient;
ALTER TABLE appointment
  CHANGE COLUMN app_sender_b app_sender VARBINARY(100),
  CHANGE COLUMN app_recipient_b app_recipient VARBINARY(100);


CREATE VIEW account_history (ah_owner, ah_number, ah_time, ah_op, ah_value, ah_sender)
 AS
 SELECT acc_owner, CAST(AES_DECRYPT(acc_number, 'Key') AS CHAR(50)) AS ah_number, 
        app_time, app_op, app_value, CAST(AES_DECRYPT(app_sender, 'Key') AS CHAR(50)) AS ah_sender
 FROM account AS acc
 LEFT JOIN appointment AS app 
   ON CAST(AES_DECRYPT(app.app_recipient, 'Key') AS CHAR(50)) = CAST(AES_DECRYPT(acc.acc_number, 'Key') AS CHAR(50));

DELIMITER //
CREATE TRIGGER tr_account_insert BEFORE INSERT ON account
FOR EACH ROW
BEGIN
  SET NEW.acc_number = AES_ENCRYPT(NEW.acc_number, 'Key');
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_account_update BEFORE UPDATE ON account
FOR EACH ROW
BEGIN
  IF CAST(AES_DECRYPT(OLD.acc_number, 'Key') AS CHAR(50)) != CAST(AES_DECRYPT(NEW.acc_number, 'Key') AS CHAR(50)) THEN
    SET NEW.acc_number = AES_ENCRYPT(NEW.acc_number, 'Key');
  END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_appointment_insert BEFORE INSERT ON appointment
FOR EACH ROW
BEGIN
  SET NEW.app_sender = AES_ENCRYPT(NEW.app_sender, 'Key');
  SET NEW.app_recipient = AES_ENCRYPT(NEW.app_recipient, 'Key');
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER tr_appointment_update BEFORE UPDATE ON appointment
FOR EACH ROW
BEGIN
  IF CAST(AES_DECRYPT(OLD.app_sender, 'Key') AS CHAR(50)) != CAST(AES_DECRYPT(NEW.app_sender, 'Key') AS CHAR(50)) THEN
    SET NEW.app_sender = AES_ENCRYPT(NEW.app_sender, 'Key');
  END IF;

  IF CAST(AES_DECRYPT(OLD.app_recipient, 'Key') AS CHAR(50)) != CAST(AES_DECRYPT(NEW.app_recipient, 'Key') AS CHAR(50)) THEN
    SET NEW.app_recipient = AES_ENCRYPT(NEW.app_recipient, 'Key');
  END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE get_accounts(IN accnumber varchar(50))
BEGIN
  SELECT acc_type, acc_balance, CAST(AES_DECRYPT(acc_number, 'Key') AS CHAR(50)) AS accnumber, acc_start_date, acc_owner
    FROM account
    WHERE accnumber IS NULL OR CAST(AES_DECRYPT(acc_number, 'Key') AS CHAR(50)) = accnumber;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE get_appointments(IN accnumber varchar(50))
BEGIN
  SELECT app_id, app_op, app_time, app_value, 
         CAST(AES_DECRYPT(app_sender, 'Key') AS CHAR(50)) AS appsender,
		 CAST(AES_DECRYPT(app_recipient, 'Key') AS CHAR(50)) AS apprecipient,
         app_contr_number
    FROM appointment
    WHERE accnumber IS NULL OR CAST(AES_DECRYPT(app_sender, 'Key') AS CHAR(50)) = accnumber OR
		CAST(AES_DECRYPT(app_recipient, 'Key') AS CHAR(50)) = accnumber;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE refil(IN apprecipient varchar(50),
                       IN appvalue double,
                       IN appcontrnumber double)
BEGIN
  START TRANSACTION;
  
  UPDATE account
    SET acc_balance = acc_balance+appvalue
    WHERE CAST(AES_DECRYPT(acc_number, 'Key') AS CHAR(50)) = apprecipient;
  
  INSERT INTO appointment (app_op, app_recipient, app_time, app_value, app_contr_number)
    VALUES (1, apprecipient, NOW(), appvalue, appcontrnumber);
  
  COMMIT;
END //
DELIMITER ;

CALL refil('9112 3515 0809 9863', 100, '123');
CALL get_accounts('9112 3515 0809 9863');
CALL get_appointments(NULL);

DELIMITER //
CREATE PROCEDURE cut(IN apprecipient varchar(50),
                     IN appvalue double,
                     IN appcontrnumber double)
BEGIN
  START TRANSACTION;
  
  UPDATE account
    SET acc_balance = acc_balance-appvalue
    WHERE CAST(AES_DECRYPT(acc_number, 'Key') AS CHAR(50)) = apprecipient;
  
  INSERT INTO appointment (app_op, app_recipient, app_time, app_value, app_contr_number)
    VALUES (2, apprecipient, NOW(), appvalue, appcontrnumber);
  
  COMMIT;
END //
DELIMITER ;

CALL cut('9112 3515 0809 9863', 100, '123');
CALL get_accounts('9112 3515 0809 9863');
CALL get_appointments(NULL);

DELIMITER //
CREATE PROCEDURE transfer(IN appsender varchar(50),
                          IN apprecipient varchar(50),
                          IN appvalue double,
                          IN appcontrnumber double)
BEGIN
  DECLARE rows_affected INT;

  START TRANSACTION;
    
  UPDATE account
    SET acc_balance = acc_balance-appvalue
    WHERE CAST(AES_DECRYPT(acc_number, 'Key') AS CHAR(50)) = appsender;
  
  SET rows_affected = ROW_COUNT();
  IF rows_affected != 0 THEN
    UPDATE account
      SET acc_balance = acc_balance+appvalue
      WHERE CAST(AES_DECRYPT(acc_number, 'Key') AS CHAR(50)) = apprecipient;
  END IF;
  
  INSERT INTO appointment (app_op, app_sender, app_recipient, app_time, app_value, app_contr_number)
    VALUES (3, appsender, apprecipient, NOW(), appvalue, appcontrnumber);
  
  COMMIT;
END //
DELIMITER ;

CALL transfer('9112 7890 1298 3330', '9112 3515 0809 9863', 100, '123');
CALL get_accounts(NULL);
CALL get_appointments(NULL);

CALL transfer('9112 7890 1298 3333', '9112 3515 0809 9863', 1000, '123');
CALL get_accounts(NULL);
CALL get_appointments(NULL);

select * from account;


