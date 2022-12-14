CREATE TABLE Education (
  id int NOT NULL AUTO_INCREMENT,
  id_user int NOT NULL,
  faculty varchar(50) DEFAULT NULL,
  degree enum('Bachelor','Master','Doctoral') DEFAULT NULL,
  current_year int NOT NULL,
  KEY id_user_idx (id_user),
  CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES User (id),
  PRIMARY KEY (id)
);
