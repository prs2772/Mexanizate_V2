DROP DATABASE IF EXISTS mexanizate;
CREATE DATABASE mexanizate;
USE mexanizate;

CREATE TABLE users(
	id int AUTO_INCREMENT,
    username char(25) UNIQUE,
    first_name varchar(100),
    last_name_p1 varchar(100),
    last_name_p2 varchar(100),
    state char NOT NULL DEFAULT 'A', CHECK(state IN ('A','I')),
    PRIMARY KEY(id)
);

CREATE TABLE users_account_password(
id int AUTO_INCREMENT,
fk_users_account int NOT NULL,
passwd varchar(300) NOT NULL,
fecha_inicio datetime NOT NULL,
fecha_fin datetime 
);

CREATE TABLE users_account (
id int AUTO_INCREMENT,
fk_users int NOT NULL,
email varchar(100) NOT NULL
);

CREATE TABLE users_oauth( -- no está terminada
id int AUTO_INCREMENT,
auth varchar(100) NOT NULL,
fk_users int (100)
);