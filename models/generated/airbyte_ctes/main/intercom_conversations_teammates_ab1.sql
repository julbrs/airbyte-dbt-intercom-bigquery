{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_intercom_conversations_hashid,
    {{ json_extract_scalar('teammates', ['type'], ['type']) }} as type,
    {{ json_extract_array('teammates', ['admins'], ['admins']) }} as admins,
    _airbyte_emitted_at
from {{ ref('intercom_conversations') }} as table_alias
where teammates is not null
-- teammates at intercom_conversations/teammates

