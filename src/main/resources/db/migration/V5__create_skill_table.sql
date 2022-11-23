CREATE TABLE Skill (
  id int NOT NULL,
  skill varchar(45) DEFAULT NULL,
  rating enum('1','2','3','4','5') DEFAULT NULL,
  PRIMARY KEY (id)
);