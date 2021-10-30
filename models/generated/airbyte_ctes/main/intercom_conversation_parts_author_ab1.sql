{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_intercom_conversation_parts_hashid,
    {{ json_extract_scalar('author', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('author', ['name'], ['name']) }} as name,
    {{ json_extract_scalar('author', ['type'], ['type']) }} as type,
    {{ json_extract_scalar('author', ['email'], ['email']) }} as email,
    _airbyte_emitted_at
from {{ ref('intercom_conversation_parts') }} as table_alias
where author is not null
-- author at intercom_conversation_parts/author

