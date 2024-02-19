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
 FROM {{ ref('stg_batch') }} as batches
