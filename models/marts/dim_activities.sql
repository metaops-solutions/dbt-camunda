SELECT
    activities.id,
    activities.starttime,
    activities.endtime,
    EXTRACT(EPOCH FROM (activities.endtime - activities.starttime)) as duration_seconds,
    activities.activityid,
    activities.activityname,
    activities.activitytype,
    processes.id as process_id,
    processes.businesskey,
    processes.processdefinitionname,
    processes.processdefinitionkey
FROM {{ ref('fct_activities') }} as activities
LEFT JOIN {{ ref('fct_processes') }} as processes
ON ( activities.processinstanceid = processes.id )