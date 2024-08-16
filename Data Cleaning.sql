-- Data cleaning
-- Delete duplicate rows
WITH CTE AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY ride_id ORDER BY (SELECT NULL)) AS row_num
    FROM 
        data_2023
)
DELETE FROM CTE
WHERE row_num > 1


