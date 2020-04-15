create database cs336project;
use cs336project;

DROP TABLE IF EXISTS managers;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
user_name varchar(25) NOT NULL,
password1 varchar(25) NOT NULL, 
email varchar(64) NOT NULL
);

CREATE TABLE managers (
user_name varchar(25) NOT NULL,
password1 varchar(25) NOT NULL
);

CREATE TABLE airlines (
Airline_id varchar(2) NOT NULL,
a_name varchar(25) NOT NULL,
primary key(Airline_id)
);

CREATE TABLE airports (
Airport_id varchar(3) NOT NULL,
ap_name varchar(50) NOT NULL,
city varchar(25) NOT NULL,
state CHAR(20) NOT NULL,
country varchar(25) NOT NULL,
primary key(Airport_id));

CREATE TABLE flights (
airline_id varchar(2) NOT NULL,
flight_num INT NOT NULL,
stops varchar(50) NOT NULL,
fares INT NOT NULL,
num_seats INT NOT NULL,
working_days varchar(50),
depart_time time NOT NULL,
depart_aid varchar(2) NOT NULL,
arrive_time time NOT NULL,
arrive_aid varchar(2) NOT NULL,
foreign key(depart_aid) references airports(Airport_id),
foreign key(arrive_aid) references airports(Airport_id),
foreign key(airline_id)references airlines (Airline_id),
primary key (flight_num, airline_id)
);
/*insert manger accounts for login since manager account can't be created on the interface*/
INSERT INTO managers VALUES ('Rithvik', 'password');
INSERT INTO managers VALUES ('Harsh', 'password');
INSERT INTO managers VALUES ('Bhasit', 'password');
INSERT INTO managers VALUES ('Tamay', 'password');
INSERT INTO mangers VALUES ('Noman', 'password');

/*Insertion of Some Domestic Flight Data*/
INSERT INTO Airport VALUES('EWR', 'Newark Liberty International Airport', 'Newark', 'New Jersey', 'United States');
INSERT INTO Airport VALUES('JFK', 'John F. Kennedy International Airport', 'New York City', 'New York', 'United States');
INSERT INTO Airport VALUES('MIA', 'Miami International Airport', 'Miami', 'Florida', 'United States');
INSERT INTO Airport VALUES('SFO', 'San Francisco International Airport', 'San Franciso', 'California', 'United States');
INSERT INTO Airport VALUES('MDW', 'Midway International Airport', 'Chicago', 'Illinois', 'United States');
INSERT INTO Airport VALUES ('LAX', 'Los Angeles International Airport', 'Los Angeles', 'California', 'United States');

/*Insertion of Some International Flights*/
INSERT INTO Airport VALUES('LCY','London City Airport', 'London', 'Greater London', 'England');
INSERT INTO Airport VALUES('DUB', 'Dublin Airport', 'Dublin', 'Leinster', 'Ireland');
INSERT INTO Airport VALUES('PEK', 'Beijing Capital International Airport', 'Beijing', 'Hebei', 'China');
INSERT INTO Airport VALUES('SYD', 'Sydney Airport', 'Sydney', 'New South Wales', 'Australia');
INSERT INTO Airport VALUES('YTZ', 'Billy Bishop Toronto City Airport', 'Toronto', 'Ontario', 'Cananda');

