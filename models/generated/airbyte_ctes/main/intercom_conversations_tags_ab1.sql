{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_intercom_conversations_hashid,
    {{ json_extract_scalar('tags', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('tags', ['name'], ['name']) }} as name,
    {{ json_extract_scalar('tags', ['type'], ['type']) }} as type,
    {{ json_extract_scalar('tags', ['applied_at'], ['applied_at']) }} as applied_at,
    {{ json_extract('table_alias', 'tags', ['applied_by'], ['applied_by']) }} as applied_by,
    _airbyte_emitted_at
from {{ ref('intercom_conversations') }} as table_alias
where tags is not null
-- tags at intercom_conversations/tags

