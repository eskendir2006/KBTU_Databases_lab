--1
BEGIN;

DELETE FROM booking
WHERE booking_id = <input_booking_id>;

RAISE EXCEPTION 'Invalid booking ID' USING ERRCODE = '23505';

COMMIT;
--2
BEGIN;

UPDATE flights
SET scheduled_departure = '2024-12-01 15:00:00'
WHERE flight_id = <input_flight_id>;


RAISE EXCEPTION 'Invalid flight ID' USING ERRCODE = '23505';

COMMIT;
--3
BEGIN;

UPDATE booking
SET price = price - 50
WHERE flight_id = <input_flight_id>;

RAISE EXCEPTION 'Error updating ticket prices' USING ERRCODE = '23505';

COMMIT;
--4
BEGIN;

UPDATE passengers
SET first_name = 'John'
WHERE passenger_id = <input_passenger_id>;

COMMIT;
--5
BEGIN;

INSERT INTO passengers (passenger_id, first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) VALUES (1001,'Lara', 'Croft', '1987-03-03', 'Female', 'USA', 'Mexico', '333333333-3', '2024-10-19', '2024-10-19') RETURNING passenger_id;

INSERT INTO booking (flight_id, passenger_id, price)
VALUES (<input_flight_id>, <returned_passenger_id>, 2500);

COMMIT;
--6
BEGIN;

UPDATE booking
SET price = price + 30
WHERE flight_id = <input_flight_id>;

COMMIT;
--7
BEGIN;

UPDATE baggage
SET weight = 25
WHERE passenger_id = <input_passenger_id>;

COMMIT;
--8
BEGIN;

UPDATE booking
SET price = price * 0.9
WHERE booking_id = <input_booking_id>;

RAISE EXCEPTION 'Error applying discount' USING ERRCODE = '23505';

COMMIT;
--9
BEGIN;

UPDATE booking
SET flight_id = <new_flight_id>
WHERE flight_id = <old_flight_id>;

COMMIT;
