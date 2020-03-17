create database cs336project;
use cs336project;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS airlines;
DROP TABLE IF EXISTS airports;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS preferences;

CREATE TABLE preferences(
pref_id int NOT NULL,
account_num int NOT NULL,
meal varchar(25) NOT NULL,
PRIMARY KEY(account_num, pref_id),
FOREIGN KEY(account_num) REFERENCES customers (account_num)
);

CREATE TABLE customers (
account_num int NOT NULL,
first_name varchar(25) NOT NULL,
last_name varchar(25)  NOT NULL,
email varchar(64) NOT NULL,
creation_date Date NOT NULL,
creditcard_num int NOT NULL,
address varchar(100) NOT NULL,
city varchar(25) NOT NULL,
state varchar(25) NOT NULL,
zip int NOT NULL,
primary key(account_num)
);

CREATE TABLE airlines (
Airline_id varchar(2) NOT NULL,
a_name varchar(25) NOT NULL,
primary key(Airline_id)
);

CREATE TABLE airports (
Airport_id varchar(3) NOT NULL,
ap_name varchar(25) NOT NULL,
city varchar(25) NOT NULL,
country varchar(25) NOT NULL,
primary key(Airport_id));

CREATE TABLE reservations(
res_number int NOT NULL,
booking_fee int NOT NULL,
passengers int NOT NULL,
cust_rep varchar(25),
total_fare int NOT NULL,
date_ date,
fare_rest varchar(25) NOT NULL,
primary key (res_number)
);