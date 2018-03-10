use lab4;

DELIMITER //
CREATE TRIGGER tr_validate_ex_mark_3_2_insert BEFORE INSERT ON exams
FOR EACH ROW
BEGIN
  IF (new.ex_mark < 1 OR new.ex_mark > 10) THEN
    SIGNAL SQLSTATE '66666' SET MESSAGE_TEXT = 'Invalid mark';
  END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_validate_ex_mark_3_2_update BEFORE UPDATE ON exams
FOR EACH ROW
BEGIN
  IF (new.ex_mark < 1 OR new.ex_mark > 10) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid mark';
  END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE avg_score(IN std_id INT)
BEGIN
  UPDATE studs
    SET avg_score = (SELECT ROUND(AVG(ex_mark),2) FROM exams WHERE exams.std_id = std_id) 
    WHERE studs.std_id = std_id;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_exams_avg_score_insert AFTER INSERT ON exams
FOR EACH ROW
BEGIN
  CALL stud_calc_avg_score(new.std_id);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_exams_avg_score_update AFTER UPDATE ON exams
FOR EACH ROW
BEGIN
  IF old.std_id != new.std_id THEN
    CALL stud_calc_avg_score(old.std_id);
  END IF;
  
  CALL stud_calc_avg_score(new.std_id);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_exams_avg_score_delete AFTER DELETE ON exams
FOR EACH ROW
BEGIN
  CALL stud_calc_avg_score(old.std_id);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE stud_calc_stipend_2_3(IN std_id INT)
BEGIN
  UPDATE studs AS st
    SET stipend = (CASE 
                        WHEN EXISTS (SELECT * FROM exams ex WHERE ex.ex_mark < 4 AND ex.std_id = st.std_id) THEN 0
                        WHEN avg_score IS NULL OR avg_score < 5 THEN 0
                        WHEN avg_score > 5 AND avg_score < 6 THEN 70
						WHEN avg_score > 6 AND avg_score < 8 THEN 90
                        ELSE 120 END)
    WHERE std_id IS NULL OR (st.std_id = std_id);
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER tr_exams_calc_stipend_3_3_insert AFTER INSERT ON exams
FOR EACH ROW
BEGIN
  CALL stud_calc_stipend_2_3(new.std_id);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_exams_calc_stipend_3_3_update AFTER UPDATE ON exams
FOR EACH ROW
BEGIN
  IF old.std_id != new.std_id THEN
    CALL stud_calc_stipend_2_3(old.std_id);
  END IF;
  
  CALL stud_calc_stipend_2_3(new.std_id);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_exams_calc_stipend_3_3_delete AFTER DELETE ON exams
FOR EACH ROW
BEGIN
  CALL stud_calc_stipend_2_3(old.std_id);
END //
DELIMITER ;