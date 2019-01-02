select
    id
    , created_at
    , modified_at as updated_at
    , _fivetran_synced as last_synced_at
    , _fivetran_deleted as is_deleted
    , email
    , first_name
    , last_name
    , photo_url
    , role
    , time_zone
from `buffer-data.helpscout.user`