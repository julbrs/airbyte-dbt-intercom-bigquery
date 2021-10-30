{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_conversation_message_hashid,
    {{ json_extract_scalar('author', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('author', ['name'], ['name']) }} as name,
    {{ json_extract_scalar('author', ['type'], ['type']) }} as type,
    {{ json_extract_scalar('author', ['email'], ['email']) }} as email,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_conversation_message') }} as table_alias
where author is not null
-- author at intercom_conversations/conversation_message/author

