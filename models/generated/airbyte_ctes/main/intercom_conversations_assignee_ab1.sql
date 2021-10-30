{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_intercom_conversations_hashid,
    {{ json_extract_scalar('assignee', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('assignee', ['name'], ['name']) }} as name,
    {{ json_extract_scalar('assignee', ['type'], ['type']) }} as type,
    {{ json_extract_scalar('assignee', ['email'], ['email']) }} as email,
    _airbyte_emitted_at
from {{ ref('intercom_conversations') }} as table_alias
where assignee is not null
-- assignee at intercom_conversations/assignee

