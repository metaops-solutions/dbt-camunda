SELECT 
    id, 
    processdefinitionkey,
    businesskey,
    interval '1 second' * duration_seconds as duration
FROM 
    {{ ref('dim_processes') }}
WHERE duration_seconds is not null order by duration_seconds desc limit 20