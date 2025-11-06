-- INNER JOIN: Bookings and Users
SELECT Booking.id AS booking_id, Booking.start_date, Booking.end_date, User.id AS user_id, User.name
FROM Booking
INNER JOIN User ON Booking.user_id = User.id;

-- LEFT JOIN: Properties and Reviews
SELECT Property.id AS property_id, Property.name AS property_name, Review.id AS review_id, Review.rating, Review.comment
FROM Property
LEFT JOIN Review ON Property.id = Review.property_id;

-- FULL OUTER JOIN: Users and Bookings
SELECT User.id AS user_id, User.name, Booking.id AS booking_id, Booking.start_date, Booking.end_date
FROM User
FULL OUTER JOIN Booking ON User.id = Booking.user_id;
