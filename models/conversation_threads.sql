with base_conversation_threads as (
    select * from {{ ref('base_conversation_threads') }}
)
, conversation_thread_response_times as (
    select * from {{ ref('conversation_thread_response_times') }}
)
, conversation_thread_sequence_numbers as (
    select * from {{ ref('conversation_thread_sequence_numbers') }}
)
select
    t.*
    , r.first_customer_message_at
    , r.last_customer_message_at
    , r.first_response_time_in_minutes
    , r.last_response_time_in_minutes
    , r.first_response_time_in_hours
    , r.last_response_time_in_hours
    , s.number_of_conversation_customer_messages_at_creation
    , s.number_of_conversation_user_messages_at_creation
from base_conversation_threads t
left join conversation_thread_response_times r
    on r.thread_id = t.id
left join conversation_thread_sequence_numbers s
    on s.thread_id = t.id
