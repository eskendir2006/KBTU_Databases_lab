--1
BEGIN;

DELETE FROM booking
WHERE booking_id = <input_booking_id>;

RAISE EXCEPTION 'Invalid booking ID' USING ERRCODE = '23505';

COMMIT;
--2
BEGIN;

UPDATE flights
SET departure_time = '2024-12-01 15:00:00'
WHERE flight_id = <input_flight_id>;


RAISE EXCEPTION 'Invalid flight ID' USING ERRCODE = '23505';

COMMIT;
--3
BEGIN;

UPDATE booking
SET ticket_price = ticket_price - 50
WHERE flight_id = <input_flight_id>;

RAISE EXCEPTION 'Error updating ticket prices' USING ERRCODE = '23505';

COMMIT;
--4
BEGIN;

UPDATE passengers
SET name = 'John Doe', email = 'john.doe@example.com'
WHERE passenger_id = <input_passenger_id>;

COMMIT;
--5
BEGIN;

INSERT INTO passengers (name, email) VALUES ('Jane Doe', 'jane.doe@example.com') RETURNING passenger_id;

INSERT INTO booking (flight_id, passenger_id, ticket_price)
VALUES (<input_flight_id>, <returned_passenger_id>, 200);

COMMIT;
--6
BEGIN;

UPDATE booking
SET ticket_price = ticket_price + 30
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
SET ticket_price = ticket_price * 0.9
WHERE booking_id = <input_booking_id>;

RAISE EXCEPTION 'Error applying discount' USING ERRCODE = '23505';

COMMIT;
--9
BEGIN;

UPDATE booking
SET flight_id = <new_flight_id>
WHERE flight_id = <old_flight_id>;

COMMIT;
