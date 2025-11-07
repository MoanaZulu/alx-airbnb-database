-- Total number of bookings made by each user
SELECT
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name;

-- Rank properties based on total bookings using RANK()
SELECT
    property_id,
    property_name,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS rank_position
FROM (
    SELECT
        p.id AS property_id,
        p.name AS property_name,
        COUNT(b.id) AS total_bookings
    FROM properties p
    JOIN bookings b ON p.id = b.property_id
    GROUP BY p.id, p.name
) AS ranked_properties;

-- Rank properties based on total bookings using ROW_NUMBER()
SELECT
    property_id,
    property_name,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_num
FROM (
    SELECT
        p.id AS property_id,
        p.name AS property_name,
        COUNT(b.id) AS total_bookings
    FROM properties p
    JOIN bookings b ON p.id = b.property_id
    GROUP BY p.id, p.name
) AS numbered_properties;

