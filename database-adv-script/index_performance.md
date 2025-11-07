# Index Performance Report

## Indexed Columns
- `Booking.user_id` — used in JOINs and WHERE clauses
- `Booking.property_id` — used in JOINs
- `Property.name` — used in ORDER BY or search
- `User.name` — used in filtering or sorting

## Performance Comparison

### Before Indexing
```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 5;
