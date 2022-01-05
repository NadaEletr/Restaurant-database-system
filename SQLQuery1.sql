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



CREATE TABLE Supplier
(
  supplier_id INT IDENTITY(1000,1) NOT NULL,
  supplier_name  VARCHAR(50) NOT NULL,
  supplier_city VARCHAR(50) check(supplier_city in('Cairo','Roma','Beirut')),
  chef_id INT NOT NULL,
  PRIMARY KEY (supplier_id),
  FOREIGN KEY (chef_id) REFERENCES Chef(chef_id)
);



CREATE TABLE Supplier_phone
(
  phone varchar(255) ,
  supplier_id INT NOT NULL,
  PRIMARY KEY (phone, supplier_id),
  FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);





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
alter column salary float NOT NULL 

alter table waiter 
alter column salary float NOT NULL 

alter table waiter
alter column phone char(15) 

alter table Supplier 
alter column chef_id  int NULL ;

alter table Supplier_phone 
drop column phone;

alter table Supplier_phone 
alter column phone  char(15) Not Null ;

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


alter table Customer
alter column first_name VARCHAR(50) NOT NULL

alter table Customer
alter column Last_name VARCHAR(50) NOT NULL

alter table Customer
alter column Customer_address VARCHAR(50) NOT NULL 



CREATE TABLE Meal
(
  meal_name varchar(255) NOT NULL,
  meal_id INT IDENTITY(1,1) NOT NULL,
  price float NOT NULL,
  chef_id INT NOT NULL,
  PRIMARY KEY (meal_id),
  FOREIGN KEY (chef_id) REFERENCES Chef(chef_id)
);



CREATE TABLE Orders
(
  order_date INT IDENTITY (10000,1)NOT NULL,
  order_id INT NOT NULL,
  meal_id INT NOT NULL,
  customer_id INT NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (meal_id) REFERENCES Meal(meal_id),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

alter table Orders
drop column order_date ;

alter table Orders
add  order_date  date ;




CREATE TABLE Ingredient
(
  ingredient_id INT IDENTITY (1,1)NOT NULL,
  ingredient_name varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (ingredient_id)
);



CREATE TABLE Meal_Ingredients
(
  meal_id INT NOT NULL,
  ingredient_id INT NOT NULL,
  PRIMARY KEY (meal_id, ingredient_id),
  FOREIGN KEY (meal_id) REFERENCES Meal(meal_id),
  FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);


CREATE TABLE Supplier_Ingredients
(
  supplier_id INT NOT NULL,
  ingredient_id INT NOT NULL,
  PRIMARY KEY (supplier_id, ingredient_id),
  FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id),
  FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);


select * from chef;
select * from Supplier;
select * from Ingredient;
select * from Supplier_Ingredients;
select * from Supplier_phone;
select * from Waiter;
select * from Customer;
select * from Meal;
select * from Meal_Ingredients;
select * from Orders;


--Chef 
insert into Chef(chef_name,salary,phone)
values ('john',1500.000,'3301114113'),
       ('lina',1200.000,'5542157519'),
	   ('Mark',1100.000,'2355904117'),
	   ('Mohamed',5000.000,'665649911'),
	   ('Ismail',7000.000,'3301114113'),
	   ('Ali',2000.000,'5678114444'),
	   ('Amr',15000.000,'0109765412'),
	   ('Mark',8000.000,'9822114113'),
	   ('jamie',4000.000,''),
	   ('lily',600.900,'2457814213'),
	   ('Mazen',4400.000,'7653114113'),
	   ('Mona',16500.000,'3301114113'),
	   ('lamia',18.500,'2871114153'),
	   ('Samy',1500.000,'3301114113'),
	   ('Samir',11500.000,'6789033254'),
	   ('Medo',11500.000,''),
	   ('Micky',89000.000,'3301114113'),
	   ('korlos',67000.000,'1237890533'),
	   ('Yehia',89000.000,'6435689000'),
	   ('Sona',1000.000,'3438687100') 

--Supplier
insert into Supplier(supplier_name,supplier_city,chef_id)
values ('Mazan','Cairo',12),
       ('loka','Roma',11),
	   ('Magdy','Beirut',13),
	   ('Mesho','Cairo','13'),
	   ('Ismail','Beirut',12),
	   ('Ali','Cairo',11),
	   ('Amir','Roma',6),
	   ('Tokyo','Roma',6),
	   ('Danfer','Roma',null),
	   ('Hazem','Cairo',4),
	   ('Morad','Cairo',3),
	   ('Youssef','Beirut',14),
	   ('Zaoro','Beirut','15'),
	   ('Wegz','Cairo',14),
	   ('Ziad','Roma',17),
	   ('Medo','Roma',4),
	   ('Korlos','Cairo',5),
	   ('korlos','Roma',null),
	   ('Yones','Cairo',7),
	   ('Sally','Cairo' ,8) 

--Supplier_Phone
insert into Supplier_phone(supplier_id,phone)
values ('1000','101987521'),
	   ('1000','125889221'),
	   ('l002','10892192'),
       ('l002','10772299'),
	   ('1005','123590681'),
	   ('1006',''),
	   ('1007','108278100'),
	   ('1008',''),
	   ('1010','152801720'),
	   ('1010','152879998'),
	   ('1200','127392022'),
	   ('1100',''),
	   ('1014','1728720105'),
	   ('1015','1282902026')  

--Waiter 
insert into Waiter(Waiter_name,salary,phone)
values ('Zoza',900.500,'1232245532'),
       ('lucie',500.500,'132232321'),
	   ('Bubble',700.800,'523255325'),
	   ('Palo',1000,'1232323223'),
	   ('Wegz',400,'6332326'),
	   ('Ali',700,'443242342'),
	   ('Mego',600,'7732423423'),
	   ('Tamer',200,'223242422'),
	   ('Turkey',300,''),
	   ('Haze',900.500,'9933422'),
	   ('Deiab',1000,'35645644'),
	   ('Youssef',500,'144234323'),
	   ('Zaoro',600,''),
	   ('Wegz',200,''),
	   ('Ziad',500,'192323232'),
	   ('Medo',300,'2536993'),
	   ('Hoka',800,'54545453'),
	   ('Dalia',200,'63322322'),
	   ('Maida',100,'72213211'),
	   ('Seko',400 ,'892879121')

--Customer 
insert into Customer (first_name,last_name,phone,Customer_address,waiter_id)
VALUES('Robby','Sykes','(516) 583-7761','486 Rock Maple Street',150),
        ('Lashawn','Ortiz',NULL,'27 Washington Rd',704),
       ('Garry','Espinoza',NULL,'7858 Rockaway Court',126),
      ('Linnie','Branch',NULL,'314 South Columbia Ave.',901),
      ('Emmitt','Sanchez','(212) 945-8823','461 Squaw Creek Road ',102),
        ('Caren','Stephens',NULL,'914 Brook St. ',183),
      ('Georgetta','Hardin',NULL,'474 Chapel Dr. ',424),
      ('Lizzette','Stein',NULL,'19 Green Hill Lane ',127),
     ('Aleta','Shepard',NULL,'684 Howard St. ',778),
     ('Tobie','Little',NULL,'10 Silver Spear Dr. ',704),
     ('Adelle','Larsen',NULL,'683 West Kirkland Dr. ',731),
     ('Kaylee','English',NULL,'8786 Fulton Rd. ',423),
     ('Corene','Wall',NULL,'9601 Ocean Rd. ',971),
     ('Regenia','Vaughan',NULL,'44 Stonybrook Street ',541),
     ('Theo','Reese','(562) 215-2907','8755 W. Wild Horse St. ',561),
     ('Santos','Valencia',NULL,'7479 Carpenter Street ',114),
     ('Jeanice','Frost',NULL,'76 Devon Lane ',102),
     ('Syreeta','Hendricks',NULL,'193 Spruce Road ',141),
     ('Jamaal','Albert',NULL,'853 Stonybrook Street ',805),
     ('Williemae','Holloway','(510) 246-8375','69 Cypress St. ',943),
     ('Araceli','Golden',NULL,'12 Ridgeview Ave. ',731),
     ('Deloris','Burke',NULL,'895 Edgemont Drive ',274),
     ('Brittney','Woodward',NULL,'960 River St. ',131),
     ('Guillermina','Noble',NULL,'6 Del Monte Lane ',127),
     ('Bernita','Mcdaniel',NULL,'2 Peg Shop Ave. ',130)

--Ingredients 
insert into Ingredient (ingredient_name,description,quantity)
VALUES ('onion','vegtables',1000),
		('apple','fruits',200),
		('tomato','vegtables',100),
		('potatoes','root',300),
		('mango','fruits',120),
		('pinapple','fruits',30),
		('brown toast','bread',50),
		('white toast','bread',100),
		('carrots','vegtables',300),
		('Eggplant','vegtables',70),
		('brown toast','bread',200),
		('lettuce','leafy green',100),
		('spinach','leafy green',80),
		('lettuce','leafy green',100),
		('cucumber','root',120),
		('zucchini','root',120),
		('brown Rice','rice',20),
		('basmati Rice','rice',30),
		('basmati Rice','rice',30),
		('banana','fruits',200),
		('whole milk','dairy',20),
		('cheese','dairy',30),
		('cheese','dairy',30)


insert into Ingredient (ingredient_name,description,quantity)
VALUES  ('minced meat','meat',120),
		('fried chicken','chicken',150),
		('sausages','meat',170)
		
--Meal 
insert into Meal(meal_name,price,chef_id)
VALUES ('fruit salad',50,3),
	   ('green salad',80,3),
	   ('chicken salad',100,3),
	   ('beef burger',150,5),
	   ('chicken burger',170,5),
	   ('hot dog',80,5),
	   ('chicken pizza ',200,8),
	   ('vegtables pizza ',130,8),
	   ('cheese pizza ',150,8),
	   ('cheese sandwitch',70,17),
	   ('onion soup',50,22),
	   ('vegtables soup',50,20),
	   ('tomato soup',70,20),
	   ('french fries',30,14),
	   ('apple juice',15,12),
	   ('pinapple juice',15,12),
	   ('tea',15,6),
	   ('latte',15,6),
	   ('mango cake',90,10)

--Meal_ingredient
insert into Meal_Ingredients(meal_id,ingredient_id)
VALUES (1,2),
	   (1,6),
	   (1,5),
	   (2,9),
	   (2,12),
	   (2,13),
	   (3,25),
	   (3,14),
	   (19,5),
	   (14,4),
	   (15,2),
	   (16,6),
	   (6,26),
	   (10,22)


--supplier_ingredient
insert into supplier_Ingredients(supplier_id,ingredient_id)
VALUES (1036,2),
	   (1038,3),
	   (1038,9),
	   (1038,6),
	   (1041,5),
	   (1042,8),
	   (1042,17),
	   (1050,11),
	   (1047,10),
	   (1052,13),
	   (1053,15),
	   (1053,17),
	   (1043,12),
	   (1045,16),
	   (1039,10)










