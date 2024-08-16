Select*
From  data_2023
--Data exploration
-- checking for number of null values in all columns

SELECT COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(start_station_id) start_station_id,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(end_station_id) end_station_id,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
FROM data_2023;

-- checking for duplicate rows
SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM data_2023
-- check the length of ride_id
SELECT LEN(ride_id) AS length_ride_id,COUNT (ride_id)
FROM data_2023
GROUP BY LEN (ride_id)
-- rideable_type - 3 unique kinds of bike
SELECT DISTINCT(rideable_type) AS no_of_trip
FROM data_2023
GROUP BY rideable_type

-- started_at, ended_at - TIMESTAMP - YYYY-MM-DD hh:mm:ss UTC
SELECT COUNT(*) AS longer_than_a_day
FROM data_2023
WHERE DATEDIFF(MINUTE, started_at, ended_at) >= 1440; -- The duration trip is longer than day -- 0 rows

SELECT COUNT(*) AS less_than_a_minute
FROM data_2023
WHERE DATEDIFF(SECOND, started_at, ended_at) <= 60; ----the duration trip is less than a minute --224280  rows

SELECT DISTINCT start_station_name
FROM data_2023
ORDER BY start_station_name;

SELECT COUNT(ride_id) AS rows_with_start_station_null      --  875849 null rows
FROM data_2023
WHERE LEN(start_station_name) = 0 OR LEN(start_station_id) = 0;

SELECT DISTINCT start_station_name
FROM data_2023
ORDER BY start_station_name;

SELECT COUNT(ride_id) AS rows_with_end_station_null --  929344 null rows       
FROM data_2023
WHERE LEN(end_station_name) = 0 OR LEN(end_station_id) = 0;

-- end_lat, end_lng - no null row in both 
SELECT COUNT(ride_id) AS rows_with_null_end_loc
FROM data_2023
WHERE end_lat IS NULL OR end_lng IS NULL;
-- 2 unique values - member and casual
SELECT DISTINCT member_casual, COUNT(member_casual) AS no_of_trips
FROM data_2023
GROUP BY member_casual;







