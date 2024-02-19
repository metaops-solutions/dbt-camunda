select 
    count(process_id),
    activityid,
    processdefinitionkey 
from {{ ref('dim_activities') }}
group by activityid,processdefinitionkey order by count asc