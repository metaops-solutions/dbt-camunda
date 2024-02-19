SELECT
    processes.id,
    processes.starttime,
    processes.endtime,
    EXTRACT(EPOCH FROM (processes.endtime - processes.starttime)) as duration_seconds,
    processes.state,
    processes.processdefinitionname,
    processes.processdefinitionkey,
    processes.businesskey
FROM {{ ref('fct_processes') }} as processes
