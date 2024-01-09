
with

    activities as (
        select * from {{ ref('stg_camunda_history__activity_instances') }}
    ),
    processes as (
        select * from {{ ref('stg_camunda_history__process_instances') }}
    ),

pivot_and_split_processes_to_user_activities_open_tasks_grain as (

-- List current activities
select pi.business_key, ai.activity_name ,ai.start_time, ai.end_time, ai.duration, ai.sequence_counter
from processes pi, activities ai
where pi.root_process_instance_id = ai.root_process_instance_id
  and ai.end_time IS NULL
    order by ai.start_time desc)

select * from pivot_and_split_processes_to_user_activities_open_tasks_grain