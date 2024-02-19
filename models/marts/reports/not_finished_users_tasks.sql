select 
    activityid,count(activityid) 
from {{ ref('dim_tasks') }}
where endtime is NULL group by activityid