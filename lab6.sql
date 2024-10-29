--first
select * from flights where airline_id = 9
--second
select flight_id, flight_no, airport_name from flights join airport on departure_airport_id = airport_id
--third
select airline_name from airline,flights group by(airline_id) having count(flight_no) > 1
--fourth
select first_name, last_name from 
	booking 
	join booking_flight on booking.booking_id = booking_flight.booking_id
	join passengers on passengers.passenger_id = booking.passenger_id
where flight_id = 2
--fifth
select booking_flight.flight_id , avg(price) as average , sum(price) as total , max(price) as maximum , min(price) as minimum 
	from booking
	join
	booking_flight on booking_flight.booking_id = booking.booking_id
group by
	booking_flight.flight_id
--sixth
select * from 
	flights join airport on arrival_airport_id = airport_id
	join airline on flights.airline_id1 = airline.airline_id
where country = 'China'
--seventh
--there is no minor passengers as all passengers are expected to be 18 years old
-- eigth
select first_name, last_name, passport_number, actual_arrival from
	passengers join booking on passengers.passenger_id = booking.passenger_id
	join booking_flight on booking.booking_id = booking_flight.booking_id
	join flights on booking_flight.flight_id = flights.flight_id
-- ninth
select * from 
	flights join airport on departure_airport_id = airport_id
	join airline on flights.airline_id = airline.airline_id
	where airline_country = country order by airline_country

