{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_tags_hashid,
    {{ json_extract_scalar('applied_by', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('applied_by', ['type'], ['type']) }} as type,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_tags') }} as table_alias
where applied_by is not null
-- applied_by at intercom_conversations/tags/applied_by

