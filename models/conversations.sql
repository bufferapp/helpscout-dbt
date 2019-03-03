with base_conversations as (
    select * from {{ ref('base_conversations') }}
)
, base_conversation_tags as (
    select * from {{ ref('base_conversation_tags') }}
)
, base_mailboxes as (
    select * from {{ ref('base_mailboxes') }}
)
, conversation_threads as (
    select * from {{ ref('conversation_threads') }}
)
select
    {{ dbt_utils.star(from=ref('base_conversations'), except=["mailbox_name"], relation_alias="c") }}
    , m.name as mailbox_name
    , t.tag as tags
    , (select string_agg(tag) from unnest(t.tag)) as all_tags
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
left join conversation_threads ct
    on ct.conversation_id = c.id
left join base_mailboxes m
    on m.id = c.mailbox_id