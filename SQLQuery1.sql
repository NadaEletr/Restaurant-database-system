create database dbReasturant_4;
use dbReasturant_4;

ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = OFF

CREATE TABLE Chef
(
  chef_id INT IDENTITY(1000,1) NOT NULL,
  chef_name VARCHAR(40) NOT NULL,
  salary NUMERIC(7,3) NOT NULL,
  phone CHAR(30),
  PRIMARY KEY (chef_id)
); 

CREATE TABLE Supplier
(
  supplier_id INT IDENTITY(1000,1) NOT NULL,
  supplier_name  VARCHAR(50) NOT NULL,
  supplier_city VARCHAR(50) check(supplier_city in('Cairo','Roma','Beirut')),
  chef_id INT  NULL,
  PRIMARY KEY (supplier_id),
  FOREIGN KEY (chef_id) REFERENCES Chef(chef_id)
);


CREATE TABLE Supplier_phone
(
  supplier_id INT NOT NULL,
  phone varchar(255) NOT NULL ,
  PRIMARY KEY (phone, supplier_id),
  FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);


CREATE TABLE Waiter
(
  waiter_id INT IDENTITY(1,1) NOT NULL,
  Waiter_name VARCHAR(30) NOT NULL,
  salary NUMERIC(7,3) NOT NULL,
  phone INT NOT NULL,
  PRIMARY KEY (waiter_id)
);  



CREATE TABLE Customer
(
  customer_id INT IDENTITY(1,1) NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  Customer_address VARCHAR(30) NULL,
  phone char(15)  NULL,
  waiter_id INT  NULL,
  PRIMARY KEY (customer_id),
  FOREIGN KEY (waiter_id) REFERENCES Waiter(waiter_id)
);    



CREATE TABLE Meal
(
  meal_id INT IDENTITY(1,1) NOT NULL,
  meal_name varchar(255) NOT NULL,
  price float NOT NULL,
  chef_id INT NOT NULL,
  PRIMARY KEY (meal_id),
  FOREIGN KEY (chef_id) REFERENCES Chef(chef_id)
); 



CREATE TABLE Orders
(
  order_id INT IDENTITY (2000,1)NOT NULL,
  order_date DATE NOT NULL,
  meal_id INT ,
  customer_id INT ,
  PRIMARY KEY (order_id),
  FOREIGN KEY (meal_id) REFERENCES Meal(meal_id),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Ingredient
(
  ingredient_id INT IDENTITY (1,1)NOT NULL,
  ingredient_name varchar(255) NOT NULL,
  Idescription varchar(255) NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (ingredient_id)
); 


CREATE TABLE Meal_Ingredients
(
  meal_id INT NOT NULL,
  ingredient_id INT NOT NULL,
  PRIMARY KEY (meal_id,ingredient_id),
  FOREIGN KEY (meal_id) REFERENCES Meal(meal_id),
  FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);

CREATE TABLE Supplier_Ingredients
(
  supplier_id INT ,
  ingredient_id INT ,
  PRIMARY KEY (supplier_id, ingredient_id),
  FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id),
  FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);

  --DDL

alter table Chef 
alter column salary float NOT NULL 

alter table waiter
alter column phone char(15) 

alter table Supplier 
alter column chef_id  int NULL ;

alter table Supplier_phone 
drop column phone;

alter table Supplier_phone 
alter column phone  char(15) Not Null ;


--Chef 
insert into Chef(chef_name,salary,phone)
values ('john',1500.000,'3301114113'),
       ('lina',1200.000,'5542157519'),
	   ('Mark',1100.000,'2355904117'),
	   ('Mohamed',5000.000,'665649911'),
	   ('Ismail',7000.000,'3301114113'),
	   ('Ali',2000.000,'5678114444'),
	   ('Amr',1500.000,'0109765412'),
	   ('Mark',8000.000,'9822114113'),
	   ('jamie',4000.000,''),
	   ('lily',6000.900,'2457814213'),
	   ('Mazen',4400.000,'7653114113'),
	   ('Mona',1600.000,'3301114113'),
	   ('lamia',1888.500,'2871114153'),
	   ('Samy',1500.000,'3301114113'),
	   ('Samir',1100.000,'6789033254'),
	   ('Medo',1100.000,''),
	   ('Micky',1100.000,'3301114113'),
	   ('korlos',8000.000,'1237890533'),
	   ('Yehia',6000.000,'6435689000'),
	   ('Sona',1000.000,'3438687100') 


--Supplier
insert into Supplier(supplier_name,supplier_city,chef_id)
values ('Mazan','Cairo',1000),
       ('loka','Roma',1001),
	   ('Magdy','Beirut',1003),
	   ('Mesho','Cairo',1002),
	   ('Ismail','Beirut',1003),
	   ('Ali','Cairo',1001),
	   ('Amir','Roma',1007),
	   ('Tokyo','Roma',1008),
	   ('Danfer','Roma',null),
	   ('Hazem','Cairo',1009),
	   ('Morad','Cairo',1008),
	   ('Youssef','Beirut',1010),
	   ('Zaoro','Beirut',1009),
	   ('Wegz','Cairo',1014),
	   ('Ziad','Roma',1017),
	   ('Medo','Roma',1015),
	   ('Korlos','Cairo',1015),
	   ('korlos','Roma',null),
	   ('Yones','Cairo',1007),
	   ('Sally','Cairo' ,1018) 


--Supplier_Phone
insert into Supplier_phone(supplier_id,phone)
values (1000,'101987521'),
	   (1000,'125889221'),
	   (1001,'123590681'),
	   (1002,'828739221'),
	   (1003,'108278100'),
	   (1004,'322445562'),
	   (1004,'152801720'),
	   (1005,'152879998'),
	   (1006,'127392022'),
	   (1007,'232434534'),
	   (1008,'1728720105'),
	   (1008,'1289896026'),
	   (1009,'2324245834'),
	   (1010,'1728726675'),
	   (1010,'1284579026'),
	   (1010,'1285533026'),
	   (1011,'1283333044'),
	   (1012,'1345333044'),
	   (1013,'1284433044'),
	   (1014,'1284433555'),
	   (1015,'1284499044'),
	   (1016,'1284433999'),
	   (1017,'1284436664'),
	   (1018,'1183533044'),
	   (1019,'1284437777'),
	   (1019,'1384411111')

--Waiter 
insert into Waiter(Waiter_name,salary,phone)
values ('Zoza',1500.000,'12325532'),
       ('lucie',6000.000,'1322321'),
	   ('Bubble',5000.000,'5235325'),
	   ('Palo',4500.000,'12323223'),
	   ('Wegz',5000.000,'6332326'),
	   ('Ali',3000.000,'4432342'),
	   ('Mego',2000.000,'77324423'),
	   ('Tamer',5000.000,'2232422'),
	   ('Turkey',1800.000,''),
	   ('Haze',2000.000,'9933422'),
	   ('Deiab',3000.000,'356644'),
	   ('Youssef',6000.000,'1442323'),
	   ('Zaoro',1000.000,''),
	   ('Wegz',1500.000,''),
	   ('Ziad',3000.000,'1923232'),
	   ('Medo',4000.000,'2536993'),
	   ('Hoka',1500.000,'5459453'),
	   ('Dalia',6000.000,'632322'),
	   ('Maida',3500.000,'722211'),
	   ('Seko',2500.000,'8928121')

--Customer 
insert into Customer (first_name,last_name,phone,Customer_address,waiter_id)
VALUES('Robby','Sykes','(516) 583-7761','486 Rock Maple Street',1),
        ('Lashawn','Ortiz',NULL,'27 Washington Rd',1),
       ('Garry','Espinoza',NULL,'7858 Rockaway Court',NULL),
      ('Linnie','Branch',NULL,'314 South Columbia Ave.',2),
      ('Emmitt','Sanchez','(212) 945-8823','461 Squaw Creek Road ',3),
        ('Caren','Stephens',NULL,'914 Brook St. ',2),
      ('Georgetta','Hardin',NULL,'474 Chapel Dr. ',4),
      ('Lizzette','Stein',NULL,'19 Green Hill Lane ',5),
     ('Aleta','Shepard',NULL,'684 Howard St. ',5),
     ('Tobie','Little',NULL,'10 Silver Spear Dr. ',6),
     ('Adelle','Larsen',NULL,'683 West Kirkland Dr. ',7),
     ('Kaylee','English',NULL,'8786 Fulton Rd. ',7),
     ('Corene','Wall',NULL,'9601 Ocean Rd. ',7),
     ('Regenia','Vaughan',NULL,'44 Stonybrook Street ',8),
     ('Theo','Reese','(562) 215-2907','8755 W. Wild Horse St. ',8),
     ('Santos','Valencia',NULL,'7479 Carpenter Street ',9),
     ('Jeanice','Frost',NULL,'76 Devon Lane ',10),
     ('Syreeta','Hendricks',NULL,'193 Spruce Road ',11),
     ('Jamaal','Albert',NULL,'853 Stonybrook Street ',11),
     ('Williemae','Holloway','(510) 246-8375','69 Cypress St. ',12),
     ('Araceli','Golden',NULL,'12 Ridgeview Ave. ',12),
     ('Deloris','Burke',NULL,'895 Edgemont Drive ',12),
     ('Brittney','Woodward',NULL,'960 River St. ',13),
     ('Guillermina','Noble',NULL,'6 Del Monte Lane ',13),
     ('Bernita','Mcdaniel',NULL,'2 Peg Shop Ave. ',14),
     ('Melia','Brady',NULL,'907 Shirley Rd. ',14),
     ('Zelma','Browning',NULL,'296 Second Street ',14),
     ('Janetta','Aguirre','(717) 670-2634','214 Second Court ',15),
     ('Ronna','Butler',NULL,'9438 Plymouth Court ',15),
     ('Kathie','Freeman',NULL,'667 Temple Dr. ',16),
     ('Tangela','Quinn',NULL,'4 S. Purple Finch Road ',17),
     ('Mozelle','Carter','(281) 489-9656','895 Chestnut Ave. ',17),
     ('Onita','Johns',NULL,'32 Glen Creek Lane ',17),
     ('Bennett','Armstrong',NULL,'688 Walnut Street ',17),
     ('Monika','Berg',NULL,'369 Vernon Dr. ',18),
     ('Bridgette','Guerra',NULL,'9982 Manor Drive ',18),
     ('Cesar','Jackson',NULL,'8068 N. Griffin Ave. ',19),
     ('Caroll','Hays',NULL,'9381 Wrangler St. ',19),
     ('Cleotilde','Booth',NULL,'17 Corona St. ',19),
     ('Gertrud','Rhodes',NULL,'9961 Meadowbrook Street ',20),
     ('Tu','Ramirez',NULL,'24 W. Courtland Street ',20),
     ('Saturnina','Garner',NULL,'8538 Fairground St. ',20),
     ('Diana','Guerra',NULL,'45 Chapel Ave. ',2),
     ('Lolita','Mosley','(281) 363-3309','376 S. High Ridge St. ',3),
     ('Pamala','Henry',NULL,'197 Bridgeton Ave. ',5),
     ('Damien','Dorsey',NULL,'161 Old York Street ',6),
     ('Latasha','Stanley',NULL,'8068 Fordham Drive ',6),
     ('Neil','Mccall',NULL,'7476 Oakland Dr. ',7),
     ('Elinore','Aguilar',NULL,'9766 Rockcrest Ave. ',10),
     ('Alica','Hunter',NULL,'8 San Juan Drive ',10),
     ('Tenisha','Lyons',NULL,'78 E. Rock Creek Street ',12),
     ('Bobbie','Foster',NULL,'988 Pineknoll Ave. ',12),
     ('Kanesha','Vega',NULL,'771 E. Oxford Drive ',12),
     ('Lorrie','Becker',NULL,'19 North Court ',NULL)

--Ingredients 
insert into Ingredient (ingredient_name,Idescription,quantity)
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
		('spinach','leafy green',80),
		('lettuce','leafy green',100),
		('cucumber','root',120),
		('zucchini','root',120),
		('brown Rice','rice',20),
		('basmati Rice','rice',30),
		('banana','fruits',200),
		('whole milk','dairy',20),
		('cheese','dairy',30),
        ('minced meat','meat',120),
		('fried chicken','chicken',150),
		('sausages','meat',170)

ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = OFF	
--Meal 
insert into Meal(meal_name,price,chef_id)
VALUES ('Fruit Salad',50,1000),
	   ('Green Salad',80,1000),
	   ('Chicken Salad',100,1000),
	   ('Beef Burger',150,1005),
	   ('Chicken Burger',170,1005),
	   ('Hot Dog',80,1005),
	   ('Chicken Pizza ',200,1008),
	   ('Vegtables Pizza ',130,1008),
	   ('Cheese Pizza ',150,1008),
	   ('Cheese Sandwitch',70,1017),
	   ('Onion Soup',50,1012),
	   ('Vegtables Soup',50,1002),
	   ('Tomato Soup',70,1012),
	   ('French Fries',30,1014),
	   ('Apple juice',15,1012),
	   ('Pinapple juice',15,1012),
	   ('Tea',15,1016),
	   ('Latte',15,1016),
	   ('Mango cake',90,1010),
	   ('Cheese Cake',100,1018),
	   ('Pasta',180,1003),
	   ('Risotto',200,1013),
	   ('Picata',160,1007),
	   ('Smoked Salmon',170,1015),
	   ('Chicken Soup',90,1012),
	   ('Mushroom Soup',200,1008),
	   ('Caser Salad ',130,1002),
	   ('Smoked Turkey ',150,1018),
	   ('Pepper Steak',170,1018),
	   ('Crispy Chicken',50,1012),
	   ('Mac and Cheese Pasta',250,1009),
	   ('Nutella French Toast',120,1001),
	   ('Banana Caramel Crepe',132,1014),
	   ('Cappuccino',15,1012),
	   ('Mocha',15,1012),
	   ('Turkish Coffee',25,1006),
	   ('Flat White',25,1006),
	   ('Snickers Mocha',30,1010)


--Meal_ingredient
insert into Meal_Ingredients(meal_id,ingredient_id)
VALUES (1,2),
	   (1,6),
	   (1,5),
	   (2,9),
	   (2,12),
	   (2,13),
	   (3,21),
	   (3,14),
	   (4,5),
	   (4,6),
	   (4,2),
	   (6,22),
	   (10,22),
	   (11,22),
	   (12,12),
	   (13,5),
	   (23,9),
	   (25,12),
	   (26,13),
	   (33,17),
	   (31,14),
	   (19,5),
	   (14,14),
	   (15,2),
	   (6,6),
	   (16,6),
	   (10,2)


--supplier_ingredient
insert into supplier_Ingredients(supplier_id,ingredient_id)
VALUES (1000,2),
	   (1000,3),
	   (1001,9),
	   (1002,6),
	   (1003,5),
	   (1004,8),
	   (1004,17),
	   (1005,11),
	   (1006,10),
	   (1007,13),
	   (1007,15),
	   (1008,17),
	   (1009,12),
	   (1010,16),
	   (1011,10),
	   (1012,2),
	   (1013,13),
	   (1014,9),
	   (1015,6),
	   (1015,5),
	   (1016,18),
	   (1016,17),
	   (1016,16),
	   (1017,10),
	   (1018,13),
	   (1019,15),
	   (1019,17),
	   (1019,1),
	   (1000,4),
	   (1000,7)

-- Order
insert into Orders (order_date ,meal_id ,customer_id )
 VALUES('2021-01-03',2,1),
       ('2021-01-03',6,2),
	   ('2021-01-03',9,2),
       ('2021-01-02',7,2),
       ('2021-01-03',2,NULL),
       ('2021-01-03',6,3),
	   ('2021-01-03',7,4),
       ('2021-01-05',6,4),
	   ('2021-01-05',10,5),
	   ('2021-01-05',2,6),
	   ('2021-01-05',6,6),
       ('2021-01-05',NULL,7),
       ('2021-01-08',2,8),
       ('2021-01-06',6,9),
       ('2021-01-07',7,9),
       ('2021-01-09',2,10),
       ('2021-01-11',6,11),
	   ('2021-01-12',8,NULL),
       ('2021-01-16',7,12), 
	   ('2021-01-03',2,13),
       ('2021-01-03',6,14),
       ('2021-01-09',7,15),
       ('2021-01-03',10,NULL),
       ('2021-01-03',6,16),
       ('2021-01-05',6,17),
	   ('2021-01-04',6,18),
       ('2021-01-02',NULL,19),
       ('2021-01-01',2,19),
       ('2021-01-06',6,20),
       ('2021-01-07',7,21),
       ('2021-01-09',2,22),
       ('2021-01-15',6,23),
	   ('2021-01-14',NULL,NULL),
       ('2021-01-12',7,24)

 

--SELECT 

select * from chef;
select * from Supplier;
select * from Supplier_phone;
select * from Ingredient;
select * from Supplier_Ingredients;
select * from Waiter;
select * from Customer;
select * from Orders;
select * from Meal;
select * from Meal_Ingredients;



select * from Chef where salary >2000; -- salaries above 2000
select * from supplier where supplier_city = 'Cairo'; -- city is cairo
select * from orders where order_date between '2021-01-03' and '2021-01-05';

select distinct supplier_city from supplier;
select distinct idescription ,quantity  from Ingredient where quantity= 100 or quantity=50;

select * from customer where first_name like 'a%' ;
select * from customer where first_name like '%e%' ;
select * from waiter where waiter_name like '_e%' ;

select meal_id , meal_name, price from meal order by price ASC;
select meal_id , meal_name, price from meal order by price DESC;

select  count(*) as total_ingredients from Ingredient where idescription= 'vegtables' group by idescription; --types of vegtables
select avg(salary) as average_salary from chef;
select  Idescription,count(*) as type_of_ingredients,sum(quantity) as sum_quantity from Ingredient group by Idescription having  sum(quantity) <1000;
select max(salary) as max_salary, min(salary) as min_salary from waiter ;
select Supplier_city , count (*) as number_of_supplier from supplier group by supplier_city; 


select first_name , last_name , order_date, order_id 
from Customer c inner join Orders o
on c.customer_id = o.customer_id; -- all customers had orders

select c.first_name , c.last_name , o.order_date, o.order_id, c.Customer_address 
from Customer c left outer join Orders o
on c.customer_id = o.customer_id
order by c.customer_id DESC; -- all customers that ordered an order or customers that don't have an order

select c.first_name , c.last_name , o.order_date, o.order_id, c.Customer_address 
from Customer c left outer join Orders o
on c.customer_id = o.customer_id
where o.customer_id is null; -- all customers that don't have an order;

select c.first_name , c.last_name , o.order_date, o.order_id, c.Customer_address 
from Customer c right outer join Orders o
on c.customer_id = o.customer_id; -- all customers that ordered an order or customers cancelled an order

select c.chef_name , c.chef_id , s.supplier_name ,s.supplier_id 
from chef c full outer join Supplier s 
on  c.chef_id =s.chef_id;--all

select first_name+' '+last_name as customer_name , order_id , order_date , meal_name
from Customer c join orders o on c.customer_id = o.customer_id
join meal m on o.meal_id = m.meal_id; -- all meals that are ordered by customers 

select top 3 chef_name , salary
from chef 
order by salary DESC;

select top 50 percent chef_name , salary
from chef 
order by salary ASC;

select  chef_name ,  chef_id , salary
from chef where chef_id in (select chef_id from meal where price>100 group by chef_id );-- all chefs made meals above 100





















