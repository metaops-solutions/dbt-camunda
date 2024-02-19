SELECT 
    processdefinitionkey,count(*) 
FROM 
    {{ ref('dim_processes') }}
 WHERE endtime is null group by processdefinitionkey order by count asc