## joins_queries.sql

-- INNER JOIN: Bookings with their respective users
SELECT b.id AS booking_id, b.start_date, b.end_date, u.id AS user_id, u.name
FROM Booking b
INNER JOIN User u ON b.user_id = u.id;

-- LEFT JOIN: Properties and their reviews (including properties with no reviews)
SELECT p.id AS property_id, p.name AS property_name, r.id AS review_id, r.rating, r.comment
FROM Property p
LEFT JOIN Review r ON p.id = r.property_id;

-- FULL OUTER JOIN: All users and all bookings, even if not linked
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.start_date, b.end_date
FROM User u
FULL OUTER JOIN Booking b ON u.id = b.user_id;

SELECT p.id AS property_id, p.name AS property_name, r.id AS review_id, r.rating, r.comment
FROM Property p
LEFT JOIN Review r ON p.id = r.property_id;

SELECT u.id AS user_id, u.name, b.id AS booking_id, b.start_date, b.end_date
FROM User u
FULL OUTER JOIN Booking b ON u.id = b.user_id;

