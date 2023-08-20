USE mexanizate;
-- Glossary
-- c -> Create-Insert
-- r -> Read (queries)
-- u -> Updates
-- d -> Deletes

-- Querys
DROP PROCEDURE IF EXISTS c_user_by_email;
DELIMITER %
CREATE PROCEDURE `c_user_by_email`(IN email_in varchar(100), IN password_in varchar(20))
BEGIN
-- Variables
	DECLARE succeed_var bool; 
    DECLARE message_var text;
	DECLARE user_id_var int;
	DECLARE user_account_id_var int;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
		BEGIN 
			ROLLBACK;
			SELECT 0 INTO succeed_var;
			SELECT 'Ocurrió un error no controlado, verifica usar caracteres permitidos para los campos solicitados' INTO message_var;
		END;
        
	SET succeed_var = 1;
	SET message_var = '';
-- Inicio
	START TRANSACTION;
	IF succeed_var THEN
		SELECT NOT EXISTS (SELECT * FROM users_account ua WHERE ua.email = email_in) INTO succeed_var;
		SELECT IF(NOT succeed_var AND message_var = '', 'Este correo ya está registrado', message_var) INTO message_var;
	END IF;
	IF succeed_var THEN INSERT INTO users() VALUES (); END IF;
    IF succeed_var THEN SELECT LAST_INSERT_ID() INTO user_id_var; END IF;
    IF succeed_var THEN INSERT INTO users_account(fk_users, email) VALUES (user_id_var, email_in); END IF;
    IF succeed_var THEN SELECT LAST_INSERT_ID() INTO user_account_id_var; END IF;
    IF succeed_var THEN INSERT INTO users_account_password(fk_users_account, password_) VALUES (user_account_id_var, AES_ENCRYPT(password_in, 'J45h4rc01r15$')); END IF;
    IF succeed_var THEN SELECT CONCAT('Usuario vinculado al correo ', email_in) INTO message_var; END IF;
-- Fin
	IF succeed_var THEN COMMIT; END IF;
	SELECT succeed_var, message_var, user_id_var;
END %
DELIMITER ;

DROP PROCEDURE IF EXISTS r_user_by_email;
DELIMITER %
CREATE PROCEDURE `r_user_by_email`(IN email_in varchar(100), IN password_in varchar(20))
BEGIN
	DECLARE user_id_var int;
	DECLARE user_account_id_var int;
    
	SELECT *
    FROM users u
		INNER JOIN users_account ua ON u.id = ua.fk_users AND ua.date_end IS NULL
        INNER JOIN users_account_password uap ON ua.id = uap.fk_users_account AND uap.date_end IS NULL
	WHERE ua.email = email_in 
		AND uap.password_ = AES_ENCRYPT(password_in, 'J45h4rc01r15$')
	;
END %
DELIMITER ;


CALL c_user_by_email('asd', '#"1234');
CALL c_user_by_email('paris.140816@gmail.com', '1234');
SELECT * FROM users;
SELECT * FROM users_account;
SELECT * FROM users_account_password;
SELECT uap.* FROM users_account_password uap WHERE uap.password_ = AES_ENCRYPT('1234', 'J45h4rc01r15$');

-- Triggers
DROP TRIGGER IF EXISTS actualiza_ar_id_interno;
DELIMITER %
CREATE TRIGGER actualiza_ar_id_interno AFTER INSERT ON equipo_ar_id_interno
FOR EACH ROW BEGIN
	UPDATE equipo_ar SET id_interno = NEW.id_interno WHERE id = NEW.equipo_ar;
END
% DELIMITER ;


























