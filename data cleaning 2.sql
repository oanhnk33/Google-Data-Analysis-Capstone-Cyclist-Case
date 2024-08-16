INSERT INTO cleaned_data_2023 (
    ride_id, rideable_type, started_at, ended_at, ride_length, 
    day_of_week, month, start_station_name, end_station_name, 
    start_lat, start_lng, end_lat, end_lng, member_casual
)
SELECT 
    a.ride_id, 
    rideable_type, 
    started_at, 
    ended_at, 
    ride_length,
    CASE DATEPART(WEEKDAY, started_at)
      WHEN 1 THEN 'SUN'
      WHEN 2 THEN 'MON'
      WHEN 3 THEN 'TUES'
      WHEN 4 THEN 'WED'
      WHEN 5 THEN 'THURS'
      WHEN 6 THEN 'FRI'
      WHEN 7 THEN 'SAT'    
    END AS day_of_week,
    CASE MONTH(started_at)
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
    END AS month,
    start_station_name, 
    end_station_name, 
    start_lat, 
    start_lng, 
    end_lat, 
    end_lng, 
    member_casual
FROM data_2023 a
JOIN (
    SELECT 
      ride_id, 
      (DATEPART(HOUR, ended_at - started_at) * 60 +
       DATEPART(MINUTE, ended_at - started_at) +
       DATEPART(SECOND, ended_at - started_at) / 60) AS ride_length
    FROM data_2023
) b 
ON a.ride_id = b.ride_id
WHERE 
    LEN(a.ride_id) = 16   
    AND start_station_name IS NOT NULL 
    AND end_station_name IS NOT NULL 
    AND end_lat IS NOT NULL 
    AND end_lng IS NOT NULL 
    AND ride_length > 1 
    AND ride_length < 1440 -- 
SELECT *
FROM cleaned_data_2023
