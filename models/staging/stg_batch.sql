SELECT
    id,                    
    type,                  
    endtime::TIMESTAMP,
    tenantid,
    starttime::TIMESTAMP,
    totaljobs,
    removaltime::TIMESTAMP,
    createuserid,
    batchjobsperseed,
    seedjobdefinitionid,
    batchjobdefinitionid,
    invocationsperbatchjob,
    monitorjobdefinitionid
FROM  {{ source('camunda_history', 'batch') }} 
ORDER BY id, starttime


