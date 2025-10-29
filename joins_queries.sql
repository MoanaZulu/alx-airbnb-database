-- INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT bookings.id AS booking_id,
       users.id AS user_id,
       users.name AS user_name
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

