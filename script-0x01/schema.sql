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
