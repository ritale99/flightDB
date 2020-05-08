DROP DATABASE IF EXISTS cs336project;
create database cs336project;
use cs336project;

DROP TABLE IF EXISTS managers;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS airlines;
DROP TABLE IF EXISTS Airport;
DROP TABLE IF EXISTS flights;
DROP TABLE IF EXISTS Airline;
DROP TABLE IF EXISTS Flightdate;

CREATE TABLE users (
user_id INT NOT NULL auto_increment,
user_name varchar(25) NOT NULL,
password1 varchar(25) NOT NULL, 
email varchar(64) NOT NULL,
phone varchar(16),
credit_card varchar(19),
credit_cvv varchar(5),
profits DECIMAL(15,2),
primary key(user_id) 
);



CREATE TABLE managers (
user_name varchar(25) NOT NULL,
password1 varchar(25) NOT NULL
);


CREATE TABLE airlines (
a_name varchar(50) NOT NULL,
Airline_id varchar(2) NOT NULL,
primary key(Airline_id)
);

CREATE TABLE Airport (
Airport_id varchar(3) NOT NULL,
ap_name varchar(60) NOT NULL,
city varchar(25) NOT NULL,
state CHAR(20) NOT NULL,
country varchar(25) NOT NULL,
profits DECIMAL(60, 2),
primary key(Airport_id));

CREATE TABLE flights (
airline_id varchar(2) NOT NULL,
flight_num INT NOT NULL,
fare_first DECIMAL(7, 2) NOT NULL,
num_seats INT NOT NULL,
depart_time time NOT NULL,
depart_aid varchar(3) NOT NULL,
arrive_time time NOT NULL,
arrive_aid varchar(3) NOT NULL,
flight_days VARCHAR(12) NOT NULL, 
flight_type VARCHAR(15) NOT NULL,
profits DECIMAL(50, 2),
num_reserves INT NOT NULL,
arr_dep_time VARCHAR(25) NOT NULL,
foreign key(depart_aid) references Airport(Airport_id),
foreign key(arrive_aid) references Airport(Airport_id),
foreign key(airline_id)references airlines (Airline_id),
primary key (flight_num, airline_id)
);


CREATE Table FlightDate (
depart_date date NOT NULL,
arrive_date date NOT NULL,
flight_id INT NOT NULL,
PRIMARY KEY (depart_date, arrive_date, flight_id),
FOREIGN KEY (flight_id) REFERENCES flights(flight_num)
on delete cascade
on update cascade
);

CREATE TABLE Reservations (
res_num INT NOT NULL auto_increment,
res_date date NOT NULL,
res_fare DECIMAL,
res_tot DECIMAL, 
customer INT NOT NULL,
num_passengers INT,
flight_no INT NOT NULL,
foreign key (flight_no) REFERENCES flights (flight_num),
PRIMARY KEY (res_num),
FOREIGN KEY (customer) REFERENCES users (user_id) ON DELETE CASCADE
);

CREATE TABLE Trips(
res_num INT NOT NULL,
flights INT,
flights2 INT,
flights3 INT
);

/*Insert a test account user*/
INSERT INTO users VALUES (1, 'Tanmay', 'password', 'tanmay@test.com', NULL, NULL, NULL, 0);
INSERT INTO users VALUES (2, 'Rithvik', 'password', 'rithvik@test.com', NULL, NULL, NULL, 0);
INSERT INTO users VALUES (3, 'Harsh', 'password', 'harsh@test.com', NULL, NULL, NULL, 0);
INSERT INTO users VALUES (4, 'Bhasit', 'password', 'bhasit@test.com', NULL, NULL, NULL, 0);
INSERT INTO users VALUES (5, 'Noman', 'password', 'noman@test.com', NULL, NULL, NULL, 0);

/*insert manger accounts for login since manager account can't be created on the interface*/
INSERT INTO managers VALUES ('Rithvik', 'password');
INSERT INTO managers VALUES ('Harsh', 'password');
INSERT INTO managers VALUES ('Bhasit', 'password');
INSERT INTO managers VALUES ('Tanmay', 'password');
INSERT INTO managers VALUES ('Noman', 'password');

/*Insertion of Some Domestic Flight Data*/
INSERT INTO Airport VALUES('EWR', 'Newark Liberty International Airport', 'Newark', 'New Jersey', 'United States', 0);
INSERT INTO Airport VALUES('JFK', 'John F. Kennedy International Airport', 'New York City', 'New York', 'United States', 0);
INSERT INTO Airport VALUES('MIA', 'Miami International Airport', 'Miami', 'Florida', 'United States', 0);
INSERT INTO Airport VALUES('SFO', 'San Francisco International Airport', 'San Franciso', 'California', 'United States', 0);
INSERT INTO Airport VALUES('MDW', 'Midway International Airport', 'Chicago', 'Illinois', 'United States', 0);
INSERT INTO Airport VALUES ('LAX', 'Los Angeles International Airport', 'Los Angeles', 'California', 'United States', 0);
INSERT INTO Airport VALUES ('ATL', 'Hartsfield Jackson Atlanta International Airport','Atlanta' ,'Georgia', 'United States', 0);
INSERT INTO Airport VALUES ('ORD', 'O Hare International Airport','Chicago', 'Illinois', 'United States', 0);
INSERT INTO Airport VALUES ('DFW', 'Dallas/Forth Worth International Airport', 'Dallas','Texas', 'United States', 0);
INSERT INTO Airport VALUES ('DEN', 'Denver International Airport','Denver' ,'Colorodo', 'United States', 0);
INSERT INTO Airport VALUES ('SEA', 'Seattle-Tacoma International Airport','Seattle','Washington', 'United States', 0);
INSERT INTO Airport VALUES ('LAS', 'McCarran International Airport', 'Las Vegas','Nevada', 'United States', 0);
INSERT INTO Airport VALUES ('MCO', 'Orlando International Airpott', 'Orlando','Florida', 'United States', 0);
INSERT INTO Airport VALUES ('CLT', 'Charlotte Douglass International Airport', 'Charlotte','North Carolina', 'United States', 0);
INSERT INTO Airport VALUES ('PHX', 'Phenix Sky Harbor International Airport', 'Pheoniz','Arizona', 'United States', 0);
INSERT INTO Airport VALUES ('IAH', 'George Bush Intercontinental Airport', 'Houston','Texas', 'United States', 0);
INSERT INTO Airport VALUES ('BOS', 'General Edward Lawrence Logan International Airport', 'Boston','Massachusetts', 'United States', 0);
INSERT INTO Airport VALUES ('MSP', 'Minneapolis–Saint Paul International Airport', 'Minneapolis','Minnesota', 'United States', 0);
INSERT INTO Airport VALUES ('FLL', 'Fort Lauderdale-Hollywood International Airport', 'Fort Lauderdale','Florida', 'United States', 0);
INSERT INTO Airport VALUES ('DTW', 'Detroit Metropolitan Airport', 'Detroit','Michigan', 'United States', 0);
INSERT INTO Airport VALUES ('PHL', 'Philadelphia International Airport', 'Philadelphia','Pennsylvania', 'United States', 0);
INSERT INTO Airport VALUES ('LGA', 'LaGuardia', 'New York','New York', 'United States', 0);

/*Insertion of Some International Flights*/
INSERT INTO Airport VALUES('LCY','London City Airport', 'London', 'Greater London', 'England', 0);
INSERT INTO Airport VALUES('DUB', 'Dublin Airport', 'Dublin', 'Leinster', 'Ireland', 0);
INSERT INTO Airport VALUES('PEK', 'Beijing Capital International Airport', 'Beijing', 'Hebei', 'China', 0);
INSERT INTO Airport VALUES('SYD', 'Sydney Airport', 'Sydney', 'New South Wales', 'Australia', 0);
INSERT INTO Airport VALUES('YTZ', 'Billy Bishop Toronto City Airport', 'Toronto', 'Ontario', 'Cananda', 0);

/*Domestic*/
INSERT INTO airlines Values('Seaborne','BB');
INSERT INTO airlines Values('Sevenair ','UG');
INSERT INTO airlines Values('Sun Country','SY');
INSERT INTO airlines Values('Skywalk Airlines','AL');
INSERT INTO airlines Values('Delta','DL');
INSERT INTO airlines Values ('American Airlines','AA');
INSERT INTO airlines Values ('Alaska Airlines', 'AS');
INSERT INTO airlines VALUES ('Allegiant Air', 'G4');
INSERT INTO airlines VALUES ('Frontier Airlines', 'F9');
INSERT INTO airlines VALUES ('Southwest', 'WN');
INSERT INTO airlines VALUES ('Spirit', 'NK');
INSERT INTO airlines VALUES ('United', 'UA');


/*International*/
INSERT INTO airlines Values('Tap Portugal','TP');
INSERT INTO airlines Values('Aer Lingus','EI');
INSERT INTO airlines Values('Airfrance','AF');
INSERT INTO airlines Values('British Airways','BA');
INSERT INTO airlines Values('Virgin Australia Regional Airlines','VA');
/*
INSERT INTO flights VALUES('2 DIG airline id', '12345','STOPS','FARES', 'NUM_SEATS', 'DEPART_TIME', 'depart_AID', 'Arrive_time', 'arrive_aid', 'days', 'domestic?' );
*/
/*Insertion of some domestic flights*/
INSERT INTO flights VALUES ('BB', '12345','160','50', '11:02', 'MIA','14:10', 'EWR', 'MTWRFSaSu', 'domestic', 0, 0, 'ON TIME');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-08', '12345');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-09', '12345');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-10', '12345');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-11', '12345');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-12', '12345');

INSERT INTO FlightDate VALUES('2020-06-05', '2020-06-05', '12345');
INSERT INTO FlightDate VALUES('2020-06-06', '2020-06-06', '12345');
INSERT INTO FlightDate VALUES('2020-06-07', '2020-06-07', '12345');
INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-08', '12345');
INSERT INTO FlightDate VALUES('2020-06-09', '2020-06-09', '12345');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-10', '12345');
INSERT INTO FlightDate VALUES('2020-06-11', '2020-06-11', '12345');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-12', '12345');

INSERT INTO flights VALUES ('UA', '13345','160','50', '11:02', 'MIA','14:10', 'EWR', 'MTWRFSaSu', 'domestic', 0, 0, 'ON TIME');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-08', '13345');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-09', '13345');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-10', '13345');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-11', '13345');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-12', '13345');

INSERT INTO FlightDate VALUES('2020-06-05', '2020-06-05', '13345');
INSERT INTO FlightDate VALUES('2020-06-06', '2020-06-06', '13345');
INSERT INTO FlightDate VALUES('2020-06-07', '2020-06-07', '13345');
INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-08', '13345');
INSERT INTO FlightDate VALUES('2020-06-09', '2020-06-09', '13345');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-10', '13345');
INSERT INTO FlightDate VALUES('2020-06-11', '2020-06-11', '13345');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-12', '13345');

INSERT INTO flights VALUES ('AS', '16666','160','50', '11:02', 'MIA','14:10', 'EWR', 'MTWRFSaSu', 'domestic', 0, 0, 'ON TIME');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-08', '16666');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-09', '16666');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-10', '16666');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-11', '16666');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-12', '16666');

INSERT INTO FlightDate VALUES('2020-06-05', '2020-06-05', '16666');
INSERT INTO FlightDate VALUES('2020-06-06', '2020-06-06', '16666');
INSERT INTO FlightDate VALUES('2020-06-07', '2020-06-07', '16666');
INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-08', '16666');
INSERT INTO FlightDate VALUES('2020-06-09', '2020-06-09', '16666');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-10', '16666');
INSERT INTO FlightDate VALUES('2020-06-11', '2020-06-11', '16666');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-12', '16666');

INSERT INTO flights VALUES ('BB', '12379','160','50', '11:02', 'EWR','14:10', 'MIA', 'MTWRFSaSu', 'domestic', 0, 0, 'ON TIME');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-08', '12379');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-09', '12379');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-10', '12379');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-11', '12379');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-12', '12379');
INSERT INTO FlightDate VALUES('2020-05-13', '2020-05-13', '12379');

INSERT INTO FlightDate VALUES('2020-06-06', '2020-06-06', '12379');
INSERT INTO FlightDate VALUES('2020-06-07', '2020-06-07', '12379');
INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-08', '12379');
INSERT INTO FlightDate VALUES('2020-06-09', '2020-06-09', '12379');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-10', '12379');
INSERT INTO FlightDate VALUES('2020-06-11', '2020-06-11', '12379');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-12', '12379');
INSERT INTO FlightDate VALUES('2020-06-13', '2020-06-13', '12379');

INSERT INTO flights VALUES ('UA', '12669','160','50', '11:02', 'EWR','14:10', 'MIA', 'MTWRFSaSu', 'domestic', 0, 0, 'ON TIME');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-08', '12669');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-09', '12669');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-10', '12669');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-11', '12669');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-12', '12669');
INSERT INTO FlightDate VALUES('2020-05-13', '2020-05-13', '12669');

INSERT INTO FlightDate VALUES('2020-06-06', '2020-06-06', '12669');
INSERT INTO FlightDate VALUES('2020-06-07', '2020-06-07', '12669');
INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-08', '12669');
INSERT INTO FlightDate VALUES('2020-06-09', '2020-06-09', '12669');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-10', '12669');
INSERT INTO FlightDate VALUES('2020-06-11', '2020-06-11', '12669');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-12', '12669');
INSERT INTO FlightDate VALUES('2020-06-13', '2020-06-13', '12669');


INSERT INTO flights VALUES ('UA', '38798', '250','200', '09:02', 'EWR', '14:10','LAX', 'MTWRFSaSu', 'domestic', 0, 0, 'ON TIME');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-08', '38798');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-09', '38798');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-10', '38798');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-11', '38798');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-12', '38798');

INSERT INTO FlightDate VALUES('2020-06-05', '2020-06-06', '38798');
INSERT INTO FlightDate VALUES('2020-06-06', '2020-06-07', '38798');
INSERT INTO FlightDate VALUES('2020-06-07', '2020-06-08', '38798');
INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-08', '38798');
INSERT INTO FlightDate VALUES('2020-06-09', '2020-06-09', '38798');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-10', '38798');
INSERT INTO FlightDate VALUES('2020-06-11', '2020-06-11', '38798');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-12', '38798');

INSERT INTO flights VALUES ('UA', '38765', '250','200', '09:02', 'LAX', '14:10','EWR', 'MTWRFSaSu', 'domestic', 0, 0, 'ON TIME');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-08', '38765');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-09', '38765');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-10', '38765');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-11', '38765');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-12', '38765');

INSERT INTO FlightDate VALUES('2020-06-06', '2020-06-06', '38765');
INSERT INTO FlightDate VALUES('2020-06-07', '2020-06-07', '38765');
INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-08', '38765');
INSERT INTO FlightDate VALUES('2020-06-09', '2020-06-09', '38765');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-10', '38765');
INSERT INTO FlightDate VALUES('2020-06-11', '2020-06-11', '38765');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-12', '38765');
INSERT INTO FlightDate VALUES('2020-06-13', '2020-06-13', '38765');


INSERT INTO flights VALUES ('UA', '19990', '250','210','09:02', 'JFK', '14:10','SFO', 'MTWRFSaSu', 'domestic', 0, 0, 'ON TIME');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-08', '19990');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-09', '19990');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-10', '19990');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-11', '19990');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-12', '19990');

INSERT INTO FlightDate VALUES('2020-06-05', '2020-06-05', '19990');
INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-08', '19990');
INSERT INTO FlightDate VALUES('2020-06-09', '2020-06-09', '19990');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-10', '19990');
INSERT INTO FlightDate VALUES('2020-06-11', '2020-06-11', '19990');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-12', '19990');

INSERT INTO flights VALUES ('UA', '19741', '250','210','09:02', 'SFO', '14:10','JFK', 'MTWRFSaSu', 'domestic', 0, 0, 'ON TIME');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-08', '19741');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-08', '19741');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-10', '19741');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-11', '19741');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-12', '19741');
INSERT INTO FlightDate VALUES('2020-05-13', '2020-05-13', '19741');

INSERT INTO FlightDate VALUES('2020-06-05', '2020-06-05', '19741');
INSERT INTO FlightDate VALUES('2020-06-06', '2020-06-06', '19741');
INSERT INTO FlightDate VALUES('2020-06-07', '2020-06-07', '19741');
INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-08', '19741');
INSERT INTO FlightDate VALUES('2020-06-09', '2020-06-08', '19741');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-10', '19741');
INSERT INTO FlightDate VALUES('2020-06-11', '2020-06-11', '19741');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-12', '19741');
INSERT INTO FlightDate VALUES('2020-06-13', '2020-06-13', '19741');

INSERT INTO flights VALUES ('DL', '19742', '250','210','09:02', 'JFK', '14:10','DEN', 'MTWRFSaSu', 'domestic', 0, 0, 'ON TIME');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-08', '19742');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-09', '19742');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-10', '19742');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-11', '19742');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-12', '19742');

INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-08', '19742');
INSERT INTO FlightDate VALUES('2020-06-09', '2020-06-09', '19742');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-10', '19742');
INSERT INTO FlightDate VALUES('2020-06-11', '2020-06-11', '19742');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-12', '19742');


INSERT INTO flights VALUES ('DL', '19743', '250','210','09:02', 'DEN', '14:10','JFK', 'MTWRFSaSu', 'domestic', 0, 0, 'ON TIME');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-08', '19743');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-09', '19743');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-10', '19743');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-11', '19743');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-12', '19743');
INSERT INTO FlightDate VALUES('2020-05-13', '2020-05-13', '19743');

INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-08', '19743');
INSERT INTO FlightDate VALUES('2020-06-09', '2020-06-09', '19743');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-10', '19743');
INSERT INTO FlightDate VALUES('2020-06-11', '2020-06-11', '19743');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-12', '19743');
INSERT INTO FlightDate VALUES('2020-06-13', '2020-06-13', '19743');

INSERT INTO flights VALUES ('DL', '19443', '250','210','09:02', 'DEN', '14:10','ATL', 'MTWRFSaSu', 'domestic', 0, 0, 'ON TIME');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-08', '19443');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-09', '19443');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-10', '19443');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-11', '19443');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-12', '19443');
INSERT INTO FlightDate VALUES('2020-05-13', '2020-05-13', '19443');

INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-08', '19443');
INSERT INTO FlightDate VALUES('2020-06-09', '2020-06-09', '19443');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-10', '19443');
INSERT INTO FlightDate VALUES('2020-06-11', '2020-06-11', '19443');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-12', '19443');
INSERT INTO FlightDate VALUES('2020-06-13', '2020-06-13', '19443');




/*Insertion of domestic to international flights and international to domestic*/
INSERT INTO flights VALUES ('BA', '86344', '900','210','09:02', 'JFK', '14:10','LCY', 'MTWRFSaSu', 'international', 0, 0, 'ON TIME');
INSERT INTO FlightDate VALUES('2020-05-05', '2020-05-06', '86344');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-09', '86344');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-10', '86344');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-11', '86344');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-12', '86344');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-13', '86344');
INSERT INTO FlightDate VALUES('2020-05-13', '2020-05-14', '86344');
INSERT INTO FlightDate VALUES('2020-05-14', '2020-05-15', '86344');


INSERT INTO flights VALUES ('BA', '57354', '900','210','09:02', 'LCY', '14:10','JFK', 'MTWRFSaSu', 'international', 0, 0, 'ARRIVAL DELAYED');
INSERT INTO FlightDate VALUES('2020-05-06', '2020-05-07', '57354');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-09', '57354');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-11', '57354');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-12', '57354');
INSERT INTO FlightDate VALUES('2020-05-13', '2020-05-14', '57354');
INSERT INTO FlightDate VALUES('2020-05-14', '2020-05-15', '57354');
INSERT INTO FlightDate VALUES('2020-05-15', '2020-05-16', '57354');

INSERT INTO FlightDate VALUES('2020-06-06', '2020-06-07', '57354');
INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-09', '57354');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-11', '57354');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-12', '57354');
INSERT INTO FlightDate VALUES('2020-06-13', '2020-06-14', '57354');
INSERT INTO FlightDate VALUES('2020-06-14', '2020-06-15', '57354');
INSERT INTO FlightDate VALUES('2020-06-15', '2020-06-16', '57354');

INSERT INTO flights VALUES ('AF', '64257', '950','210','09:02', 'JFK', '14:10','LCY', 'MTWRFSaSu', 'international', 0, 0, 'ARRIVAL DELAYED');
INSERT INTO FlightDate VALUES('2020-05-05', '2020-05-06', '64257');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-09', '64257');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-10', '64257');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-11', '64257');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-12', '64257');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-13', '64257');
INSERT INTO FlightDate VALUES('2020-05-13', '2020-05-14', '64257');

INSERT INTO FlightDate VALUES('2020-06-05', '2020-06-06', '64257');
INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-09', '64257');
INSERT INTO FlightDate VALUES('2020-06-09', '2020-06-10', '64257');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-11', '64257');
INSERT INTO FlightDate VALUES('2020-06-11', '2020-06-12', '64257');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-13', '64257');
INSERT INTO FlightDate VALUES('2020-06-13', '2020-06-14', '64257');

INSERT INTO flights VALUES ('AF', '79527', '950','210','09:02', 'LCY', '14:10','JFK', 'MTWRFSaSu', 'international', 0, 0, 'DEPARTING DELAYED');
INSERT INTO FlightDate VALUES('2020-05-06', '2020-05-07', '79527');
INSERT INTO FlightDate VALUES('2020-05-08', '2020-05-09', '79527');
INSERT INTO FlightDate VALUES('2020-05-09', '2020-05-10', '79527');
INSERT INTO FlightDate VALUES('2020-05-10', '2020-05-11', '79527');
INSERT INTO FlightDate VALUES('2020-05-11', '2020-05-12', '79527');
INSERT INTO FlightDate VALUES('2020-05-12', '2020-05-13', '79527');
INSERT INTO FlightDate VALUES('2020-05-13', '2020-05-14', '79527');
INSERT INTO FlightDate VALUES('2020-05-14', '2020-05-15', '79527');

INSERT INTO FlightDate VALUES('2020-06-01', '2020-06-02', '79527');
INSERT INTO FlightDate VALUES('2020-06-02', '2020-06-03', '79527');
INSERT INTO FlightDate VALUES('2020-06-03', '2020-06-04', '79527');
INSERT INTO FlightDate VALUES('2020-06-04', '2020-06-05', '79527');
INSERT INTO FlightDate VALUES('2020-06-05', '2020-06-05', '79527');
INSERT INTO FlightDate VALUES('2020-06-06', '2020-06-07', '79527');
INSERT INTO FlightDate VALUES('2020-06-08', '2020-06-09', '79527');
INSERT INTO FlightDate VALUES('2020-06-09', '2020-06-10', '79527');
INSERT INTO FlightDate VALUES('2020-06-10', '2020-06-11', '79527');
INSERT INTO FlightDate VALUES('2020-06-11', '2020-06-12', '79527');
INSERT INTO FlightDate VALUES('2020-06-12', '2020-06-13', '79527');
INSERT INTO FlightDate VALUES('2020-06-13', '2020-06-14', '79527');
INSERT INTO FlightDate VALUES('2020-06-14', '2020-06-15', '79527');


INSERT INTO flights VALUES ('VA', '85013', '940','210','09:02', 'EWR', '14:10','SYD', 'MTWRFSaSu', 'international', 0, 0, 'DEPARTING DELAYED');
INSERT INTO FlightDate VALUES('2020-05-05', '2020-05-06', '85013');

INSERT INTO flights VALUES ('VA', '97500', '940','210','09:02', 'SYD', '14:10','EWR', 'MTWRFSaSu', 'international', 0, 0, 'ON TIME');
INSERT INTO FlightDate VALUES('2020-05-06', '2020-05-07', '97500');

/*Reservation 1, EWR to MIA: 12379*/
SET @flight_num := 12379;
SET @num_passengers := 1;
SET @user_id := (SELECT user_id FROM users WHERE user_name = 'Bhasit');
SET @flight_fare := (SELECT fare_first FROM flights WHERE flight_num = @flight_num);
SET @total_fare := (@flight_fare * @num_passengers);
SET @res_date := '2020-01-01';
UPDATE flights SET num_seats = (num_seats - @num_passengers) WHERE flights.flight_num = @flight_num;
INSERT INTO Reservations (res_date, res_fare, res_tot, customer, num_passengers, flight_no) VALUES (@res_date, @flight_fare, @total_fare, @user_id, @num_passengers, @flight_num);
INSERT INTO Trips (res_num, flights) VALUES (@@identity, @flight_num);
UPDATE users SET profits=(profits+@total_fare) WHERE user_id= @user_id;
UPDATE flights SET profits=(profits+@total_fare), num_reserves=num_reserves+1 WHERE flight_num=@flight_num;
UPDATE Airport SET profits=(profits+@total_fare) WHERE Airport.Airport_id=(SELECT arrive_aid FROM flights F WHERE F.flight_num=@flight_num);

/*Reservation 2, MIA to EWR: 12345*/
SET @flight_num := 12345;
SET @num_passengers := 1;
SET @user_id := (SELECT user_id FROM users WHERE user_name = 'Bhasit');
SET @flight_fare := (SELECT fare_first FROM flights WHERE flight_num = @flight_num);
SET @total_fare := (@flight_fare * @num_passengers);
SET @res_date := '2020-01-29';
UPDATE flights SET num_seats = (num_seats - @num_passengers) WHERE flights.flight_num = @flight_num;
INSERT INTO Reservations (res_date, res_fare, res_tot, customer, num_passengers, flight_no) VALUES (@res_date, @flight_fare, @total_fare, @user_id, @num_passengers, @flight_num);
INSERT INTO Trips (res_num, flights) VALUES (@@identity, @flight_num);
UPDATE users SET profits=(profits+@total_fare) WHERE user_id= @user_id;
UPDATE flights SET profits=(profits+@total_fare), num_reserves=num_reserves+1 WHERE flight_num=@flight_num;
UPDATE Airport SET profits=(profits+@total_fare) WHERE Airport.Airport_id=(SELECT arrive_aid FROM flights F WHERE F.flight_num=@flight_num);

/*Reservation 3, EWR to LAX: 12345*/
SET @flight_num := 38798;
SET @num_passengers := 1;
SET @user_id := (SELECT user_id FROM users WHERE user_name = 'Bhasit');
SET @flight_fare := (SELECT fare_first FROM flights WHERE flight_num = @flight_num);
SET @total_fare := (@flight_fare * @num_passengers);
SET @res_date := '2020-02-21';
UPDATE flights SET num_seats = (num_seats - @num_passengers) WHERE flights.flight_num = @flight_num;
INSERT INTO Reservations (res_date, res_fare, res_tot, customer, num_passengers, flight_no) VALUES (@res_date, @flight_fare, @total_fare, @user_id, @num_passengers, @flight_num);
INSERT INTO Trips (res_num, flights) VALUES (@@identity, @flight_num);
UPDATE users SET profits=(profits+@total_fare) WHERE user_id= @user_id;
UPDATE flights SET profits=(profits+@total_fare), num_reserves=num_reserves+1 WHERE flight_num=@flight_num;
UPDATE Airport SET profits=(profits+@total_fare) WHERE Airport.Airport_id=(SELECT arrive_aid FROM flights F WHERE F.flight_num=@flight_num);

/*Reservation 4, EWR to MIA: 12345*/
SET @flight_num := 12379;
SET @num_passengers := 2;
SET @user_id := (SELECT user_id FROM users WHERE user_name = 'Tanmay');
SET @flight_fare := (SELECT fare_first FROM flights WHERE flight_num = @flight_num);
SET @total_fare := (@flight_fare * @num_passengers);
SET @res_date := '2020-01-02';
UPDATE flights SET num_seats = (num_seats - @num_passengers) WHERE flights.flight_num = @flight_num;
INSERT INTO Reservations (res_date, res_fare, res_tot, customer, num_passengers, flight_no) VALUES (@res_date, @flight_fare, @total_fare, @user_id, @num_passengers, @flight_num);
INSERT INTO Trips (res_num, flights) VALUES (@@identity, @flight_num);
UPDATE users SET profits=(profits+@total_fare) WHERE user_id= @user_id;
UPDATE flights SET profits=(profits+@total_fare), num_reserves=num_reserves+1 WHERE flight_num=@flight_num;
UPDATE Airport SET profits=(profits+@total_fare) WHERE Airport.Airport_id=(SELECT arrive_aid FROM flights F WHERE F.flight_num=@flight_num);

/*Reservation 5, MIA to EWR: 12345*/
SET @flight_num := 12345;
SET @num_passengers := 2;
SET @user_id := (SELECT user_id FROM users WHERE user_name = 'Tanmay');
SET @flight_fare := (SELECT fare_first FROM flights WHERE flight_num = @flight_num);
SET @total_fare := (@flight_fare * @num_passengers);
SET @res_date := '2020-04-21';
UPDATE flights SET num_seats = (num_seats - @num_passengers) WHERE flights.flight_num = @flight_num;
INSERT INTO Reservations (res_date, res_fare, res_tot, customer, num_passengers, flight_no) VALUES (@res_date, @flight_fare, @total_fare, @user_id, @num_passengers, @flight_num);
INSERT INTO Trips (res_num, flights) VALUES (@@identity, @flight_num);
UPDATE users SET profits=(profits+@total_fare) WHERE user_id= @user_id;
UPDATE flights SET profits=(profits+@total_fare), num_reserves=num_reserves+1 WHERE flight_num=@flight_num;
UPDATE Airport SET profits=(profits+@total_fare) WHERE Airport.Airport_id=(SELECT arrive_aid FROM flights F WHERE F.flight_num=@flight_num);

/*Reservation 6, JFK to LCY: 64257*/
SET @flight_num := 64257;
SET @num_passengers := 3;
SET @user_id := (SELECT user_id FROM users WHERE user_name = 'Harsh');
SET @flight_fare := (SELECT fare_first FROM flights WHERE flight_num = @flight_num);
SET @total_fare := (@flight_fare * @num_passengers);
SET @res_date := '2019-05-21';
UPDATE flights SET num_seats = (num_seats - @num_passengers) WHERE flights.flight_num = @flight_num;
INSERT INTO Reservations (res_date, res_fare, res_tot, customer, num_passengers, flight_no) VALUES (@res_date, @flight_fare, @total_fare, @user_id, @num_passengers, @flight_num);
INSERT INTO Trips (res_num, flights) VALUES (@@identity, @flight_num);
UPDATE users SET profits=(profits+@total_fare) WHERE user_id= @user_id;
UPDATE flights SET profits=(profits+@total_fare), num_reserves=num_reserves+1 WHERE flight_num=@flight_num;
UPDATE Airport SET profits=(profits+@total_fare) WHERE Airport.Airport_id=(SELECT arrive_aid FROM flights F WHERE F.flight_num=@flight_num);

/*Reservation 7, EWR to SYD: 85013*/
SET @flight_num := 85013;
SET @num_passengers := 5;
SET @user_id := (SELECT user_id FROM users WHERE user_name = 'Rithvik');
SET @flight_fare := (SELECT fare_first FROM flights WHERE flight_num = @flight_num);
SET @total_fare := (@flight_fare * @num_passengers);
SET @res_date := '2019-09-24';
UPDATE flights SET num_seats = (num_seats - @num_passengers) WHERE flights.flight_num = @flight_num;
INSERT INTO Reservations (res_date, res_fare, res_tot, customer, num_passengers, flight_no) VALUES (@res_date, @flight_fare, @total_fare, @user_id, @num_passengers, @flight_num);
INSERT INTO Trips (res_num, flights) VALUES (@@identity, @flight_num);
UPDATE users SET profits=(profits+@total_fare) WHERE user_id= @user_id;
UPDATE flights SET profits=(profits+@total_fare), num_reserves=num_reserves+1 WHERE flight_num=@flight_num;
UPDATE Airport SET profits=(profits+@total_fare) WHERE Airport.Airport_id=(SELECT arrive_aid FROM flights F WHERE F.flight_num=@flight_num);

/*Reservation 3, EWR to LAX -> LAX to EWR: 38798 -> 38765*/
SET @flight_num := 38798;
SET @num_passengers := 1;
SET @user_id := (SELECT user_id FROM users WHERE user_name = 'Bhasit');
SET @flight_fare := (SELECT fare_first FROM flights WHERE flight_num = @flight_num);
SET @total_fare := (@flight_fare * @num_passengers);
SET @res_date := '2019-12-04';
#flight 1
UPDATE flights SET num_seats = (num_seats - @num_passengers) WHERE flights.flight_num = @flight_num;
INSERT INTO Reservations (res_date, res_fare, res_tot, customer, num_passengers, flight_no) VALUES (@res_date, @flight_fare, @total_fare, @user_id, @num_passengers, @flight_num);
INSERT INTO Trips (res_num, flights) VALUES (@@identity, @flight_num);
UPDATE users SET profits=(profits+@total_fare) WHERE user_id= @user_id;
UPDATE flights SET profits=(profits+@total_fare), num_reserves=num_reserves+1 WHERE flight_num=@flight_num;
UPDATE Airport SET profits=(profits+@total_fare) WHERE Airport.Airport_id=(SELECT arrive_aid FROM flights F WHERE F.flight_num=@flight_num);
#flight 2
SET @flight_num2 := 38765;
SET @flight_fare2 := (SELECT fare_first FROM flights WHERE flight_num = @flight_num2);
SET @total_fare2 := (@flight_fare2 * @num_passengers);
UPDATE Trips SET flights2 = @flight_num2 WHERE res_num =@@identity;
UPDATE users SET profits=(profits+@total_fare2) WHERE user_id=@user_id;
UPDATE flights SET profits=(profits+@total_fare2), num_reserves=num_reserves+1 WHERE flight_num=@flight_num2;
UPDATE Airport SET profits=(profits+@total_fare2) WHERE Airport.Airport_id=(SELECT arrive_aid FROM flights F WHERE F.flight_num=@flight_num2);