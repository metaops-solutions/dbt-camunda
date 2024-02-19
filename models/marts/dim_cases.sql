SELECT
    id,
    businessKey,
    caseDefinitionName,
    caseDefinitionKey,
    caseDefinitionId,
    createTime,
    closeTime,
    durationInMillis,
    EXTRACT(EPOCH FROM (closeTime - createTime)) as duration_seconds,
    superCaseInstanceId,
    superProcessInstanceId,
    active,
    completed,
    terminated,
    closed
FROM {{ ref('fct_cases') }} as processes
