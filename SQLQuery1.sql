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

CREATE TABLE Supplier
(
  supplier_id INT IDENTITY(1000,1) NOT NULL,
  supplier_name  VARCHAR(50) NOT NULL,
  supplier_city VARCHAR(50) check(supplier_city in('Cairo','Roma','Beirut')),
  chef_id INT NOT NULL,
  PRIMARY KEY (supplier_id),
  FOREIGN KEY (chef_id) REFERENCES Chef(chef_id)
);

select * from Supplier;
