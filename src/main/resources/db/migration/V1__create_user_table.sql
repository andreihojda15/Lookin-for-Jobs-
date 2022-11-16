CREATE TABLE User (
  id int NOT NULL AUTO_INCREMENT,
  firstName varchar(30) NOT NULL,
  lastName varchar(50) NOT NULL,
  email varchar(100) NOT NULL,
  password varchar(50) NOT NULL,
  contactNumber varchar(10) DEFAULT NULL,
  image blob,
  cv blob NOT NULL,
  dateOfBirth datetime DEFAULT NULL,
  role enum('admin','student','recruiter') DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY email_UNIQUE (email)
);