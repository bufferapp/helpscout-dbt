select
    id
    , created_at
    , modified_at as updated_at
    , _fivetran_synced as last_synced_at
    , email
    , name
    , slug
from `buffer-data.helpscout.mailbox`