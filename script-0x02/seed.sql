-- Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, role)
VALUES
  ('uuid-1', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw1', 'host'),
  ('uuid-2', 'Bob', 'Jones', 'bob@example.com', 'hashed_pw2', 'guest');

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
VALUES
  ('prop-1', 'uuid-1', 'Cozy Loft', 'A nice place to stay', 'Cape Town', 120.00);

-- Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('book-1', 'prop-1', 'uuid-2', '2025-11-01', '2025-11-05', 480.00, 'confirmed');

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('pay-1', 'book-1', 480.00, 'credit_card');

-- Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('rev-1', 'prop-1', 'uuid-2', 5, 'Amazing stay!');

-- Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('msg-1', 'uuid-2', 'uuid-1', 'Thanks for hosting!');
