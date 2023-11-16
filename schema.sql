#CREATE DATABASE TravelReservation;
#Asssumptions: 
	-- database assumes a maximum of 30 past and upcoming flights in ReservationPortfolioHas table 
	-- database assumes a maximum of 6 connecting flights per ticket in FlightTicketReserve table 
USE TravelReservation;

DROP TABLE IF EXISTS ReservationPortfolioHas;
DROP TABLE IF EXISTS Buy;
DROP TABLE IF EXISTS Account;
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
    class1 varchar(10),
    CHECK(class1 IN('economy', 'business','first')),
    class2 varchar(10),
    CHECK(class2 IN('economy', 'business','first')),
    class3 varchar(10),
    CHECK(class3 IN('economy', 'business','first')),
    class4 varchar(10),
    CHECK(class4 IN('economy', 'business','first')),
    class5 varchar(10),
    CHECK(class5 IN('economy', 'business','first')),
    class6 varchar(10),
    CHECK(class6 IN('economy', 'business','first')),
    passengerid integer, 
    seatNumber1 integer,
    seatNumber2 integer, 
    seatNumber3 integer, 
    seatNumber4 integer, 
    seatNumber5 integer,
    seatNumber6 integer, 
    bookingfee decimal(6,2), 
    idNum integer, 
    typeOneRound VARCHAR(15),
	CHECK (typeOneRound IN ('one-way', 'roundtrip')), 
    flight_number1 integer NOT NULL, 
    airline_id1 integer NOT NULL, 
    aircraft_id1 integer NOT NULL, 
    flight_number2 integer, 
    airline_id2 integer, 
    aircraft_id2 integer, 
    flight_number3 integer, 
    airline_id3 integer, 
    aircraft_id3 integer, 
    flight_number4 integer, 
    airline_id4 integer,
    aircraft_id4 integer, 
    flight_number5 integer, 
    airline_id5 integer, 
    aircraft_id5 integer,
    flight_number6 integer, 
    airline_id6 integer, 
    aircraft_id6 integer, 
    primary key(ticketNumber),
    foreign key (flight_number1, airline_id1,aircraft_id1) references FlightOperatedBy(airline_id, aircraft_id, flight_number), 
	foreign key (flight_number2, airline_id2,aircraft_id2 ) references FlightOperatedBy(airline_id, aircraft_id, flight_number), 
    foreign key (flight_number3, airline_id3,aircraft_id3 ) references FlightOperatedBy(airline_id, aircraft_id, flight_number), 
    foreign key (flight_number4, airline_id4,aircraft_id4 ) references FlightOperatedBy(airline_id, aircraft_id, flight_number), 
    foreign key (flight_number5, airline_id5,aircraft_id5 ) references FlightOperatedBy(airline_id, aircraft_id, flight_number), 
    foreign key (flight_number6, airline_id6,aircraft_id6 ) references FlightOperatedBy(airline_id, aircraft_id, flight_number)
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
	accountId integer primary key, 
    foreign key (accountId) references Account(accountId), 
    pastFlight1 integer, 
    pastFlight2 integer,
    pastFlight3 integer,
    pastFlight4 integer,
    pastFlight5 integer,
	pastFlight6 integer, 
    pastFlight7 integer,
    pastFlight8 integer,
    pastFlight9 integer,
    pastFlight10 integer,
    pastFlight11 integer, 
    pastFlight12 integer,
    pastFlight13 integer,
    pastFlight14 integer,
    pastFlight15 integer,
	pastFlight16 integer, 
    pastFlight17 integer,
    pastFlight18 integer,
    pastFlight19 integer,
    pastFlight20 integer,
	pastFlight21 integer, 
    pastFlight22 integer,
    pastFlight23 integer,
    pastFlight24 integer,
    pastFlight25 integer,
	pastFlight26 integer, 
    pastFlight27 integer,
    pastFlight28 integer,
    pastFlight29 integer,
    pastFlight30 integer,
    upcomingFlight1 integer,
    upcomingFlight2 integer, 
    upcomingFlight3 integer,
    upcomingFlight4 integer, 
    upcomingFlight5 integer,
    upcomingFlight6 integer,
    upcomingFlight7 integer,
    upcomingFlight8 integer,
    upcomingFlight9 integer,
    upcomingFlight10 integer,
    upcomingFlight11 integer,
    upcomingFlight12 integer, 
    upcomingFlight13 integer,
    upcomingFlight14 integer, 
    upcomingFlight15 integer,
    upcomingFlight16 integer,
    upcomingFlight17 integer,
    upcomingFlight18 integer,
    upcomingFlight19 integer,
    upcomingFlight20 integer,
    upcomingFlight21 integer,
    upcomingFlight22 integer, 
    upcomingFlight23 integer,
    upcomingFlight24 integer, 
    upcomingFlight25 integer,
    upcomingFlight26 integer,
    upcomingFlight27 integer,
    upcomingFlight28 integer,
    upcomingFlight29 integer,
    upcomingFlight30 integer,
    foreign key (pastFlight1) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight2) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight3) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight4) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight5) references FlightTicketReserve(ticketNumber),
    foreign key (pastFlight6) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight7) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight8) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight9) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight10) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight11) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight12) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight13) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight14) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight15) references FlightTicketReserve(ticketNumber),
    foreign key (pastFlight16) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight17) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight18) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight19) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight20) references FlightTicketReserve(ticketNumber),
    foreign key (pastFlight21) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight22) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight23) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight24) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight25) references FlightTicketReserve(ticketNumber),
    foreign key (pastFlight26) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight27) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight28) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight29) references FlightTicketReserve(ticketNumber), 
    foreign key (pastFlight30) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight1) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight2) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight3) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight4) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight5) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight6) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight7) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight8) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight9) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight10) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight11) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight12) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight13) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight14) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight15) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight16) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight17) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight18) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight19) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight20) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight21) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight22) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight23) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight24) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight25) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight26) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight27) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight28) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight29) references FlightTicketReserve(ticketNumber), 
    foreign key (upcomingFlight30) references FlightTicketReserve(ticketNumber)

);
