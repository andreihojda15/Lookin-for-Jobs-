CREATE TABLE Job (
  id int NOT NULL,
  companyId int DEFAULT NULL,
  name varchar(45) DEFAULT NULL,
  experience int DEFAULT NULL,
  requiredSkill varchar(45) DEFAULT NULL,
  description varchar(3000) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT companyId FOREIGN KEY (companyId) REFERENCES Company (id)
);
