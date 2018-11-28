select
    id
    , created_at
    , _fivetran_synced as last_synced_at
    , conversation_id
    , action_type
    , assigned_to_id
    , assigned_to_type
    , body
    , created_by_customer as was_created_by_customer
    , created_by_customer_id as creator_customer_id
    , created_by_type as creator
    , created_by_user_id as creator_user_id
    , opened_at
    , saved_reply_id
    , source_type
    , source_via
    , state
    , status
    , type
from `buffer-data.helpscout.conversation_thread`