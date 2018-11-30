with base_conversation_threads as (
    select * from {{ ref('base_conversation_threads') }}
)
select
    id
    , id as thread_id
    , conversation_id
    , created_at
    , row_number() over (
        partition by
          conversation_id,
          (case when was_created_by_customer then 1 end)
        order by created_at
       ) as number_of_conversation_customer_messages_at_creation
   , row_number() over (
        partition by
          conversation_id,
          (case when not was_created_by_customer then 1 end)
        order by created_at
       ) as number_of_conversation_user_messages_at_creation
from base_conversation_threads
where type in ('customer', 'message')