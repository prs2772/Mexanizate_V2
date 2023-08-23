DROP DATABASE IF EXISTS mexanizate;
CREATE DATABASE mexanizate;
USE mexanizate;

-- DROPS
-- LVL5
DROP TABLE IF EXISTS reviews_events;
DROP TABLE IF EXISTS hosts_event;
DROP TABLE IF EXISTS users_account_password;
DROP TABLE IF EXISTS hosts_touristic_place;
DROP TABLE IF EXISTS reviews_places;
DROP TABLE IF EXISTS review_images;
-- LVL4 
DROP TABLE IF EXISTS google_2fas;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS registers_events;
DROP TABLE IF EXISTS users_punctuation;
DROP TABLE IF EXISTS users_account;
DROP TABLE IF EXISTS users_oauth;
DROP TABLE IF EXISTS hosts_;
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
DROP TABLE IF EXISTS events_;
DROP TABLE IF EXISTS host_roles;
DROP TABLE IF EXISTS punctuation_type;


-- CREATION
-- Without FK (LVL0) azul
CREATE TABLE identification_types(
	id int AUTO_INCREMENT,
    name_ varchar(120) UNIQUE NOT NULL, CHECK (name_ REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚñÑ]+$'),
    description_ char(150), CHECK (description_ REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚñÑ]+$'),
    PRIMARY KEY(id)
);
CREATE TABLE states(
	id int AUTO_INCREMENT,
    state varchar(19) UNIQUE NOT NULL, CHECK(state REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚ]+$'),
    PRIMARY KEY(id)
);
CREATE TABLE images(
	id int AUTO_INCREMENT,
    image_url varchar(600) NOT NULL, CHECK(image_url REGEXP '^[A-Za-z0-9/:\\\\.\\-_~?%,#]+$'),
    description_ varchar(250), CHECK(description_ REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚ¿?¡!\\-_~%#"]+$'),
    dt_upload datetime NOT NULL DEFAULT NOW(),
    PRIMARY KEY (id)
);
CREATE TABLE tags(
	id int AUTO_INCREMENT,
    tag varchar(66) NOT NULL, CHECK (tag REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚ:¿?¡!%]+$'),
    PRIMARY KEY(id)
);
CREATE TABLE events_(
	id int AUTO_INCREMENT,
    e_start date NOT NULL,
    e_end date NOT NULL,
    description_ text, CHECK(description_ REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚ¿?¡!\\-_~%#"]+$'),
    PRIMARY KEY(id)
);
CREATE TABLE host_roles(
	id int AUTO_INCREMENT,
    role_ varchar(33) NOT NULL UNIQUE, CHECK(role_ REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚñÑ]+$'),
    PRIMARY KEY(id)
);
CREATE TABLE punctuation_type(
	id int AUTO_INCREMENT,
    name_ varchar(33) NOT NULL UNIQUE, CHECK(name_ REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚñÑ]+$'),
    description_ varchar(150), CHECK(description_ REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚ¿?¡!\\-_~%#"]+$'),
    PRIMARY KEY(id)
);
-- LV1 verde
CREATE TABLE towns(
	id int AUTO_INCREMENT,
    fk_states int NOT NULL,
    town varchar(31) NOT NULL, CHECK(town REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚñÑ]+$'),
    PRIMARY KEY(id),
    FOREIGN KEY (fk_states) REFERENCES states(id)
);
CREATE TABLE events_gallery(
	id int AUTO_INCREMENT,
    fk_images int NOT NULL,
    fk_events int NOT NULL,
    img_type char NOT NULL, CHECK (img_type IN ('B','M','A','P')),
    -- Event Back(B)
    -- Event Main(M)
    -- App gallery image(A)
    -- Proof(P)
    PRIMARY KEY(id),
    FOREIGN KEY (fk_images) REFERENCES images(id),
    FOREIGN KEY (fk_events) REFERENCES events_(id)
);
CREATE TABLE schedules_event(
	id int AUTO_INCREMENT,
    fk_events int NOT NULL,
    s_start time NOT NULL,
    s_end time NOT NULL,
    s_day tinyint NOT NULL, CHECK(s_day BETWEEN 0 AND 6),
    PRIMARY KEY(id),
    FOREIGN KEY(fk_events) REFERENCES events_(id)
);

-- LV2 naranja
CREATE TABLE locations(
	id int AUTO_INCREMENT,
    fk_towns int NOT NULL,
    cp numeric(5),
    address varchar(350) NOT NULL, CHECK(address REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚüÜ¿?¡!\\-_~#%"]+$'),
    num_ext char(10) DEFAULT 'S/N', CHECK(num_ext REGEXP '^[A-Za-z0-9\\-#"]+$'),
    num_int char(15) DEFAULT 'S/N', CHECK(num_int REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚ\\-_#"]+$'),
    loc_references char(200),
    PRIMARY KEY(id),
    FOREIGN KEY (fk_towns) REFERENCES towns(id)
);

-- LV3 rosa
CREATE TABLE users(
	id int AUTO_INCREMENT,
    fk_locations int,
    username char(25), CHECK (username REGEXP '^[A-Za-z0-9áéíóúÁÉÍÓÚ¿?¡!_:,;&#/^<>~%°|"\\p{Emoji}\\[\\]\\{\\}\\*\\s\\-\\+\\n\\.\'\\$\\(\\)\\\\]+$'),
    first_name varchar(100), CHECK(first_name REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚñÑüÜ]+$'),
    last_name_p1 varchar(100), CHECK(last_name_p1 REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚñÑüÜ]+$'),
    last_name_p2 varchar(100), CHECK(last_name_p2 REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚñÑüÜ]+$'),
    state char NOT NULL DEFAULT 'A', CHECK (state IN ('A', 'I', 'S', 'B')),-- S) Suspendido-Inactivado temporalmente, B) Bloqueado
    PRIMARY KEY(id),
    FOREIGN KEY (fk_locations) REFERENCES locations(id)
);
CREATE TABLE touristic_places(
	id int AUTO_INCREMENT,
    fk_locations int NOT NULL,
    name_ char (25), CHECK (name_ REGEXP '^[A-Za-z\\s0-9áéíóúÁÉÍÓÚ¿?¡!\\-_~%#"°\\(\\)]+$'),
    state char NOT NULL DEFAULT 'A', CHECK (state IN ('A', 'I', 'S', 'B')),-- S) Suspendido-Inactivado temporalmente, B) Bloqueado
    PRIMARY KEY(id),
    FOREIGN KEY(fk_locations) REFERENCES locations(id)
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
    content text, CHECK (content REGEXP '^[A-Za-z0-9áéíóúÁÉÍÓÚ¿?¡!_:,;&#/^<>~%°|"\\p{Emoji}\\[\\]\\{\\}\\*\\s\\-\\+\\n\\.\'\\$\\(\\)\\\\]+$'),
    PRIMARY KEY(id),
    FOREIGN KEY (fk_users) REFERENCES users(id)
);
CREATE TABLE registers_events(
	id int AUTO_INCREMENT,
    fk_events int NOT NULL,
    fk_users int NOT NULL,
    reg_start date NOT NULL,
    reg_end date NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (fk_events) REFERENCES events_(id),
    FOREIGN KEY (fk_users) REFERENCES users(id)
);
CREATE TABLE users_punctuation(
	id int AUTO_INCREMENT,
    fk_users int NOT NULL,
    fk_punctuation_type int NOT NULL,
    punctuation int,
    dt_obtained datetime NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (fk_users) REFERENCES users(id),
    FOREIGN KEY (fk_punctuation_type) REFERENCES punctuation_type(id)
);
CREATE TABLE users_account(
	id int AUTO_INCREMENT,
    fk_users int NOT NULL,
    email varchar(100) NOT NULL UNIQUE, CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'),
    date_start datetime NOT NULL,
    date_end datetime,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_users) REFERENCES users(id)
);

CREATE TABLE users_oauth(
	id int AUTO_INCREMENT,
    fk_users int NOT NULL,
    fk_identification_types int NOT NULL,
    oauth_uid_key varchar(100) NOT NULL UNIQUE,
    date_start datetime NOT NULL,
    date_end datetime,
    PRIMARY KEY(id),
    FOREIGN KEY (fk_users) REFERENCES users(id),
    FOREIGN KEY (fk_identification_types) REFERENCES identification_types(id)
);
CREATE TABLE hosts_(
	id int AUTO_INCREMENT,
    fk_users int NOT NULL,
    host_name varchar(25) NOT NULL UNIQUE, CHECK (host_name REGEXP '^[A-Za-z0-9áéíóúÁÉÍÓÚ¿?¡!_:,;&#/^<>~%°|"\\p{Emoji}\\[\\]\\{\\}\\*\\s\\-\\+\\n\\.\'\\$\\(\\)\\\\]+$'),
    identity_file_documents varchar(400),
    state char NOT NULL DEFAULT 'A', CHECK(state IN ('A', 'B', 'I')),-- Active, Bloqued, Inactive
    PRIMARY KEY(id)
);
CREATE TABLE events_places(
	id int AUTO_INCREMENT,
    fk_touristic_places int NOT NULL,
    fk_events int NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_touristic_places) REFERENCES touristic_places(id),
    FOREIGN KEY(fk_events) REFERENCES events_(id)
);
CREATE TABLE places_gallery(
	id int AUTO_INCREMENT,
    fk_images int NOT NULL,
    fk_touristic_places int NOT NULL,
    img_type char NOT NULL, CHECK (img_type IN ('B','M','A','P')),
    -- Perfil Place Back(B)
    -- Perfil Main image(U)
    -- App gallery image(A)
    -- Proof(P)
    PRIMARY KEY(id),
    FOREIGN KEY(fk_images) REFERENCES images(id),
    FOREIGN KEY(fk_touristic_places) REFERENCES touristic_places(id)
);
CREATE TABLE users_gallery(
	id int AUTO_INCREMENT,
    fk_images int NOT NULL,
    fk_users int NOT NULL,
    img_type char NOT NULL,
    state char NOT NULL, CHECK (state IN ('B','M','A','P', 'H', 'F')),
    -- Perfil Place Back(B)
    -- Perfil Main image(U)
    -- App gallery image(A)
    -- Proof(P),
    -- Hidden (H),
    -- Only Visible by Friends (F)
    PRIMARY KEY(id),
    FOREIGN KEY(fk_images) REFERENCES images(id),
    FOREIGN KEY(fk_users) REFERENCES users(id)
);
CREATE TABLE users_friends(
	id int AUTO_INCREMENT,
    fk_users_doer int NOT NULL,
    fk_users int NOT NULL,
    status_usr_doer char NOT NULL, CHECK(status_usr_doer IN ('F', 'S', 'B')),
    -- Friends (F)
    -- Sent, initial state (S)
    -- Banned (B)-> Special state that banns the other person and avoid future interactions
    status_usr char NOT NULL, CHECK(status_usr_doer IN ('F', 'A', 'R')),
    -- Friends (F)
    -- Accepted (A)-> Pasa a F, con este estado intermedio se notifica que se ha aceptado
    -- Rejected (R)-> Queda rechazada por este usuario, se notifica al otro, quien puede intentar enviar de nuevo hasta 2 veces
    PRIMARY KEY(id),
    FOREIGN KEY (fk_users_doer) REFERENCES users(id),
    FOREIGN KEY (fk_users) REFERENCES users(id)
);
CREATE TABLE tags_places(
	id int AUTO_INCREMENT,
    fk_touristic_places int NOT NULL,
    fk_tags int NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_touristic_places) REFERENCES touristic_places(id),
    FOREIGN KEY(fk_tags) REFERENCES tags(id)
);
CREATE TABLE schedules_touristic_place(
	id int AUTO_INCREMENT,
    fk_touristic_places int NOT NULL,
    s_start time NOT NULL,
    s_end time NOT NULL,
    s_day tinyint NOT NULL, CHECK(s_day BETWEEN 0 AND 6),
    PRIMARY KEY(id),
    FOREIGN KEY(fk_touristic_places) REFERENCES touristic_places(id)
);

-- LV5 gris
CREATE TABLE reviews_events(
	id int AUTO_INCREMENT,
    fk_reviews int NOT NULL,
    fk_events int NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_reviews) REFERENCES reviews(id),
    FOREIGN KEY(fk_events) REFERENCES events_(id)
);
CREATE TABLE hosts_event(
	id int AUTO_INCREMENT,
    fk_events int NOT NULL,
    fk_hosts int NOT NULL,
    fk_host_roles int NOT NULL,
    link_dt datetime,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_events) REFERENCES events_(id),
    FOREIGN KEY(fk_hosts) REFERENCES hosts_(id),
    FOREIGN KEY(fk_host_roles) REFERENCES host_roles(id)
);
CREATE TABLE users_account_password(
	id int AUTO_INCREMENT,
    fk_users_account int NOT NULL,
    password_ varchar(300) NOT NULL,
    date_start datetime NOT NULL,
    date_end datetime,
    PRIMARY KEY(id),
    FOREIGN KEY (fk_users_account) REFERENCES users_account(id)
);
CREATE TABLE hosts_touristic_place(
	id int AUTO_INCREMENT,
    fk_touristic_places int NOT NULL,
    fk_host_roles int NOT NULL,
    fk_hosts int NOT NULL,
    link_dt datetime,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_touristic_places) REFERENCES touristic_places(id),
    FOREIGN KEY(fk_host_roles) REFERENCES host_roles(id),
    FOREIGN KEY(fk_hosts) REFERENCES hosts_(id)
);
CREATE TABLE reviews_places(
	id int AUTO_INCREMENT,
    fk_reviews int NOT NULL,
    fk_touristic_places int NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_reviews) REFERENCES reviews(id),
    FOREIGN KEY(fk_touristic_places) REFERENCES touristic_places(id)
);
CREATE TABLE review_images(
	id int AUTO_INCREMENT,
    fk_reviews int NOT NULL,
    fk_images int NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_reviews) REFERENCES reviews(id),
    FOREIGN KEY(fk_images) REFERENCES images(id)
);









