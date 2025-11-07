-- Count bookings per user
SELECT user_id, COUNT(*) AS total_bookings
FROM Booking
GROUP BY user_id;

-- Rank properties by number of bookings
SELECT property_id, COUNT(*) AS booking_count,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM Booking
GROUP BY property_id;
