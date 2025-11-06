-- Create a partitioned version of the Booking table
CREATE TABLE Booking_partitioned (
    id INT,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Example query on partitioned table
SELECT * FROM Booking_partitioned
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
