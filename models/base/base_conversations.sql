select
    id
    , created_at
    , modified_at as updated_at
    , _fivetran_synced as last_synced_at
    , closed_at
    , closed_by_id
    , closed_by_type
    , created_by_customer_id
    , created_by_type
    , created_by_user_id
    , customer_id
    , customer_type
    , folder_id
    , is_draft
    , mailbox_id
    , mailbox_name
    , number
    , owner_id
    , owner_type
    , preview
    , source_type
    , source_via
    , status
    , subject
    , type
    , custom_ticket_type as ticket_type
    , custom_notes as notes
    , custom_signals as signals
    , custom_feedback as feedback
    , custom_urgency as urgency
    , custom_area
from `buffer-data.helpscout.conversation`