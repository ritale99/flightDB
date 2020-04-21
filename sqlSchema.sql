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
user_name varchar(25) NOT NULL,
password1 varchar(25) NOT NULL, 
email varchar(64) NOT NULL,
phone varchar(16),
primary key(email)
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
primary key(Airport_id));

CREATE TABLE flights (
airline_id varchar(2) NOT NULL,
flight_num INT NOT NULL,
stops varchar(50) ,
fare_first DECIMAL(7, 2) NOT NULL,
num_seats INT NOT NULL,
depart_time time NOT NULL,
depart_aid varchar(3) NOT NULL,
arrive_time time NOT NULL,
arrive_aid varchar(3) NOT NULL,
flight_days VARCHAR(12) NOT NULL, 
flight_type VARCHAR(15) NOT NULL,
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
res_num INT NOT NULL,
res_date date NOT NULL,
customer VARCHAR(64) NOT NULL,
num_passengers INT,
total_fare DECIMAL,
PRIMARY KEY (res_num),
FOREIGN KEY (customer) REFERENCES users (email)
);

/*insert manger accounts for login since manager account can't be created on the interface*/
INSERT INTO managers VALUES ('Rithvik', 'password');
INSERT INTO managers VALUES ('Harsh', 'password');
INSERT INTO managers VALUES ('Bhasit', 'password');
INSERT INTO managers VALUES ('Tamay', 'password');
INSERT INTO managers VALUES ('Noman', 'password');

/*Insertion of Some Domestic Flight Data*/
INSERT INTO Airport VALUES('EWR', 'Newark Liberty International Airport', 'Newark', 'New Jersey', 'United States');
INSERT INTO Airport VALUES('JFK', 'John F. Kennedy International Airport', 'New York City', 'New York', 'United States');
INSERT INTO Airport VALUES('MIA', 'Miami International Airport', 'Miami', 'Florida', 'United States');
INSERT INTO Airport VALUES('SFO', 'San Francisco International Airport', 'San Franciso', 'California', 'United States');
INSERT INTO Airport VALUES('MDW', 'Midway International Airport', 'Chicago', 'Illinois', 'United States');
INSERT INTO Airport VALUES ('LAX', 'Los Angeles International Airport', 'Los Angeles', 'California', 'United States');
INSERT INTO Airport VALUES ('ATL', 'Hartsfield–Jackson Atlanta International Airport','Atlanta' ,'Georgia', 'United States');
INSERT INTO Airport VALUES ('ORD', 'O Hare International Airport','Chicago', 'Illinois', 'United States');
INSERT INTO Airport VALUES ('DFW', 'Dallas/Forth Worth International Airport', 'Dallas','Texas', 'United States');
INSERT INTO Airport VALUES ('DEN', 'Denver International Airport','Denver' ,'Colorodo', 'United States');
INSERT INTO Airport VALUES ('SEA', 'Seattle-Tacoma International Airport','Seattle','Washington', 'United States');
INSERT INTO Airport VALUES ('LAS', 'McCarran International Airport', 'Las Vegas','Nevada', 'United States');
INSERT INTO Airport VALUES ('MCO', 'Orlando International Airpott', 'Orlando','Florida', 'United States');
INSERT INTO Airport VALUES ('CLT', 'Charlotte Douglass International Airport', 'Charlotte','North Carolina', 'United States');
INSERT INTO Airport VALUES ('PHX', 'Phenix Sky Harbor International Airport', 'Pheoniz','Arizona', 'United States');
INSERT INTO Airport VALUES ('IAH', 'George Bush Intercontinental Airport', 'Houston','Texas', 'United States');
INSERT INTO Airport VALUES ('BOS', 'General Edward Lawrence Logan International Airport', 'Boston','Massachusetts', 'United States');
INSERT INTO Airport VALUES ('MSP', 'Minneapolis–Saint Paul International Airport', 'Minneapolis','Minnesota', 'United States');
INSERT INTO Airport VALUES ('FLL', 'Fort Lauderdale-Hollywood International Airport', 'Fort Lauderdale','Florida', 'United States');
INSERT INTO Airport VALUES ('DTW', 'Detroit Metropolitan Airport', 'Detroit','Michigan', 'United States');
INSERT INTO Airport VALUES ('PHL', 'Philadelphia International Airport', 'Philadelphia','Pennsylvania', 'United States');
INSERT INTO Airport VALUES ('LGA', 'LaGuardia', 'New York','New York', 'United States');

/*Insertion of Some International Flights*/
INSERT INTO Airport VALUES('LCY','London City Airport', 'London', 'Greater London', 'England');
INSERT INTO Airport VALUES('DUB', 'Dublin Airport', 'Dublin', 'Leinster', 'Ireland');
INSERT INTO Airport VALUES('PEK', 'Beijing Capital International Airport', 'Beijing', 'Hebei', 'China');
INSERT INTO Airport VALUES('SYD', 'Sydney Airport', 'Sydney', 'New South Wales', 'Australia');
INSERT INTO Airport VALUES('YTZ', 'Billy Bishop Toronto City Airport', 'Toronto', 'Ontario', 'Cananda');

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
INSERT INTO flights VALUES ('BB', '12345', NULL, '160','50', '11:02', 'MIA','14:10', 'EWR', 'SuFSa', 'domestic' );
INSERT INTO FlightDate VALUES('2020-05-05', '2020-05-06', '12345');

INSERT INTO flights VALUES ('BB', '12346', NULL, '160','50', '11:02', 'MIA','14:10', 'EWR', 'SuFSa', 'domestic' );
INSERT INTO FlightDate VALUES('2020-05-06', '2020-05-07', '12346');















