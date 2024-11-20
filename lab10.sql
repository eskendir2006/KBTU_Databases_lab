--1
CREATE OR REPLACE PROCEDURE insert_flight(flight_id INT, departure_time TIMESTAMP, arrival_time TIMESTAMP, departure_airport VARCHAR, arrival_airport VARCHAR, status VARCHAR)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO flights (flight_id, departure_time, arrival_time, departure_airport, arrival_airport, status)
    VALUES (flight_id, departure_time, arrival_time, departure_airport, arrival_airport, status);
END;
$$;
--2
CREATE OR REPLACE PROCEDURE update_flight_status(flight_id INT, new_status VARCHAR)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE flights
    SET status = new_status
    WHERE flight_id = flight_id;
END;
$$;
--3
CREATE OR REPLACE FUNCTION get_flights_from_airport(departure_airport VARCHAR)
RETURNS TABLE(flight_id INT, departure_time TIMESTAMP, arrival_time TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT flight_id, departure_time, arrival_time
    FROM flights
    WHERE departure_airport = departure_airport;
END;
$$ LANGUAGE plpgsql;
--4
CREATE OR REPLACE FUNCTION calculate_avg_delay(arrival_airport VARCHAR)
RETURNS NUMERIC AS $$
BEGIN
    RETURN (
        SELECT AVG(EXTRACT(EPOCH FROM (actual_arrival_time - scheduled_arrival_time)))
        FROM flights
        WHERE arrival_airport = arrival_airport
        AND actual_arrival_time IS NOT NULL
        AND scheduled_arrival_time IS NOT NULL
    );
END;
$$ LANGUAGE plpgsql;
--5
CREATE OR REPLACE FUNCTION get_passengers_by_flight(flight_id INT)
RETURNS TABLE(passenger_id INT, passenger_name VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT p.passenger_id, p.name
    FROM passengers p
    JOIN booking b ON p.passenger_id = b.passenger_id
    WHERE b.flight_id = flight_id;
END;
$$ LANGUAGE plpgsql;
--6
CREATE OR REPLACE FUNCTION get_top_passenger()
RETURNS TABLE(passenger_id INT, passenger_name VARCHAR, flight_count INT) AS $$
BEGIN
    RETURN QUERY
    SELECT p.passenger_id, p.name, COUNT(b.flight_id) AS flight_count
    FROM passengers p
    JOIN booking b ON p.passenger_id = b.passenger_id
    GROUP BY p.passenger_id, p.name
    ORDER BY flight_count DESC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;
--7
CREATE OR REPLACE FUNCTION get_flights_delayed_24_hours()
RETURNS TABLE(flight_id INT, delay_hours NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT flight_id, EXTRACT(EPOCH FROM (actual_departure_time - scheduled_departure_time)) / 3600 AS delay_hours
    FROM flights
    WHERE actual_departure_time - scheduled_departure_time > INTERVAL '24 hours';
END;
$$ LANGUAGE plpgsql;
--8
CREATE OR REPLACE FUNCTION count_flights_per_airline()
RETURNS TABLE(airline VARCHAR, flight_count INT) AS $$
BEGIN
    RETURN QUERY
    SELECT airline, COUNT(flight_id) AS flight_count
    FROM flights
    GROUP BY airline;
END;
$$ LANGUAGE plpgsql;
--9
CREATE OR REPLACE FUNCTION calculate_avg_ticket_price(flight_id INT)
RETURNS NUMERIC AS $$
BEGIN
    RETURN (
        SELECT AVG(ticket_price)
        FROM booking
        WHERE flight_id = flight_id
    );
END;
$$ LANGUAGE plpgsql;
--10
CREATE OR REPLACE FUNCTION get_highest_ticket_price_flight()
RETURNS TABLE(flight_id INT, departure_airport VARCHAR, arrival_airport VARCHAR, ticket_price NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT f.flight_id, f.departure_airport, f.arrival_airport, MAX(b.ticket_price) AS ticket_price
    FROM flights f
    JOIN booking b ON f.flight_id = b.flight_id
    GROUP BY f.flight_id, f.departure_airport, f.arrival_airport
    ORDER BY ticket_price DESC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;
