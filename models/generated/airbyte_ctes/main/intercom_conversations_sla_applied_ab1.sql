{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_intercom_conversations_hashid,
    {{ json_extract_scalar('sla_applied', ['sla_name'], ['sla_name']) }} as sla_name,
    {{ json_extract_scalar('sla_applied', ['sla_status'], ['sla_status']) }} as sla_status,
    _airbyte_emitted_at
from {{ ref('intercom_conversations') }} as table_alias
where sla_applied is not null
-- sla_applied at intercom_conversations/sla_applied

