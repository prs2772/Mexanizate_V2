DROP DATABASE IF EXISTS mexanizate;
CREATE DATABASE mexanizate;
USE mexanizate;

-- DROPS
-- LVL7
DROP TABLE IF EXISTS ;
-- LVL6
DROP TABLE IF EXISTS ;
-- LVL5
DROP TABLE IF EXISTS ;
-- LVL4
DROP TABLE IF EXISTS ;
-- LVL3
DROP TABLE IF EXISTS users;
-- LVL2
DROP TABLE IF EXISTS locations;
-- LVL1
DROP TABLE IF EXISTS towns;
-- LVL0
DROP TABLE IF EXISTS identification_types;
DROP TABLE IF EXISTS states;
DROP TABLE IF EXISTS images;


-- CREATION


-- Without FK (LVL0)
CREATE TABLE identification_types(
	id int AUTO_INCREMENT,
    name varchar(120) UNIQUE NOT NULL,
    description char(150),
    PRIMARY KEY(id)
);
CREATE TABLE states(
	id int AUTO_INCREMENT,
    state varchar(19) UNIQUE NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE images(
	id int AUTO_INCREMENT,
    image_url varchar(600) NOT NULL,
    description varchar(250),
    dt_upload datetime NOT NULL DEFAULT NOW(),
    PRIMARY KEY (id)
);


-- LV1
CREATE TABLE towns(
	id int AUTO_INCREMENT,
    fk_states int NOT NULL,
    town varchar(31) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (fk_states) REFERENCES states(id)
);


-- LV2
CREATE TABLE locations(
	id int AUTO_INCREMENT,
    fk_towns int NOT NULL,
    cp numeric(5),
    address varchar(350) NOT NULL,
    num_ext char(10) DEFAULT 'S/N',
    num_int char(10) DEFAULT 'S/N',
    loc_references char(200),
    PRIMARY KEY(id),
    FOREIGN KEY (fk_towns) REFERENCES towns(id)
);


-- LV3
CREATE TABLE users(
	id int AUTO_INCREMENT,
    fk_locations int,
    username char(25) UNIQUE,
    first_name varchar(100),
    last_name_p1 varchar(100),
    last_name_p2 varchar(100),
    state char NOT NULL DEFAULT 'A', CHECK (state IN ('A','I', 'S', 'B')),
    PRIMARY KEY(id),
    FOREIGN KEY (fk_locations) REFERENCES locations(id)
);


-- LV4
CREATE TABLE google_2fas(
	id int AUTO_INCREMENT,
    fk_users int NOT NULL,
    private_key varchar(300) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_users) REFERENCES users(id)
);

CREATE TABLE (
	id int AUTO_INCREMENT,
    
    PRIMARY KEY(id)
);
CREATE TABLE (
	id int AUTO_INCREMENT,
    
    PRIMARY KEY(id)
);
CREATE TABLE (
	id int AUTO_INCREMENT,
    
    PRIMARY KEY(id)
);
CREATE TABLE (
	id int AUTO_INCREMENT,
    
    PRIMARY KEY(id)
);
CREATE TABLE (
	id int AUTO_INCREMENT,
    
    PRIMARY KEY(id)
);
CREATE TABLE (
	id int AUTO_INCREMENT,
    
    PRIMARY KEY(id)
);
CREATE TABLE (
	id int AUTO_INCREMENT,
    
    PRIMARY KEY(id)
);
CREATE TABLE (
	id int AUTO_INCREMENT,
    
    PRIMARY KEY(id)
);
CREATE TABLE (
	id int AUTO_INCREMENT,
    
    PRIMARY KEY(id)
);
CREATE TABLE (
	id int AUTO_INCREMENT,
    
    PRIMARY KEY(id)
);
CREATE TABLE (
	id int AUTO_INCREMENT,
    
    PRIMARY KEY(id)
);
CREATE TABLE (
	id int AUTO_INCREMENT,
    
    PRIMARY KEY(id)
);
CREATE TABLE (
	id int AUTO_INCREMENT,
    
    PRIMARY KEY(id)
);

















CREATE TABLE users_account (
	id int AUTO_INCREMENT,
	fk_users int NOT NULL,
	email varchar(100) NOT NULL UNIQUE,
    fecha_inicio datetime NOT NULL,
    fecha_fin datetime,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_users) REFERENCES users(id)
);

CREATE TABLE users_account_password(
	id int AUTO_INCREMENT,
	fk_users_account int NOT NULL,
	passwd varchar(300) NOT NULL,
	fecha_inicio datetime NOT NULL,
	fecha_fin datetime,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_users_account) REFERENCES users_account(id)
);

CREATE TABLE users_oauth( -- no está terminada
	id int AUTO_INCREMENT,
	auth varchar(100) NOT NULL,
	fk_users int (100)
);









