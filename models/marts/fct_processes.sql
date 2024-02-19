SELECT
    id, 
    state, 
    endtime, 
    starttime, 
    businesskey, 
    removaltime, 
    startactivityid, 
    durationinmillis, 
    processdefinitionid, 
    processdefinitionkey, 
    processdefinitionname, 
    rootprocessinstanceid, 
    superprocessinstanceid, 
    processdefinitionversion 
FROM {{ ref('stg_process_instance') }} as processes