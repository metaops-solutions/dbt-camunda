SELECT
    id, 
    processDefinitionKey, 
    processDefinitionId, 
    processInstanceId, 
    executionId, 
    caseDefinitionKey, 
    caseDefinitionId, 
    caseInstanceId, 
    caseExecutionId, 
    activityInstanceId, 
    name, 
    description, 
    deleteReason, 
    owner, 
    assignee, 
    startTime, 
    endTime, 
    duration, 
    taskDefinitionKey, 
    priority, 
    due, 
    parentTaskId, 
    followUp, 
    tenantId, 
    removalTime, 
    rootProcessInstanceId
 FROM {{ ref('stg_task') }} as tasks