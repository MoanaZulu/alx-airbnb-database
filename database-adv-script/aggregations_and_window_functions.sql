-- Aggregation: Total bookings per user
SELECT user_id, COUNT(*) AS total_bookings
FROM Booking
GROUP BY user_id;

-- Window Function: Rank properties by number of bookings
SELECT Property.id, Property.name, COUNT(Booking.id) AS booking_count,
       RANK() OVER (ORDER BY COUNT(Booking.id) DESC) AS rank
FROM Property
LEFT JOIN Booking ON Property.id = Booking.property_id
GROUP BY Property.id, Property.name;
