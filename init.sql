USE supermr_db;

CREATE TABLE IF NOT EXISTS user (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
	level INT UNSIGNED NOT NULL,
	add_time DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS company (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	address VARCHAR(255),
	telphone VARCHAR(255) NOT NULL,
	contact_person VARCHAR(255) NOT NULL,
	email VARCHAR(255),
	userid INT UNSIGNED,
	FOREIGN KEY(userid) REFERENCES user(id),
	add_time DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS goods (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	place_of_production VARCHAR(255) NOT NULL,
	price FLOAT NOT NULL,
	companyid INT UNSIGNED,
	FOREIGN KEY(companyid) REFERENCES company(id),
	userid INT UNSIGNED,
	FOREIGN KEY(userid) REFERENCES user(id),
	add_time DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS inventory (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	goodsid INT UNSIGNED,
	FOREIGN KEY(goodsid) REFERENCES goods(id),
	num INT NOT NULL,
	userid INT UNSIGNED,
	FOREIGN KEY(userid) REFERENCES user(id),
	add_time DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS orders (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	goodsid INT UNSIGNED,
	FOREIGN KEY(goodsid) REFERENCES goods(id),
	num INT NOT NULL,
	payment_type VARCHAR(255) NOT NULL,
	userid INT UNSIGNED,
	FOREIGN KEY(userid) REFERENCES user(id),
	add_time DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8;