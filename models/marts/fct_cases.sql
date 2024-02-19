SELECT
    id,
    businessKey,
    caseDefinitionName,
    caseDefinitionKey,
    caseDefinitionId,
    createTime,
    closeTime,
    durationInMillis,
    createUserId,
    superCaseInstanceId,
    superProcessInstanceId,
    tenantId,
    active,
    completed,
    terminated,
    closed
FROM {{ ref('stg_case_instance') }} as cases
