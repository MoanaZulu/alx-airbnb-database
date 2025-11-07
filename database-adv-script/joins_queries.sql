-- INNER JOIN: Bookings and Users
SELECT b.id AS booking_id, b.start_date, b.end_date, u.id AS user_id, u.name
FROM Booking b
INNER JOIN User u ON b.user_id = u.id;



-- LEFT JOIN: Properties and Reviews
SELECT
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id
ORDER BY properties.id;



-- FULL OUTER JOIN: Users and Bookings
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.start_date, b.end_date
FROM User u
FULL OUTER JOIN Booking b ON u.id = b.user_id;
