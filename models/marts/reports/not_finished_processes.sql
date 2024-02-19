select 
    id,starttime,processdefinitionkey,businesskey 
from 
    {{ ref('dim_processes') }}
where endtime is null