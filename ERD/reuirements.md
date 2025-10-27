## Enitity Relationship Diagram Requirements
This document outlines the database design for the Airbnb clone project.

## Entities
- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Message**

## Relationships
- A user can make many bookings.
- A booking links a user to a property.
- Each booking has one payment.
- Users can leave reviews for properties.
- Users can message each other.

## Notes
CREATE TABLE User (
  user_id UUID PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20),
  role VARCHAR(10) CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Property (
  property_id UUID PRIMARY KEY,
  host_id UUID REFERENCES User(user_id),
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  location VARCHAR(100) NOT NULL,
  price_per_night DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Booking (
  booking_id UUID PRIMARY KEY,
  property_id UUID REFERENCES Property(property_id),
  user_id UUID REFERENCES User(user_id),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Payment (
  payment_id UUID PRIMARY KEY,
  booking_id UUID REFERENCES Booking(booking_id),
  amount DECIMAL(10,2) NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method VARCHAR(20) CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')) NOT NULL
);

CREATE TABLE Review (
  review_id UUID PRIMARY KEY,
  property_id UUID REFERENCES Property(property_id),
  user_id UUID REFERENCES User(user_id),
  rating INTEGER CHECK (rating BETWEEN 1 AND 5) NOT NULL,
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Message (
  message_id UUID PRIMARY KEY,
  sender_id UUID REFERENCES User(user_id),
  recipient_id UUID REFERENCES User(user_id),
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

**
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


# ERD Requirements

This document outlines the database design for the Airbnb clone project.

## Entities
- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Message**

## Relationships
- A user can make many bookings.
- A booking links a user to a property.
- Each booking has one payment.
- Users can leave reviews for properties.
- Users can message each other.

## Notes
- Diagram saved as `erd.drawio` in the ERD folder.
- Database normalized to 3NF.

CREATE TABLE User (
  user_id UUID PRIMARY KEY,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  email VARCHAR UNIQUE NOT NULL,
  password_hash VARCHAR NOT NULL,
  phone_number VARCHAR,
  role VARCHAR NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Property (
  property_id UUID PRIMARY KEY,
  host_id UUID REFERENCES User(user_id),
  name VARCHAR NOT NULL,
  description TEXT NOT NULL,
  location VARCHAR NOT NULL,
  price_per_night DECIMAL NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add Booking, Payment, Review, Message similarly

INSERT INTO User (user_id, first_name, last_name, email, password_hash, role)
VALUES
  ('uuid-1', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw1', 'host'),
  ('uuid-2', 'Bob', 'Jones', 'bob@example.com', 'hashed_pw2', 'guest');

INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
VALUES
  ('prop-1', 'uuid-1', 'Cozy Loft', 'A nice place to stay', 'Cape Town', 120.00);

INSERT INTO User (user_id, first_name, last_name, email, password_hash, role)
VALUES
  ('uuid-1', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw1', 'host'),
  ('uuid-2', 'Bob', 'Jones', 'bob@example.com', 'hashed_pw2', 'guest');

INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
VALUES
  ('prop-1', 'uuid-1', 'Cozy Loft', 'A nice place to stay', 'Cape Town', 120.00);
