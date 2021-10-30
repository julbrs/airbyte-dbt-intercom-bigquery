{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_conversation_rating_hashid,
    {{ json_extract_scalar('teammate', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('teammate', ['type'], ['type']) }} as type,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_conversation_rating') }} as table_alias
where teammate is not null
-- teammate at intercom_conversations/conversation_rating/teammate

