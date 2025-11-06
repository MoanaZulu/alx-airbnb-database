-- Index on Booking.user_id for JOINs and WHERE filters
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index on Booking.property_id for JOINs
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index on Property.name for ORDER BY or search
CREATE INDEX idx_property_name ON Property(name);

-- Index on User.name for search or sorting
CREATE INDEX idx_user_name ON User(name);
