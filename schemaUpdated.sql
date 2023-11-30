#CREATE DATABASE TravelReservation;
USE TravelReservation;

DROP TABLE IF EXISTS ReservationPortfolioHas;
DROP TABLE IF EXISTS Buy;
DROP TABLE IF EXISTS Account;
DROP TABLE IF EXISTS flightSpecificInfo;
DROP TABLE IF EXISTS FlightTicketReserve;
DROP TABLE IF EXISTS HasWaitingList;
DROP TABLE IF EXISTS FlightOperatedBy;
DROP TABLE IF EXISTS OperatesIn;
DROP TABLE IF EXISTS Airport;
DROP TABLE IF EXISTS Owns;
DROP TABLE IF EXISTS Aircraft;
DROP TABLE IF EXISTS AirlineCompany;


CREATE TABLE AirlineCompany(
	airline_id INTEGER PRIMARY KEY
);


CREATE TABLE Aircraft(
	aircraft_id INTEGER PRIMARY KEY,
    num_of_seats INTEGER,
    operates_monday BOOLEAN,
    operates_tuesday BOOLEAN, 
    operates_wednesday BOOLEAN,
    operates_thursday BOOLEAN,
    operates_friday BOOLEAN, 
    operates_saturday BOOLEAN,
    operates_sunday BOOLEAN
);

CREATE TABLE Owns(
	airline_id INTEGER,
    aircraft_id INTEGER, 
    primary key (airline_id, aircraft_id),
    foreign key (airline_id) references AirlineCompany(airline_id), 
    foreign key (aircraft_id) references Aircraft(aircraft_id)
);

CREATE TABLE Airport(
	airport_id integer primary key
);

CREATE TABLE OperatesIn(
	airline_id integer NOT NULL, 
    airport_id integer, 
    primary key(airline_id, airport_id),
    foreign key (airline_id) references AirlineCompany(airline_id), 
    foreign key (airport_id) references Airport(airport_id)
);

CREATE TABLE FlightOperatedBy(
	destination_airport varchar(50), 
    departure_airport varchar(50), 
    typeDomInt varchar(15),
    CHECK (typeDomInt IN ('domestic', 'international')), 
    departure_time datetime, 
    flight_number integer, 
    airline_id integer, 
    aircraft_id integer, 
    arrival_time datetime, 
    primary key(airline_id,aircraft_id,flight_number), 
    foreign key (airline_id) references AirlineCompany(airline_id), 
    foreign key (aircraft_id) references Aircraft(aircraft_id)
);
CREATE TABLE HasWaitingList(
	passengerid integer, 
    bookingdate datetime, 
    flight_number integer, 
    airline_id integer, 
    aircraft_id integer, 
    primary key(airline_id,aircraft_id, flight_number, passengerid), 
    foreign key (airline_id,aircraft_id, flight_number) references FlightOperatedBy(airline_id,aircraft_id, flight_number)
);
CREATE TABLE FlightTicketReserve(
	ticketNumber integer, 
    purchasedatetime datetime, 
    totalfare decimal(10,2),
    firstName varchar(30), 
    lastName varchar(30), 
    passengerid integer, 
    bookingfee decimal(6,2), 
    idNum integer, 
    typeOneRound VARCHAR(15),
	CHECK (typeOneRound IN ('one-way', 'roundtrip')),
    primary key(ticketNumber)
);
CREATE TABLE flightSpecificInfo(
	ticketNumber integer, 
    FOREIGN KEY (ticketNumber) REFERENCES FlightTicketReserve(ticketNumber),
    seat_number integer,
    flight_number integer, 
    airline_id integer, 
    aircraft_id integer, 
    class VARCHAR(10),
	CHECK(class IN('economy', 'business','first')),
    PRIMARY KEY(ticketNumber, seat_number, flight_number, airline_id, aircraft_id,class),
	FOREIGN KEY(airline_id,aircraft_id,flight_number) REFERENCES FlightOperatedBy(airline_id,aircraft_id,flight_number)
);
CREATE TABLE Account(
	accountId integer primary key
);
CREATE TABLE Buy(
	accountId integer, 
    ticketNumber integer, 
    primary key (accountId, ticketNumber), 
    foreign key (accountId) references Account(accountId), 
    foreign key (ticketNumber) references FlightTicketReserve(ticketNumber)
);
CREATE TABLE ReservationPortfolioHas(
	accountId integer, 
    foreign key (accountId) references Account(accountId), 
    airline_id integer,
    aircraft_id integer,
    flight_number integer,
    primary key(accountId,airline_id,aircraft_id,flight_number),
    foreign key (airline_id,aircraft_id,flight_number) references FlightOperatedBy(airline_id,aircraft_id,flight_number)
);


