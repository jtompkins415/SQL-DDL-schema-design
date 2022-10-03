-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    from_city TEXT NOT NULL,
    from_country TEXT NOT NULL,
    to_city TEXT NOT NULL,
    to_country TEXT NOT NULL
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY, 
  flight_number TEXT NOT NULL, 
  airline TEXT NOT NULL, 
  departing_from TEXT NOT NULL, 
  departure TIMESTAMP NOT NULL, 
  traveling_to TEXT NOT NULL, 
  arrival TIMESTAMP NOT NULL 
);

CREATE TABLE seats (
  id SERIAL PRIMARY KEY,
  seat_number TEXT NOT NULL,
  flight_id INT NOT NULL REFERENCES flights ON DELETE CASCADE ,
  passenger_id INT NOT NULL REFERENCES passengers ON DELETE CASCADE
);


INSERT INTO passengers (first_name, last_name, from_city, from_country, to_city, to_country)
VALUES
('Jennifer', 'Finch', 'Washington D.C.', 'United States', 'Seattle', 'United States'),
('Thadeus', 'Gathercole', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
('Sonja', 'Pauley', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
('Jennifer', 'Finch', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
('Waneta', 'Skeleton', 'Paris', 'France', 'Casablanca', 'Morocco'),
('Micah', 'Hyde', 'Dubai', 'UAE', 'Bejing', 'China'),
('Berkie', 'Wycliff', 'New York', 'United States', 'New Orleans', 'United States'),
('Cory', 'Squibbes', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

INSERT INTO flights (flight_number, airline, departing_from, departure, traveling_to, arrival)
VALUES
('WD45764', 'United', 'Washington DC, US', '2018-04-08 09:00:00', 'Seattle, US', '2018-04-08 12:00:00'),
('TG67593', 'British Airways', 'Tokyo, Japan', '2018-12-19 12:45:00', 'London, UK', '2018-12-19 16:15:00' ),
('LF59434', 'Delta','Los Angeles, US', '2018-01-02 07:00:00', 'Seattle, US', '2018-04-15 21:00:00'),
('D3RDG23', 'TUI Fly Belgium', 'Paris, France', '2018-08-01 18:30:00','Casablanca, Morocco', '2018-08-01 21:50:00'),
('RT453OF', 'Air China', 'Dubai, UAE','2018-10-31 01:15:00', 'Beijing, China', '2018-10-31 12:55:00'),
('UT34EWA', 'United', 'New York, US', '2019-02-06 06:00:00', 'Charlotte, US', '2019-02-06 07:47:00'),
('SWF234R', 'American Airlines', 'Cedar Rapids, US', '2018-12-22 14:42:00', 'Chicago, US', '2018-12-22 15:56:00'),
('CA125NO', 'American Airlines', 'Charlotte, US', '2019-02-06 16:28:00', 'New Orleans, US', '2019-02-06 19:18:00'),
('TY34OP', 'Avinca Brasil', 'Sao Paolo, Brazil', '2019-01-20 19:30:00', 'Santirago, Chile', '2019-01-20 22:45:00');

INSERT INTO seats (seat_number, flight_id, passenger_id)
VALUES
('12B', 1, 1),
('22D', 2, 2),
('2A', 3,3);









-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');