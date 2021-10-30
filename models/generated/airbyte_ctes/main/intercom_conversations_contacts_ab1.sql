{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_intercom_conversations_hashid,
    {{ json_extract_scalar('contacts', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('contacts', ['type'], ['type']) }} as type,
    _airbyte_emitted_at
from {{ ref('intercom_conversations') }} as table_alias
where contacts is not null
-- contacts at intercom_conversations/contacts

