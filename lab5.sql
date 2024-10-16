---first task---
ALTER TABLE passengers
ADD CONSTRAINT check_age
CHECK (EXTRACT(YEAR FROM AGE(date_of_birth)) >= 10);
---second task---
ALTER TABLE booking
ADD CONSTRAINT check_price
CHECK (price > 0 AND price <= 50000);
---third task---
ALTER TABLE baggage
ADD CONSTRAINT check_weight
CHECK (weight_in_kg BETWEEN 1 AND 23);
---fourth task---
ALTER TABLE airport
ADD CONSTRAINT check_airport_name_length
CHECK (LENGTH(airport_name) >= 10);
---fifth task---
ALTER TABLE passengers
ADD CONSTRAINT unique_passport_number
UNIQUE (passport_number);
---sixth task---
ALTER TABLE passengers
ADD CONSTRAINT check_gender_age
CHECK ((gender = 'Male' AND EXTRACT(YEAR FROM AGE(date_of_birth)) >= 18) OR (gender = 'Female' AND EXTRACT(YEAR FROM AGE(date_of_birth)) >= 19));
---seventh task---
ALTER TABLE passengers
ADD CONSTRAINT check_citizenship_age
CHECK (
    (country_of_citizenship = 'Kazakhstan' AND EXTRACT(YEAR FROM AGE(date_of_birth)) >= 18) OR
    (country_of_citizenship = 'France' AND EXTRACT(YEAR FROM AGE(date_of_birth)) >= 17) OR
    (country_of_citizenship NOT IN ('Kazakhstan', 'France') AND EXTRACT(YEAR FROM AGE(date_of_birth)) >= 19)
);
---eigth task---
ALTER TABLE booking
ADD CONSTRAINT check_discount
CHECK (
    (created_at >= '2024-01-01' AND discount = 0.05) OR
    (created_at < '2024-01-01' AND discount = 0.10)
);
