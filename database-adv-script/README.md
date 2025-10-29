# Task 0: SQL Joins Queries

This task demonstrates the use of SQL JOIN operations to retrieve and combine data from multiple related tables in the Airbnb database schema.

## 🧠 Learning Objectives

- Understand and apply different types of SQL joins
- Retrieve meaningful insights by combining data across tables
- Handle cases where some records may not have matching entries in related tables

## 🔗 Queries Implemented

### 1. INNER JOIN — Bookings and Users
```sql
SELECT b.id AS booking_id, u.name AS user_name
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

SELECT p.id AS property_id, p.name, r.rating
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;

SELECT u.name, b.id AS booking_id
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;

