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
- Diagram saved as `erd.drawio` in the ERD folder.
- Database normalized to 3NF.

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
