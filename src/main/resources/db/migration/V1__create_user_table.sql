CREATE TABLE User (
  id int NOT NULL AUTO_INCREMENT,
  first_name varchar(30) NOT NULL,
  last_name varchar(50) NOT NULL,
  email varchar(100) NOT NULL,
  password varchar(100) NOT NULL,
  contact_number varchar(10) DEFAULT NULL,
  image blob DEFAULT NULL,
  cv blob DEFAULT NULL,
  date_of_birth datetime DEFAULT NULL,
  role enum('admin','student','recruiter') DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY email_UNIQUE (email)
);