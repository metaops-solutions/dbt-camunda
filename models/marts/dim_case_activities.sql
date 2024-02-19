SELECT
    case_activities.id,
    case_activities.endtime,
    case_activities.completed,
    case_activities.terminated,
    case_activities.createtime,
    case_activities.caseactivityid,
    case_activities.caseinstanceid,
    case_activities.caseactivityname,
    case_activities.caseactivitytype,
    case_activities.casedefinitionid,
    case_activities.durationinmillis,
    cases.businessKey,
    cases.id as case_id,
    cases.caseDefinitionName
FROM {{ ref('fct_case_activities') }} as case_activities
LEFT JOIN {{ ref('fct_cases') }} as cases
ON ( case_activities.caseinstanceid = cases.id )