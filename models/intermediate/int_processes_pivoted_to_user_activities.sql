
with

    activities as (
        select * from {{ ref('stg_camunda_history__activity_instances') }}
    ),
    processes as (
        select * from {{ ref('stg_camunda_history__process_instances') }}
    ),

pivot_and_split_processes_to_user_activities_grain as (

-- List current activities
select pi.business_key, ai.activity_name ,ai.start_time, ai.end_time, ai.duration, ai.sequence_counter
from processes pi, activities ai
where pi.root_process_instance_id = ai.root_process_instance_id
  and ai.activity_type = 'userTask'
  and ai.sequence_counter =
      (select max(ai2.sequence_counter) from activities ai2 where
          ai.root_process_instance_id = ai2.root_process_instance_id)
)

select * from pivot_and_split_processes_to_user_activities_grain