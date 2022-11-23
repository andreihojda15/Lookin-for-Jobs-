CREATE TABLE Job (
  id int NOT NULL,
  company_id int DEFAULT NULL,
  name varchar(45) DEFAULT NULL,
  experience int DEFAULT NULL,
  required_skill varchar(45) DEFAULT NULL,
  description varchar(3000) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT company_id FOREIGN KEY (company_id) REFERENCES Company (id)
);
