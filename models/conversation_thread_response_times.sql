with base_conversation_threads as (
    select * from {{ ref('base_conversation_threads') }}
)
, categorized_created_at as (
    select
        id
        , conversation_id
        , created_at
        , case when was_created_by_customer
            then created_at
        end as created_at_by_customer
        , case when not was_created_by_customer
            then created_at
        end as created_at_by_user
    from base_conversation_threads
    where type in ('customer', 'message')
)
, customer_message_times as (
    select
    id
    , id as thread_id
    , conversation_id
    , created_at
    , first_value(created_at_by_customer)
        over (
        partition by conversation_id
        order by created_at asc
        rows between unbounded preceding and 1 preceding
        ) first_customer_message_at
    , last_value(created_at_by_customer)
        over (
        partition by conversation_id
        order by created_at asc
        rows between unbounded preceding and 1 preceding
        ) last_customer_message_at
    from categorized_created_at
    order by created_at
)
, response_times as (
    select
        *
        , timestamp_diff(created_at, first_customer_message_at, minute) first_response_time_in_minutes
        , timestamp_diff(created_at, last_customer_message_at, minute) last_response_time_in_minutes
    from customer_message_times
)
select
    *
    , floor(first_response_time_in_minutes / 60) as first_response_time_in_hours
    , floor(first_response_time_in_minutes / 60) as last_response_time_in_hours
from response_times