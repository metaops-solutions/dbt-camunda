SELECT DISTINCT ON (id)
    id,
    businessKey,
    caseDefinitionName,
    caseDefinitionKey,
    caseDefinitionId,
    createTime::TIMESTAMP,
    closeTime::TIMESTAMP,
    durationInMillis,
    createUserId,
    superCaseInstanceId,
    superProcessInstanceId,
    tenantId,
    active,
    completed,
    terminated,
    closed
FROM (  SELECT id, businessKey, caseDefinitionName, caseDefinitionKey, caseDefinitionId, createTime, closeTime, durationInMillis, createUserId, superCaseInstanceId, superProcessInstanceId, tenantId, active, completed, terminated, closed FROM {{ source('camunda_history', 'case_instance_createdafter') }} 
        UNION  
        SELECT id, businessKey, caseDefinitionName, caseDefinitionKey, caseDefinitionId, createTime, closeTime, durationInMillis, createUserId, superCaseInstanceId, superProcessInstanceId, tenantId, active, completed, terminated, closed FROM {{ source('camunda_history', 'case_instance_closedafter') }} 
) AS merged 
ORDER BY id, createTime
