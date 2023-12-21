with source as (

    select * from
        {{ source( 'public', 'act_hi_actinst') }}
),

renamed as (

    select
        id_ as process_instance_id,
        start_time_ as start_time,
        end_time_ as end_time,
        duration_ as duration,
        root_proc_inst_id_ as root_process_instance_id,
        sequence_counter_ as sequence_counter,
        act_name_ as activity_name,
        act_type_ as activity_type,
        assignee_ as assignee
    from source

)

select * from renamed