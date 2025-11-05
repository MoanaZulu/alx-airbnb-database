-- INNER JOIN: Bookings and Users
SELECT b.id AS booking_id, b.start_date, b.end_date, u.id AS user_id, u.name
FROM Booking b
INNER JOIN User u ON b.user_id = u.id;

-- LEFT JOIN: Properties and Reviews
SELECT p.id AS property_id, p.name AS property_name, r.id AS review_id, r.rating, r.comment
FROM Property p
LEFT JOIN Review r ON p.id = r.property_id;

-- FULL OUTER JOIN: Users and Bookings
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.start_date, b.end_date
FROM User u
FULL OUTER JOIN Booking b ON u.id = b.user_id;
