select 
    count(*),
    activityid 
from {{ ref('dim_activities') }}
where endtime is NULL group by activityid order by count desc