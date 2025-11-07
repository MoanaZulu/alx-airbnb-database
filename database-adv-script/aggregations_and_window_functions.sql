-- Rank properties based on total number of bookings using ROW_NUMBER()
SELECT
    property_id,
    property_name,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
    SELECT
        p.id AS property_id,
        p.name AS property_name,
        COUNT(b.id) AS total_bookings
    FROM properties p
    JOIN bookings b ON p.id = b.property_id
    GROUP BY p.id, p.name
) AS ranked_properties;
