with base_conversations as (
    select * from {{ ref('base_conversations') }}
)
, base_conversation_tags as (
    select * from {{ ref('base_conversation_tags') }}
)
select
    c.*
    , t.tag
    , exists(
        select *
        from unnest(t.tag)
        where tag = 'auto-tag-spam'
    ) as tagged_as_spam
    , exists(
        select *
        from unnest(t.tag)
        where tag = 'auto-respond'
    ) as tagged_as_auto_respond
from base_conversations c
left join base_conversation_tags t
    on t.conversation_id = c.id