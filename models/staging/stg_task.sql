SELECT DISTINCT ON (id)
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
    startTime::TIMESTAMP, 
    endTime::TIMESTAMP, 
    duration, 
    taskDefinitionKey, 
    priority, 
    due, 
    parentTaskId, 
    followUp, 
    tenantId, 
    removalTime, 
    rootProcessInstanceId
FROM (  SELECT id, processDefinitionKey, processDefinitionId, processInstanceId, executionId, caseDefinitionKey, caseDefinitionId, caseInstanceId, caseExecutionId, activityInstanceId, name, description, deleteReason, owner, assignee, startTime, endTime, duration, taskDefinitionKey, priority, due, parentTaskId, followUp, tenantId, removalTime, rootProcessInstanceId FROM {{ source('camunda_history', 'task_startedafter') }} 
        UNION  
        SELECT id, processDefinitionKey, processDefinitionId, processInstanceId, executionId, caseDefinitionKey, caseDefinitionId, caseInstanceId, caseExecutionId, activityInstanceId, name, description, deleteReason, owner, assignee, startTime, endTime, duration, taskDefinitionKey, priority, due, parentTaskId, followUp, tenantId, removalTime, rootProcessInstanceId FROM {{ source('camunda_history', 'task_finishedafter') }} 
) AS merged 
ORDER BY id, starttime
