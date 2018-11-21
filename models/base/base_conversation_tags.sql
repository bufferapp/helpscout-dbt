select
    c.id as conversation_id
    , array_agg(
      struct(
          md5(concat(cast(c.id as string), cast(t.index as string))) as id
          , t.index
          , t.tag
        )
    ) as tag
from
`buffer-data.helpscout.conversation` c
inner join `buffer-data.helpscout.conversation_tag` t on t.conversation_id = c.id
group by 1