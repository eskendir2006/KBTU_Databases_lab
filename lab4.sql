---first task
SELECT UPPER(airline_name)
FROM airline;
---second task
UPDATE airline
SET airline_name = REPLACE(airline_name, 'Air', 'Aero');
---third task
SELECT flight_no
FROM flights
WHERE airline_id IN (1, 2);
---fourth task
SELECT airport_name
FROM airport
WHERE airport_name LIKE '%Regional%' AND airport_name LIKE '%Air%';
---fifth task
SELECT passenger_name, 
       TO_CHAR(date_of_birth , 'Mon dd, yyyy') AS formatted_birth_date
FROM passengers;
---sixth task
SELECT flight_no
FROM flights
WHERE actual_arrival> scheduled_arrival;
---seventh task
SELECT passenger_name, 
       CASE 
           WHEN EXTRACT(YEAR FROM AGE(date_of_birth)) BETWEEN 18 AND 35 THEN 'Young'
           WHEN EXTRACT(YEAR FROM AGE(date_of_birth)) BETWEEN 36 AND 55 THEN 'Adult'
           ELSE 'Other'
       END AS age_group
FROM passengers;

---eigth task
SELECT price, 
       CASE 
           WHEN price < 3000 THEN 'Cheap'
           WHEN price BETWEEN 3000 AND 6000 THEN 'Medium'
           ELSE 'Expensive'
       END AS price_category
FROM booking;
---ninth task
SELECT airline_country, COUNT(airline_name) AS airline_count
FROM airline
GROUP BY airline_country;
---tenth task
SELECT flight_no
FROM flights
WHERE actual_arrival > scheduled_arrival;
