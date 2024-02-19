SELECT
    id,
    decisionDefinitionId,
    decisionDefinitionKey,
    decisionDefinitionName,
    evaluationTime,
    removalTime,
    processDefinitionId,
    processDefinitionKey,
    processInstanceId,
    caseDefinitionId,
    caseDefinitionKey,
    caseInstanceId,
    activityId,
    activityInstanceId,
    userId
FROM {{ ref('fct_decisions') }} as decisions
