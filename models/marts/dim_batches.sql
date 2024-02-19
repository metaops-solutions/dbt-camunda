SELECT
    id,                    
    type,                  
    endtime,
    starttime,
    EXTRACT(EPOCH FROM (endtime - starttime)) as duration_seconds,
    totaljobs,
    batchjobsperseed,
    seedjobdefinitionid,
    batchjobdefinitionid
 FROM {{ ref('fct_batches') }} as batches
