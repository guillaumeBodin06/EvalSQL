CREATE TABLE users (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  password CHAR(60) NOT NULL,
  email VARCHAR(100) NOT NULL
);


CREATE TABLE registration_ticket (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  FOREIGN KEY (name) REFERENCES users(name),
  mouvi_name VARCHAR(50),
  FOREIGN KEY (mouvi_name) REFERENCES mouvi(name),
  total_price DECIMAL(10) NOT NULL = (SELECT mouvi_price + 3d_price FROM price),
  seats VARCHAR(100) NOT NULL,
  FOREIGN KEY (seats) REFERENCES rooms(name)
);



CREATE TABLE mouvi (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  3d BOOLEAN NOT NULL,
);


CREATE TABLE rooms (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  mouvi_room INT(11),
  FOREIGN KEY (mouvi_room) REFERENCES mouvi(id)
);

CREATE TABLE price (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  mouvi_price FLOAT(11) NOT NULL,
  3d_price FLOAT(11) NOT NULL
);


/* Table d'association */

CREATE TABLE assigned_room (
  mouvi_id INT(11) NOT NULL,
  room_id INT(11) NOT NULL,
  PRIMARY KEY (mouvi_id, room_id),
  FOREIGN KEY (mouvi_id) REFERENCES mouvi(id),
  FOREIGN KEY (room_id) REFERENCES rooms(id)
);