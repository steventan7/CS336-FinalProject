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
    price decimal(10,2),
    numOfStops integer,
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

-- Insert sample data into AirlineCompany
INSERT INTO AirlineCompany (airline_id) VALUES (1), (2), (3);

-- Insert sample data into Aircraft
INSERT INTO Aircraft (aircraft_id, num_of_seats, operates_monday, operates_tuesday, operates_wednesday, operates_thursday, operates_friday, operates_saturday, operates_sunday)
VALUES
(1, 150, 1, 1, 1, 1, 1, 0, 0),
(2, 200, 1, 1, 1, 1, 1, 1, 0),
(3, 100, 1, 1, 1, 1, 1, 0, 1);

-- Insert sample data into Owns
INSERT INTO Owns (airline_id, aircraft_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert sample data into Airport
INSERT INTO Airport (airport_id) VALUES (101), (102), (103);

-- Insert sample data into OperatesIn
INSERT INTO OperatesIn (airline_id, airport_id) VALUES
(1, 101),
(2, 102),
(3, 103);

-- Insert sample data into FlightOperatedBy
INSERT INTO FlightOperatedBy (destination_airport, departure_airport, typeDomInt, departure_time, flight_number, airline_id, aircraft_id, arrival_time, price, numOfStops)
VALUES
('JFK', 'LAX', 'domestic', '2023-01-01 12:00:00', 101, 1, 1, '2023-01-01 15:00:00', 250.00, 0),
('LHR', 'CDG', 'international', '2023-02-01 10:30:00', 102, 2, 2, '2023-02-01 13:30:00', 500.00, 1),
('SFO', 'SEA', 'domestic', '2023-03-01 14:45:00', 103, 3, 3, '2023-03-01 17:45:00', 300.00, 2);

-- Insert sample data into HasWaitingList
INSERT INTO HasWaitingList (passengerid, bookingdate, flight_number, airline_id, aircraft_id)
VALUES
(1, '2023-01-01 10:00:00', 101, 1, 1),
(2, '2023-02-01 09:30:00', 102, 2, 2),
(3, '2023-03-01 13:15:00', 103, 3, 3);

-- Insert sample data into FlightTicketReserve
INSERT INTO FlightTicketReserve (ticketNumber, purchasedatetime, totalfare, firstName, lastName, passengerid, bookingfee, idNum, typeOneRound)
VALUES
(1001, '2023-01-01 11:00:00', 250.00, 'John', 'Doe', 1, 20.00, 123456, 'one-way'),
(1002, '2023-02-01 12:30:00', 500.00, 'Jane', 'Smith', 2, 25.00, 789012, 'roundtrip'),
(1003, '2023-03-01 15:45:00', 300.00, 'Bob', 'Johnson', 3, 15.00, 345678, 'one-way');

-- Insert sample data into flightSpecificInfo
INSERT INTO flightSpecificInfo (ticketNumber, seat_number, flight_number, airline_id, aircraft_id, class)
VALUES
(1001, 15, 101, 1, 1, 'economy'),
(1002, 20, 102, 2, 2, 'business'),
(1003, 10, 103, 3, 3, 'first');

-- Insert sample data into Account
INSERT INTO Account (accountId) VALUES (10001), (10002), (10003);

-- Insert sample data into Buy
INSERT INTO Buy (accountId, ticketNumber)
VALUES
(10001, 1001),
(10002, 1002),
(10003, 1003);

-- Insert sample data into ReservationPortfolioHas
INSERT INTO ReservationPortfolioHas (accountId, airline_id, aircraft_id, flight_number)
VALUES
(10001, 1, 1, 101),
(10002, 2, 2, 102),
(10003, 3, 3, 103);

