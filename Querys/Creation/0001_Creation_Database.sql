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

