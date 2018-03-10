CREATE VIEW account_history1 (ah_owner, ah_number, ah_time, ah_op, ah_value, ah_sender,ah_type, ah_balance)
 AS
 SELECT acc_owner, CAST(AES_DECRYPT(acc_number, 'Key') AS CHAR(50)) AS ah_number, 
        app_time, app_op, app_value, CAST(AES_DECRYPT(app_sender, 'Key') AS CHAR(50)) AS ah_sender, app_op as ah_type, acc_balance as ah_balance
 FROM account AS acc
 LEFT JOIN appointment AS app 
   ON CAST(AES_DECRYPT(app.app_recipient, 'Key') AS CHAR(50)) = CAST(AES_DECRYPT(acc.acc_number, 'Key') AS CHAR(50));
   
   SELECT * FROM account_history1
   WHERE ah_number='9112 3515 0809 9863';
   CALL refil('9112 3515 0809 9863',400,'123');