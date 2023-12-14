#CREATE DATABASE TravelReservation;
USE TravelReservation;

DROP TABLE IF EXISTS QuestionsToRep;
DROP TABLE IF EXISTS ReservationPortfolioHas;
DROP TABLE IF EXISTS HasWaitingList;
drop table if exists users;
DROP TABLE IF EXISTS flightSpecificInfo;
DROP TABLE IF EXISTS FlightTicketReserve;
DROP TABLE IF EXISTS FlightOperatedBy;
DROP TABLE IF EXISTS OperatesIn;
DROP TABLE IF EXISTS Airport;
DROP TABLE IF EXISTS Owns;
DROP TABLE IF EXISTS Aircraft;
DROP TABLE IF EXISTS AirlineCompany;


CREATE TABLE AirlineCompany(
	airline_id CHAR(2) PRIMARY KEY
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
	airline_id CHAR(2),
    aircraft_id INTEGER, 
    primary key (airline_id, aircraft_id),
    foreign key (airline_id) references AirlineCompany(airline_id), 
    foreign key (aircraft_id) references Aircraft(aircraft_id) ON DELETE CASCADE
);

CREATE TABLE Airport(
	airport_id CHAR(3) primary key
);

CREATE TABLE OperatesIn(
	airline_id CHAR(2) NOT NULL, 
    airport_id CHAR(3), 
    primary key(airline_id, airport_id),
    foreign key (airline_id) references AirlineCompany(airline_id), 
    foreign key (airport_id) references Airport(airport_id) ON DELETE CASCADE
);

CREATE TABLE FlightOperatedBy(
	destination_airport char(3), 
    departure_airport char(3), 
    typeDomInt varchar(15),
    CHECK (typeDomInt IN ('domestic', 'international')), 
    departure_time datetime, 
    flight_number integer, 
    airline_id CHAR(2), 
    aircraft_id integer, 
    arrival_time datetime, 
    price decimal(10,2),
    numOfStops integer,
    flight_duration integer,
    primary key(airline_id,aircraft_id,flight_number), 
    foreign key (airline_id) references AirlineCompany(airline_id), 
    foreign key (aircraft_id) references Aircraft(aircraft_id) ON DELETE CASCADE,
    foreign key (destination_airport) references Airport(airport_id) ON DELETE CASCADE,
    foreign key (departure_airport) references Airport(airport_id) ON DELETE CASCADE
);



CREATE TABLE FlightTicketReserve(
	ticketNumber integer, 
    purchasedatetime datetime, 
    totalfare decimal(10,2),
    firstName varchar(30), 
    lastName varchar(30), 
    bookingfee decimal(6,2), 
    typeOneRound VARCHAR(15),
	CHECK (typeOneRound IN ('one-way', 'roundtrip')),
    primary key(ticketNumber)
);
CREATE TABLE flightSpecificInfo(
	ticketNumber integer, 
    FOREIGN KEY (ticketNumber) REFERENCES FlightTicketReserve(ticketNumber),
    seat_number integer,
    flight_number integer, 
    airline_id CHAR(2), 
    aircraft_id integer, 
    class VARCHAR(10),
	CHECK(class IN('economy', 'business','first')),
    PRIMARY KEY(ticketNumber, seat_number, flight_number, airline_id, aircraft_id,class),
	FOREIGN KEY(airline_id,aircraft_id,flight_number) REFERENCES FlightOperatedBy(airline_id,aircraft_id,flight_number) ON DELETE CASCADE
);
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    type VARCHAR(25) NOT NULL,
    CHECK (type IN ('customer', 'admin','representative'))
    
);
CREATE TABLE HasWaitingList(
	ticketNumber integer, 
    firstName varchar(30), 
    lastName varchar(30), 
    userid integer,
    foreign key (userid) references users(id),
    bookingdate datetime, 
    flight_number integer, 
    airline_id CHAR(2), 
    aircraft_id integer, 
    primary key(airline_id, aircraft_id, flight_number,ticketNumber), 
    foreign key (airline_id,aircraft_id, flight_number) references FlightOperatedBy(airline_id,aircraft_id, flight_number) ON DELETE CASCADE
);

CREATE TABLE ReservationPortfolioHas(
	accountId integer,
    FOREIGN KEY (accountId) REFERENCES users(id),
    airline_id CHAR(2),
    aircraft_id integer,
    flight_number integer,
    seat_number integer,
    class VARCHAR(9),
    ticketNumber integer,
    foreign key (ticketNumber) references FlightTicketReserve(ticketNumber),
    CHECK(class IN('economy', 'business','first')),
    primary key(accountId,airline_id,aircraft_id,flight_number,ticketNumber, seat_number,class),
    foreign key (airline_id,aircraft_id,flight_number) references FlightOperatedBy(airline_id,aircraft_id,flight_number) ON DELETE CASCADE,
    foreign key (ticketNumber, seat_number, flight_number, airline_id, aircraft_id,class) references flightSpecificInfo (ticketNumber, seat_number, flight_number, airline_id, aircraft_id,class)
);
CREATE TABLE QuestionsToRep (
    question_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    question TEXT,
    response TEXT,
    questionTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Open',
    FOREIGN KEY (customer_id) REFERENCES users(id)
);





INSERT INTO users (username, password, type) VALUES ('username4', 'password4', 'admin'), ('username2','password2','customer'), ('username3','password3','representative');

INSERT INTO QuestionsToRep (customer_id, question) VALUES
(1, 'How do I reserve a flight?');
INSERT INTO QuestionsToRep (customer_id, question) VALUES
(1, 'How can I search for flights between 2 airports on a date?');
INSERT INTO QuestionsToRep (customer_id, question) VALUES
(2, 'How can I cancel a flight?');
-- Insert sample data into AirlineCompany
INSERT INTO AirlineCompany (airline_id) VALUES ('AA'), ('UA'), ('DL');

-- Insert sample data into Aircraft
INSERT INTO Aircraft (aircraft_id, num_of_seats, operates_monday, operates_tuesday, operates_wednesday, operates_thursday, operates_friday, operates_saturday, operates_sunday)
VALUES
(1, 150, 1, 1, 1, 1, 1, 0, 0),
(2, 200, 1, 1, 1, 1, 1, 1, 0),
(3, 100, 1, 1, 1, 1, 1, 0, 1);

-- Insert sample data into Owns
INSERT INTO Owns (airline_id, aircraft_id) VALUES
('AA', 1),
('UA', 2),
('DL', 3);
select * from reservationportfoliohas;
-- Insert sample data into Airport
INSERT INTO Airport (airport_id) VALUES ('JFK'), ('LAX'), ('LHR'),('CDG'), ('SFO'), ('SEA');

-- Insert sample data into OperatesIn
INSERT INTO OperatesIn (airline_id, airport_id) VALUES
('AA', 'JFK'),
('UA', 'LAX'),
('DL', 'CDG');

-- Insert sample data into FlightOperatedBy
INSERT INTO FlightOperatedBy (destination_airport, departure_airport, typeDomInt, departure_time, flight_number, airline_id, aircraft_id, arrival_time, price, numOfStops, flight_duration)
VALUES
('JFK', 'LAX', 'domestic', '2023-01-01 12:00:00', 101, 'AA', 1, '2023-01-01 15:00:00', 250.00, 0, 180),
('LHR', 'CDG', 'international', '2023-02-01 10:30:00', 102, 'UA', 2, '2023-02-01 13:30:00', 500.00, 1 ,180),
('SFO', 'SEA', 'domestic', '2023-03-01 14:45:00', 103, 'DL', 3, '2023-03-01 18:45:00', 300.00, 2, 240),
('SFO', 'SEA', 'domestic', '2023-03-03 12:45:00', 103, 'UA', 2, '2023-03-03 16:45:00', 300.00, 2, 240),
('LAX', 'JFK', 'domestic', '2023-03-03 1:15:00', 101, 'DL', 3, '2023-03-01 4:45:00', 400.00, 2, 210);

-- Insert sample data into HasWaitingList
INSERT INTO HasWaitingList (ticketNumber, firstName, lastName, userid, bookingdate, flight_number, airline_id, aircraft_id)
VALUES
(1, 'Kyle', 'Smith', 1, '2023-01-01 10:00:00', 101, 'AA', 1),
(2, 'Henry', 'Jo', 2, '2023-02-01 09:30:00', 102, 'UA', 2),
(3, 'Patty', 'Sue', 3, '2023-03-01 13:15:00', 103, 'DL', 3);

-- Insert sample data into FlightTicketReserve
INSERT INTO FlightTicketReserve (ticketNumber, purchasedatetime, totalfare, firstName, lastName, bookingfee,typeOneRound)
VALUES
(1001, '2023-01-01 11:00:00', 250.00, 'John', 'Doe', 20.00, 'one-way'),
(1002, '2023-02-01 12:30:00', 500.00, 'Jane', 'Smith', 25.00, 'roundtrip'),
(1003, '2023-03-01 15:45:00', 300.00, 'Bob', 'Johnson', 15.00, 'one-way');

-- Insert sample data into flightSpecificInfo
INSERT INTO flightSpecificInfo (ticketNumber, seat_number, flight_number, airline_id, aircraft_id, class)
VALUES
(1001, 15, 101, 'AA', 1, 'economy'),
(1002, 20, 102, 'UA', 2, 'business'),
(1003, 10, 103, 'DL', 3, 'first');

-- Insert sample data into ReservationPortfolioHas
INSERT INTO ReservationPortfolioHas (accountId,airline_id,aircraft_id,flight_number,ticketNumber, seat_number,class)
VALUES
(1, 'AA', 1, 101, 1001, 15, 'economy'),
(2, 'UA', 2, 102, 1002, 20, 'business'),
(3, 'DL', 3, 103, 1003, 10, 'first');

select airline_id, aircraft_id, flight_number, count(*) as numTicketsPerFlight from flightSpecificInfo group by airline_id, aircraft_id, flight_number order by numTicketsPerFlight desc;


-- Insert more sample data into FlightOperatedBy for different months
INSERT INTO FlightOperatedBy (destination_airport, departure_airport, typeDomInt, departure_time, flight_number, airline_id, aircraft_id, arrival_time, price, numOfStops, flight_duration)
VALUES
('SFO', 'SEA', 'domestic', '2023-05-01 14:45:00', 114, 'DL', 3, '2023-05-01 18:45:00', 320.00, 1, 240),
('LAX', 'JFK', 'domestic', '2023-05-05 12:45:00', 115, 'AA', 1, '2023-05-05 16:45:00', 270.00, 1, 240),
('CDG', 'LHR', 'international', '2023-06-10 09:15:00', 116, 'UA', 2, '2023-06-10 12:15:00', 470.00, 0, 180),
('SEA', 'SFO', 'domestic', '2023-06-15 10:30:00', 117, 'DL', 3, '2023-06-15 13:30:00', 370.00, 1, 180),
('JFK', 'LAX', 'domestic', '2023-07-01 14:45:00', 118, 'AA', 1, '2023-07-01 18:45:00', 420.00, 2, 240);

INSERT INTO FlightTicketReserve (ticketNumber, purchasedatetime, totalfare, firstName, lastName, bookingfee, typeOneRound)
VALUES
(1014, '2023-05-11 10:30:00', 320.00, 'Aiden', 'Lee', 18.00, 'one-way'),
(1015, '2023-05-13 12:45:00', 270.00, 'Mia', 'Davis', 22.00, 'roundtrip'),
(1016, '2023-06-03 15:00:00', 470.00, 'Lucas', 'Miller', 25.00, 'one-way'),
(1017, '2023-06-06 17:15:00', 370.00, 'Ava', 'Taylor', 20.00, 'one-way'),
(1018, '2023-06-13 11:30:00', 420.00, 'Liam', 'Moore', 28.00, 'roundtrip');

INSERT INTO flightSpecificInfo (ticketNumber, seat_number, flight_number, airline_id, aircraft_id, class)
VALUES
(1014, 18, 114, 'DL', 3, 'business'),
(1015, 22, 115, 'AA', 1, 'economy'),
(1016, 15, 116, 'UA', 2, 'first'),
(1017, 10, 117, 'DL', 3, 'economy'),
(1018, 25, 118, 'AA', 1, 'business');
-- Insert sample data into users
INSERT INTO users (username, password, type) VALUES 
('username5', 'password2', 'customer'), 
('username6', 'password3', 'representative');

-- Insert more sample data into users for HasWaitingList
INSERT INTO users (username, password, type) VALUES 
('user2', 'password2', 'customer'), 
('user3', 'password3', 'representative'),
('user4', 'password4', 'admin'), 
('user5', 'password5', 'customer'),
('user6', 'password6', 'admin');
-- Insert more sample data into flightSpecificInfo for different months

-- Insert more sample data into HasWaitingList for different months
-- Insert more sample data into HasWaitingList for different months




-- Insert more sample data into FlightTicketReserve for different months



INSERT INTO HasWaitingList (ticketNumber, firstName, lastName, userid, bookingdate, flight_number, airline_id, aircraft_id)
VALUES
(14, 'Olivia', 'Martinez', 2, '2023-05-12 09:00:00', 114, 'DL', 3),
(15, 'Noah', 'Rodriguez', 3, '2023-05-14 11:30:00', 115, 'AA', 1),
(16, 'Sophia', 'Smith', 4, '2023-06-02 14:00:00', 116, 'UA', 2),
(17, 'Liam', 'Johnson', 5, '2023-06-04 16:30:00', 117, 'DL', 3),
(18, 'Emma', 'Jones', 6, '2023-06-12 10:45:00', 118, 'AA', 1);

-- View the updated data
SELECT * FROM HasWaitingList;
-- Insert more sample data into ReservationPortfolioHas for different months
INSERT INTO ReservationPortfolioHas (accountId, airline_id, aircraft_id, flight_number, ticketNumber, seat_number, class)
VALUES
(4, 'DL', 3, 114, 1014, 18, 'business'),
(5, 'AA', 1, 115, 1015, 22, 'economy'),
(6, 'UA', 2, 116, 1016, 15, 'first'),
(7, 'DL', 3, 117, 1017, 10, 'economy'),
(8, 'AA', 1, 118, 1018, 25, 'business');

-- View the updated data
SELECT * FROM users;
SELECT * FROM HasWaitingList;
SELECT * FROM FlightOperatedBy;
SELECT * FROM FlightTicketReserve;
SELECT * FROM flightSpecificInfo;
SELECT * FROM ReservationPortfolioHas;
