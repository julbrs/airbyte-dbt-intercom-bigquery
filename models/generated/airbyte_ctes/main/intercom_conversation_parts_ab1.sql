{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['body'], ['body']) }} as body,
    {{ json_extract('table_alias', '_airbyte_data', ['author'], ['author']) }} as author,
    {{ json_extract_scalar('_airbyte_data', '$.author.type') }} as type,
    {{ json_extract_scalar('_airbyte_data', ['redacted'], ['redacted']) }} as redacted,
    {{ json_extract_scalar('_airbyte_data', ['part_type'], ['part_type']) }} as part_type,
    {{ json_extract_scalar('_airbyte_data', ['created_at'], ['created_at']) }} as created_at,
    {{ json_extract_scalar('_airbyte_data', ['updated_at'], ['updated_at']) }} as updated_at,
    {{ json_extract('table_alias', '_airbyte_data', ['assigned_to']) }} as assigned_to,
    {{ json_extract('table_alias', '_airbyte_data', ['attachments']) }} as attachments,
    {{ json_extract_scalar('_airbyte_data', ['external_id'], ['external_id']) }} as external_id,
    {{ json_extract_scalar('_airbyte_data', ['notified_at'], ['notified_at']) }} as notified_at,
    {{ json_extract_scalar('_airbyte_data', ['conversation_id'], ['conversation_id']) }} as conversation_id,
    {{ json_extract_scalar('_airbyte_data', ['conversation_created_at'], ['conversation_created_at']) }} as conversation_created_at,
    {{ json_extract_scalar('_airbyte_data', ['conversation_updated_at'], ['conversation_updated_at']) }} as conversation_updated_at,
    {{ json_extract_scalar('_airbyte_data', ['conversation_total_parts'], ['conversation_total_parts']) }} as conversation_total_parts,
    _airbyte_emitted_at
from {{ source('main', '_airbyte_raw_intercom_conversation_parts') }} as table_alias
-- intercom_conversation_parts

