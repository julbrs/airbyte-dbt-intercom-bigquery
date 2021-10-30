{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('intercom_conversations_teammates', 'teammates', 'admins') }}
select
    _airbyte_teammates_hashid,
    {{ json_extract_scalar(unnested_column_value('admins'), ['id'], ['id']) }} as id,
    {{ json_extract_scalar(unnested_column_value('admins'), ['type'], ['type']) }} as type,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_teammates') }} as table_alias
{{ cross_join_unnest('teammates', 'admins') }}
where admins is not null
-- admins at intercom_conversations/teammates/admins

