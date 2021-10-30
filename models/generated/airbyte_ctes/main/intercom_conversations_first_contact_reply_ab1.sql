{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_intercom_conversations_hashid,
    {{ json_extract_scalar('first_contact_reply', ['url'], ['url']) }} as url,
    {{ json_extract_scalar('first_contact_reply', ['type'], ['type']) }} as type,
    {{ json_extract_scalar('first_contact_reply', ['created_at'], ['created_at']) }} as created_at,
    _airbyte_emitted_at
from {{ ref('intercom_conversations') }} as table_alias
where first_contact_reply is not null
-- first_contact_reply at intercom_conversations/first_contact_reply

