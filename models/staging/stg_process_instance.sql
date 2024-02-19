SELECT DISTINCT ON (id)
    id, 
    state, 
    endtime::TIMESTAMP, 
    starttime::TIMESTAMP, 
    businesskey, 
    removaltime::TIMESTAMP, 
    startactivityid, 
    durationinmillis, 
    processdefinitionid, 
    processdefinitionkey, 
    processdefinitionname, 
    rootprocessinstanceid, 
    superprocessinstanceid, 
    processdefinitionversion 
FROM (  SELECT id, state, endtime, starttime, businesskey, removaltime, startactivityid, durationinmillis, processdefinitionid, processdefinitionkey, processdefinitionname, rootprocessinstanceid, superprocessinstanceid, processdefinitionversion FROM {{ source('camunda_history', 'process_instance_startedafter') }} 
        UNION  
        SELECT id, state, endtime, starttime, businesskey, removaltime, startactivityid, durationinmillis, processdefinitionid, processdefinitionkey, processdefinitionname, rootprocessinstanceid, superprocessinstanceid, processdefinitionversion FROM {{ source('camunda_history', 'process_instance_finishedafter') }} 
) AS merged 
ORDER BY id, starttime
