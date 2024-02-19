SELECT
    id,
    decisionDefinitionId,
    decisionDefinitionKey,
    decisionDefinitionName,
    evaluationTime::TIMESTAMP,
    removalTime::TIMESTAMP,
    processDefinitionId,
    processDefinitionKey,
    processInstanceId,
    caseDefinitionId,
    caseDefinitionKey,
    caseInstanceId,
    activityId,
    activityInstanceId,
    tenantId,
    userId,
    rootDecisionInstanceId,
    rootProcessInstanceId,
    decisionRequirementsDefinitionId,
    decisionRequirementsDefinitionKey
FROM  {{ source('camunda_history', 'decision_instance') }} 
ORDER BY id, evaluationTime
