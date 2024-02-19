select 
    activityid,AVG(duration_seconds) 
from {{ ref('dim_tasks') }}
where endtime is not NULL group by activityid