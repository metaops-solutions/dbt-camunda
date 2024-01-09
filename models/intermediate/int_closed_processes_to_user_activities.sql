
with

    activities as (
        select * from {{ ref('stg_camunda_history__activity_instances') }}
    ),
    processes as (
        select * from {{ ref('stg_camunda_history__process_instances') }}
    ),

pivot_and_split_processes_to_user_activities_closed_tasks_grain as (

-- List closed activities
    select pi.business_key, ai.activity_name, ai.start_time, ai.end_time, ai.duration, ai.sequence_counter
    from processes pi,
         activities ai
    where pi.root_process_instance_id = ai.root_process_instance_id
      and ai.end_time IS NOT NULL
    order by ai.start_time, ai.sequence_counter desc)

select * from pivot_and_split_processes_to_user_activities_closed_tasks_grain