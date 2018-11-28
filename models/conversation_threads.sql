with base_conversation_threads as (
    select * from {{ ref('base_conversation_threads') }}
)
select * from base_conversation_threads