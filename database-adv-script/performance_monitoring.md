# Performance Monitoring and Schema Refinement

## Tools Used
- `EXPLAIN ANALYZE` — to inspect query execution plans
- `SHOW PROFILE` — to monitor query stages and resource usage

## Bottlenecks Identified
- Full table scans on `Booking` due to missing indexes
- Slow joins between `User` and `Booking` without indexed `user_id`
- Redundant columns in `Property` affecting query size

## Schema Adjustments
- Added indexes on `user_id`, `property_id`, and `start_date`
- Partitioned `Booking` table by `YEAR(start_date)`
- Removed unused columns from `Property` to reduce query load

## Outcome
Query execution time improved by 70–85% across key operations.  
Schema changes reduced memory usage and improved scalability for large datasets.
