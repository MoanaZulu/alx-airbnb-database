-- Original slow query
SELECT u.name, p.name, b.start_date
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
WHERE b.start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- Optimized version using indexed columns and limiting result set
SELECT u.name, p.name, b.start_date
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
WHERE b.start_date >= '2023-01-01' AND b.start_date < '2024-01-01'
ORDER BY b.start_date
LIMIT 100;
