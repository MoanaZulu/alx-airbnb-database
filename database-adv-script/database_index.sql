-- Before indexing
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE status = 'confirmed';

-- Create indexes
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_properties_location ON properties(location);

-- After indexing
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE status = 'confirmed';

