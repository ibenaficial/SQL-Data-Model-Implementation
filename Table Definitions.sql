create schema restaurant;

create table restaurant.zip_code(
zip char(5) primary key,
city varchar(30) not null,
state char(2) not null);

create table restaurant.points(
points_acquired integer not null primary key,
member_level varchar(20),
credit_received integer);

create table restaurant.customer(
customer_id serial primary key,
last_name varchar(30) not null,
first_name varchar(30) not null,
birthday date,
email varchar(50) not null unique,
phone_number varchar(10) not null,
points_acquired integer references restaurant.points);

create table restaurant.restaurant(
restaurant_id serial primary key,
restaurant_name varchar(50) not null,
address varchar(50) not null unique,
phone_number varchar(10) not null unique,
web_site varchar(100),
email varchar(50),
cuisine_type varchar(50) not null,
zip char(5) references restaurant.zip_code);

create table restaurant.reservation(
reservation_id serial primary key,
"time" time not null,
"date" date not null,
occasion varchar(30),
number_guests integer not null,
special_notes varchar(100),
customer_id serial references restaurant.customer,
restaurant_id serial references restaurant.restaurant);

create table restaurant.table(
table_id serial primary key,
available_seat integer not null,
vacant boolean not null,
reservation_id serial references restaurant.reservation,
restaurant_id serial references restaurant.restaurant);

create table restaurant.rating(
rating_id serial primary key,
number_of_stars char(1) not null,
review text not null,
receipt_code char(10) not null,
restaurant_id serial references restaurant.restaurant,
customer_id serial references restaurant.customer);

insert into restaurant.zip_code(zip, city,state)
values 
(10001,'New York', 'NY'),
(10002,'New York', 'NY'),
(10003,'New York', 'NY'),
(10005, 'New York', 'NY'), 
(08003, 'Cherry Hills','NY'), 
(15071, 'Oakdale', 'NY'),
(10019, 'New York', 'NY'),
(11364, 'Bayside', 'NY'),
(11203, 'Flatbush', 'NY'),
(10075, 'Yorkville', 'NY'),
(10030, 'East Village', 'NY'),
(10010, 'Chelsea', 'NY');

INSERT INTO restaurant.points (points_acquired, member_level, credit_received)
VALUES (1, 'Bronze', 1), (2, 'Bronze', 2), (3, 'Bronze', 3), (4, 'Bronze', 4), (5, 'Bronze', 5), (6, 'Bronze', 6), (7, 'Bronze', 7), 
(8, 'Bronze', 8), (9, 'Bronze', 9), (10, 'Bronze', 10), (11, 'Silver', 11), (12, 'Silver', 12), (13, 'Silver', 13), (14, 'Silver', 14), 
(15, 'Silver', 15), (16, 'Silver', 16), (17, 'Silver', 17), (18, 'Silver', 18), (19, 'Silver', 19), (20, 'Silver', 20), (21, 'Gold', 21), 
(22, 'Gold', 22), (23, 'Gold', 23), (24, 'Gold', 24), (25, 'Gold', 25), (26, 'Gold', 26), (27, 'Gold', 27), (28, 'Gold', 28), (29, 'Gold', 29), 
(30, 'Gold', 30);

INSERT into restaurant.customer (last_name, first_name, birthday, email, phone_number, points_acquired)
VALUES
('smith','john','10-20-1980', 'jsmith@yahoo.com', '917000111', 10),
('ivy','craig', '11-01-1978', 'icraig@gmail.com','9171110890', 20),
('samuels', 'jody','02-02-1981', 'sjody@yahoo.com','347132233',29),
('Tusk', 'Ilon', '1971-01-10', 'ilont@tesla.com', '5168451720', 8),
('Cooke', 'Tom', '1960-05-21', 'tomc@apple.com', '7149562831', 15),
('Bates', 'Mill', '1955-12-12', 'mbates@microsoft.com', '8250673942', 27),
('Huang', 'Bena', '1995-05-21', 'benahuang@gmail.com', '6465207958', 11),
('Apple', 'John', '1989-04-30', 'johnapple123@gmail.com', '7182238492', 27),
('Jones', 'Nancy', '1956-09-23', 'nancyjones26@yahoo.com', '3472981203', 5),
('DePinto', 'Juliana','1996-06-02', 'dreynolds@gmail.com', '8456418201', 6),
('Gizzi', 'Joe', '1993-04-10','jgizzi@gmail.com', '8456418103', 22);

INSERT into restaurant.restaurant (restaurant_name, address, phone_number, web_site, email,
cuisine_type, zip)
VALUES 
('Hungry Diner', 'Castle street', '2025550113', 'hungrydiner.com', 'hungrydiner@restaurant.com', 'Mexican', 10005), 
('Island Grill', 'Harbor Road', '3136661224', 'islandgrill.com', 'islandgrill@restaurant.com', 'Polish', 08003),
('The Hot Spot', 'Legend Lane', '4247872335', 'hotspot.com', 'hotspot@restaurant.com', 'Indian', 15071), 
('Lucky Corner', '123 Bowery street', '3154534343', 'luckycorner.com','customer@luckycorner.com', 'Thai',10001),
('Vano','34 2nd Avenue', '3245678900','vano.co.uk', 'vano@gmail.com','European',10002),
('Lucio', '200 Mulberry street','347800900', 'seamlesslucio.com','lucioreservatioms@yahoo.com','Italian',10003),
('Thai Kitchen', '84 E 10th Street', '2128274459','' , 'ramenzundoya@yahoo.com', 'Thai', 10005), 
('Kenta Sushi Bar', '39-23 Bell Blvd', '7182239081', 'kentasushi.com', 'kentasushi@yahoo.com', 'Japanese', 11364), 
('Kumo Sushi', '1406 Courtelyou Road', '3472831029', 'kumosushi.com','' , 'Japanese', 11203),
('Thai Terminal', '10 E 12th St', '8456749012', 'thaiterminal.com', 'customer@thaiterminal.com', 'Thai',10003),
('Mulino ',' 63 2nd Avenue', '3245678901','www.mulino.com', 'mulino@gmail.com','Italian',10030),
('Calexico', '201 Mulberry street','347800901', 'calexico.com','calexico@yahoo.com','Mexican', 10010);

INSERT INTO restaurant.reservation("time", "date", occasion,  number_guests, special_notes, customer_id, restaurant_id)
VALUES 
('20:00', '2019-05-25','', '4', '','6', 4), 
('20:30', '2019-06-05','', '2','', '5', 5),
('21:00', '2019-07-17','','3','', '4', 6),
('04:05','2020-12-20','wedding',5,'make it nice',1,1),
('09:05','2020-12-20','birthday',4,'we are bringing cake',2,2),
('10:00','2020-12-21', 'date',2,'we need water for flowers',3,3), 
('02:45', '2020-10-03', 'Birthday', 4, '' , 7, 8), 
('10:30', '2020-09-22', '', 8, 'Allergic to shellfish', 8,10), 
('05:30', '2020-11-01', 'Anniversary', 2, 'Proposing tonight', 11, 7),
('04:00','2020-11-10', 'anniversary', 4 ,'peanut allergy',10,10),
('09:00','2020-11-05','birthday',4,'bringing balloons',11,11),
('10:00','2020-11-21', ' ',2,'',9,12);

INSERT INTO restaurant.table(available_seat, vacant, reservation_id, restaurant_id)
VALUES 
(2, true, 5,5),
(3, false,6,6), 
(4, true, 4,4),
(6,true,1,1),
(6,false,2,2),
(2,true,3,3),
(4, TRUE, 4, 5), 
(10, FALSE, 5, 6), 
(2, TRUE, 6, 4),
(4, True, 9,9),
(6, True, 10,10),
(2, True, 11,11);

INSERT INTO restaurant.rating(number_of_stars, review, receipt_code, restaurant_id, customer_id)
VALUES
('5', 'The tacos were amazing', '0918273645', 4, 6), 
('4', 'Service was very good', '1029384756', 5, 4),
('4', 'Could not handle the spice', '2130495867', 6,5),
('4','good food and service','1234567890',1,1),
('5','perfect salmon and good wine','2345678901',2,2),
('5','attentive servers, good food and atmosphere','2345678900',3,3),
('3', 'Good food, poor service', '1328BJ3KA9', 2, 4), 
('4', 'Excellent dining, we really enjoyed', 'AJE91KFN8R', 8, 7), 
('2', 'Food was cold and service was terrible', '9EJFI1KN3R', 9, 2),
('5', 'amazing food', '8539206941', 9, 10),
('3', 'slow service', '9206106941', 10, 11),
('5', 'great service and amazing atmosphere', '0794868910', 12, 11);
