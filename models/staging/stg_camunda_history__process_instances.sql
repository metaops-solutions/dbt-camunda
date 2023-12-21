with source as (

    select * from
        {{ source( 'public', 'act_hi_procinst') }}
),

renamed as (

    select
        id_ as process_instance_id,
        business_key_ as business_key,
        start_time_ as start_time,
        end_time_ as end_time,
        duration_ as duration,
        root_proc_inst_id_ as root_process_instance_id,
        state_ as state
    from source

)

select * from renamed