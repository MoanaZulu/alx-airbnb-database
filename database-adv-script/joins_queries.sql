
-- INNER JOIN: Bookings and Users
SELECT b.id AS booking_id, u.name AS user_name
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- LEFT JOIN: Properties and Reviews
SELECT p.id AS property_id, p.name, r.rating
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;

-- FULL OUTER JOIN: Users and Bookings
SELECT u.name, b.id AS booking_id
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;



