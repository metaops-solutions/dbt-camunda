SELECT DISTINCT ON (id)
    id,
    active,
    taskid,
    enabled,
    endtime::TIMESTAMP,
    disabled,
    required,
    tenantid,
    available,
    completed,
    createtime::TIMESTAMP,
    repeatable,
    repetition,
    terminated,
    caseactivityid,
    caseinstanceid,
    caseexecutionid,
    caseactivityname,
    caseactivitytype,
    casedefinitionid,
    durationinmillis,
    calledcaseinstanceid,
    calledprocessinstanceid,
    parentcaseactivityinstanceid
FROM (  SELECT id, active, taskid, enabled, endtime, disabled, required, tenantid, available, completed, createtime, repeatable, repetition, terminated, caseactivityid, caseinstanceid, caseexecutionid, caseactivityname, caseactivitytype, casedefinitionid, durationinmillis, calledcaseinstanceid, calledprocessinstanceid, parentcaseactivityinstanceid FROM {{ source('camunda_history', 'case_activity_instance_createdafter') }} 
        UNION  
        SELECT id, active, taskid, enabled, endtime, disabled, required, tenantid, available, completed, createtime, repeatable, repetition, terminated, caseactivityid, caseinstanceid, caseexecutionid, caseactivityname, caseactivitytype, casedefinitionid, durationinmillis, calledcaseinstanceid, calledprocessinstanceid, parentcaseactivityinstanceid FROM {{ source('camunda_history', 'case_activity_instance_endedafter') }} 
) AS merged 
ORDER BY id, createtime
