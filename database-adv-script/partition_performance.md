# Partitioning Performance Report

## Strategy
Partitioned the `Booking` table by `YEAR(start_date)` to improve query performance on date ranges.

## Performance Comparison

### Before Partitioning
```sql
SELECT * FROM Booking WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
