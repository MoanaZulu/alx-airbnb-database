-- INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT b.*, u.*
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;
