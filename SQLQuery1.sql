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

CREATE TABLE Supplier_phone
(
  phone varchar(255) ,
  supplier_id INT NOT NULL,
  PRIMARY KEY (phone, supplier_id),
  FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

select * from Supplier_phone;


CREATE TABLE Waiter
(
  waiter_id INT IDENTITY(100,1) NOT NULL,
  Waiter_name VARCHAR(30) NOT NULL,
  salary INT NOT NULL,
  phone INT NOT NULL,
  PRIMARY KEY (waiter_id)
);  

--DDL

alter table Chef 
alter column salary NUMERIC(5,3) NOT NULL 

alter table waiter 
alter column salary NUMERIC(5,3) NOT NULL 

alter table waiter
alter column phone char(15) 

select * from Waiter;

CREATE TABLE Customer
(
  customer_id INT IDENTITY(2000,1) NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  Customer_address VARCHAR(30) NULL,
  phone char(15) NOt NULL,
  waiter_id INT NOT NULL,
  PRIMARY KEY (customer_id),
  FOREIGN KEY (waiter_id) REFERENCES Waiter(waiter_id)
);

select * from Customer;
