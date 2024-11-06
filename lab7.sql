--1
create index idx_departure on flights (actual_departure);
--2
create unique index id1 on flights(flight_no, scheduled_departure, scheduled_arrival);
--3
create index idx_airports on flights(departure_airport_id, arrival_airport_id)
--5
explain select * from flights where departure_airport_id = 3 and arrival_airport_id = 5
--6
create index index_passengers on passengers(passport_number)
--7
explain select * from passengers where country_of_citizenship = 'Philippines' and extract(year from age(date_of_birth)) = 40
--8
select * from pg_indexes where tablename = 'passengers'

