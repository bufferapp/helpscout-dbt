with base_users as (
    select * from {{ ref('base_users') }}
)
select * from base_users