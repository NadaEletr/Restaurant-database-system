create database dbReasturant_1;
use dbReasturant_1;

CREATE TABLE Chef
(
  chef_id INT IDENTITY(1,1) NOT NULL,
  chef_name VARCHAR(40) NOT NULL,
  salary NUMERIC(7,3) NOT NULL,
  phone CHAR(15),
  PRIMARY KEY (chef_id)
); 

select * from chef;

