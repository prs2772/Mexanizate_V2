DROP DATABASE IF EXISTS mexanizate;
CREATE DATABASE mexanizate;
USE mexanizate;

-- DROPS
-- LVL5
DROP TABLE IF EXISTS reviews_events;
DROP TABLE IF EXISTS host_event;
DROP TABLE IF EXISTS users_account_password;
DROP TABLE IF EXISTS host_touristic_place;
DROP TABLE IF EXISTS reviews_places;
DROP TABLE IF EXISTS review_images;
-- LVL4 
DROP TABLE IF EXISTS google_2fas;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS registers_events;
DROP TABLE IF EXISTS users_punctuation;
DROP TABLE IF EXISTS users_account;
DROP TABLE IF EXISTS users_oauth;
DROP TABLE IF EXISTS hosts;
DROP TABLE IF EXISTS events_places;
DROP TABLE IF EXISTS places_gallery;
DROP TABLE IF EXISTS users_gallery;
DROP TABLE IF EXISTS users_friends;
DROP TABLE IF EXISTS tags_places;
DROP TABLE IF EXISTS schedules_touristic_place;
-- LVL3
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS touristic_places;
-- LVL2
DROP TABLE IF EXISTS locations;
-- LVL1
DROP TABLE IF EXISTS towns;
DROP TABLE IF EXISTS events_gallery;
DROP TABLE IF EXISTS schedules_event;
-- LVL0
DROP TABLE IF EXISTS identification_types;
DROP TABLE IF EXISTS states;
DROP TABLE IF EXISTS images;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS host_roles;
DROP TABLE IF EXISTS punctuation_type;


-- CREATION
-- Without FK (LVL0) azul
CREATE TABLE identification_types(
	id int AUTO_INCREMENT,
    name varchar(120) UNIQUE NOT NULL,
    email char(150), 
    CONSTRAINT ckeck_email CHECK (email REGEXP '^[^@]+@[^@]+\.[^@]{2,}$'),
    PRIMARY KEY(id)
);
DROP TABLE identification_types;
SELECT * FROM identification_types;
INSERT INTO identification_types (name, email) VALUE ('Paris', 'ParisEmail');
SELECT 'Hola@f.com' REGEXP '^[^@]+@[^@]+\.[^@]{2,}$';

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
CREATE TABLE tags(
	id int AUTO_INCREMENT,
    tag varchar(66) NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE events(
	id int AUTO_INCREMENT,
    e_start date NOT NULL,
    e_end date NOT NULL,
    description text,
    PRIMARY KEY(id)
);
CREATE TABLE host_roles(
	id int AUTO_INCREMENT,
    role varchar(33) NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE punctuation_type(
	id int AUTO_INCREMENT,
    name varchar(33) NOT NULL,
    description varchar(150),
    PRIMARY KEY(id)
);
-- LV1 verde
CREATE TABLE towns(
	id int AUTO_INCREMENT,
    fk_states int NOT NULL,
    town varchar(31) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (fk_states) REFERENCES states(id)
);
CREATE TABLE events_gallery(
	id int AUTO_INCREMENT,
    fk_images int NOT NULL,
    fk_events int NOT NULL,
    img_type char NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (fk_images) REFERENCES images(id),
    FOREIGN KEY (fk_events) REFERENCES events(id)
);
CREATE TABLE schedules_event(
	id int AUTO_INCREMENT,
    fk_events int NOT NULL,
    s_start time NOT NULL,
    s_end time NOT NULL,
    s_day varchar(9) NOT NULL,
    PRIMARY KEY(id),
    
);

-- LV2 naranja
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

-- LV3 rosa
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
CREATE TABLE touristic_places(
	id int AUTO_INCREMENT,
    fk_locations int NOT NULL,
    name char (25),
    state char NOT NULL,
    PRIMARY KEY(id)
);


-- LV4 blanco
CREATE TABLE google_2fas(
	id int AUTO_INCREMENT,
    fk_users int NOT NULL,
    private_key varchar(300) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_users) REFERENCES users(id)
);

CREATE TABLE reviews(
	id int AUTO_INCREMENT,
    fk_users int NOT NULL,
    dt_posted datetime NOT NULL,
    content text,
    PRIMARY KEY(id),
    FOREIGN KEY (fk_users) REFERENCES users(id)
);

CREATE TABLE registers_events(
	id int AUTO_INCREMENT,
    fk_events int,
    fk_users int,
    reg_start date NOT NULL,
    reg_end date NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE users_punctuation(
	id int AUTO_INCREMENT,
    fk_users int,
    fk_punctuation_type int,
    punctuation int,
    dt_obtained datetime NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE users_account(
	id int AUTO_INCREMENT,
    fk_users int NOT NULL,
    email varchar(100) NOT NULL,
    date_start datetime NOT NULL,
    date_end datetime,
    PRIMARY KEY(id)
);

CREATE TABLE users_oauth(
	id int AUTO_INCREMENT,
    fk_users int,
    fk_identification_types int,
    oauth_uid_key varchar(100) NOT NULL,
    date_start datetime NOT NULL,
    date_end datetime,
    PRIMARY KEY(id)
);
CREATE TABLE hosts(
	id int AUTO_INCREMENT,
    fk_users int NOT NULL,
    host_name varchar(25),
    identity_file_documents varchar(400),
    state char NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE events_places(
	id int AUTO_INCREMENT,
    fk_touristic_places int NOT NULL,
    fk_events int NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE places_gallery(
	id int AUTO_INCREMENT,
    fk_images int NOT NULL,
    fk_t_places int NOT NULL,
    img_type char NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE users_gallery(
	id int AUTO_INCREMENT,
    fk_images int NOT NULL,
    fk_users int NOT NULL,
    img_type char NOT NULL,
    state char NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE users_friends(
	id int AUTO_INCREMENT,
    fk_users_doer int NOT NULL,
    fk_users int NOT NULL,
    status_usr_doer char NOT NULL,
    status_usr char NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE tags_places(
	id int AUTO_INCREMENT,
    fk_touristic_place int NOT NULL,
    fk_tags int NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE schedules_touristic_place(
	id int AUTO_INCREMENT,
    fk_touristic_place int NOT NULL,
    s_start time NOT NULL,
    s_end time NOT NULL,
    s_day varchar(9) NOT NULL,
    PRIMARY KEY(id)
);

-- LV5 gris
CREATE TABLE reviews_events(
	id int AUTO_INCREMENT,
    fk_reviews int NOT NULL,
    fk_events int NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE host_event(
	id int AUTO_INCREMENT,
    fk_event int NOT NULL,
    fk_hosts int NOT NULL,
    fk_host_roles int NOT NULL,
    link_dt datetime,
    PRIMARY KEY(id)
);
CREATE TABLE users_account_password(
	id int AUTO_INCREMENT,
    fk_users_account int NOT NULL,
    password varchar(300) NOT NULL,
    date_start datetime NOT NULL,
    date_end datetime,
    PRIMARY KEY(id)
);
CREATE TABLE host_touristic_place(
	id int AUTO_INCREMENT,
    fk_touristic_places int NOT NULL,
    fk_host_roles int NOT NULL,
    fk_host int NOT NULL,
    link_dt datetime,
    PRIMARY KEY(id)
);
CREATE TABLE reviews_places(
	id int AUTO_INCREMENT,
    fk_reviews int NOT NULL,
    fk_places int NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE review_images(
	id int AUTO_INCREMENT,
    fk_reviews int,
    fk_images int,
    PRIMARY KEY(id)
);









