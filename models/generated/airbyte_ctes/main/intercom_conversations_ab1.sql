{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('_airbyte_data', ['open'], ['open']) }} as open,
    {{ json_extract_scalar('_airbyte_data', ['read'], ['read']) }} as read,
    {{ json_extract('table_alias', '_airbyte_data', ['tags'], ['tags']) }} as tags,
    {{ json_extract_scalar('_airbyte_data', ['type'], ['type']) }} as type,
    {{ json_extract('table_alias', '_airbyte_data', ['user'], ['user']) }} as user,
    {{ json_extract_scalar('_airbyte_data', ['state'], ['state']) }} as state,
    {{ json_extract_scalar('_airbyte_data', ['title'], ['title']) }} as title,
    {{ json_extract('table_alias', '_airbyte_data', ['source'], ['source']) }} as source,
    {{ json_extract_scalar('_airbyte_data', ['sent_at'], ['sent_at']) }} as sent_at,
    {{ json_extract('table_alias', '_airbyte_data', ['assignee'], ['assignee']) }} as assignee,
    {{ json_extract('table_alias', '_airbyte_data', ['contacts'], ['contacts']) }} as contacts,
    {{ json_extract_scalar('_airbyte_data', ['priority'], ['priority']) }} as priority,
    {{ json_extract_scalar('_airbyte_data', ['redacted'], ['redacted']) }} as redacted,
    {{ json_extract('table_alias', '_airbyte_data', ['customers']) }} as customers,
    {{ json_extract('table_alias', '_airbyte_data', ['teammates'], ['teammates']) }} as teammates,
    {{ json_extract_scalar('_airbyte_data', ['created_at'], ['created_at']) }} as created_at,
    {{ json_extract('table_alias', '_airbyte_data', ['statistics'], ['statistics']) }} as statistics,
    {{ json_extract_scalar('_airbyte_data', ['updated_at'], ['updated_at']) }} as updated_at,
    {{ json_extract('table_alias', '_airbyte_data', ['sla_applied'], ['sla_applied']) }} as sla_applied,
    {{ json_extract_scalar('_airbyte_data', ['snoozed_until'], ['snoozed_until']) }} as snoozed_until,
    {{ json_extract_scalar('_airbyte_data', ['waiting_since'], ['waiting_since']) }} as waiting_since,
    {{ json_extract_scalar('_airbyte_data', ['team_assignee_id'], ['team_assignee_id']) }} as team_assignee_id,
    {{ json_extract_scalar('_airbyte_data', ['admin_assignee_id'], ['admin_assignee_id']) }} as admin_assignee_id,
    {{ json_extract('table_alias', '_airbyte_data', ['conversation_rating'], ['conversation_rating']) }} as conversation_rating,
    {{ json_extract('table_alias', '_airbyte_data', ['first_contact_reply'], ['first_contact_reply']) }} as first_contact_reply,
    {{ json_extract('table_alias', '_airbyte_data', ['conversation_message'], ['conversation_message']) }} as conversation_message,
    {{ json_extract('table_alias', '_airbyte_data', ['customer_first_reply'], ['customer_first_reply']) }} as customer_first_reply,
    _airbyte_emitted_at
from {{ source('main', '_airbyte_raw_intercom_conversations') }} as table_alias
-- intercom_conversations

