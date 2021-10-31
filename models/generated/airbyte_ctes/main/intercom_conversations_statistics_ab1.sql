{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_intercom_conversations_hashid,
    {{ json_extract_scalar('statistics', ['type'], ['type']) }} as type,
    {{ json_extract_scalar('statistics', ['count_reopens'], ['count_reopens']) }} as count_reopens,
    {{ json_extract_scalar('statistics', ['last_close_at'], ['last_close_at']) }} as last_close_at,
    {{ json_extract_scalar('statistics', ['first_close_at'], ['first_close_at']) }} as first_close_at,
    {{ json_extract_scalar('statistics', ['count_assignments'], ['count_assignments']) }} as count_assignments,
    {{ json_extract_scalar('statistics', ['last_closed_by_id'], ['last_closed_by_id']) }} as last_closed_by_id,
    {{ json_extract_scalar('statistics', ['last_assignment_at'], ['last_assignment_at']) }} as last_assignment_at,
    {{ json_extract_scalar('statistics', ['time_to_assignment'], ['time_to_assignment']) }} as time_to_assignment,
    {{ json_extract_scalar('statistics', ['time_to_last_close'], ['time_to_last_close']) }} as time_to_last_close,
    {{ json_extract_scalar('statistics', ['first_assignment_at'], ['first_assignment_at']) }} as first_assignment_at,
    {{ json_extract_scalar('statistics', ['last_admin_reply_at'], ['last_admin_reply_at']) }} as last_admin_reply_at,
    {{ json_extract_scalar('statistics', ['time_to_admin_reply'], ['time_to_admin_reply']) }} as time_to_admin_reply,
    {{ json_extract_scalar('statistics', ['time_to_first_close'], ['time_to_first_close']) }} as time_to_first_close,
    {{ json_extract_scalar('statistics', ['first_admin_reply_at'], ['first_admin_reply_at']) }} as first_admin_reply_at,
    {{ json_extract_scalar('statistics', ['median_time_to_reply'], ['median_time_to_reply']) }} as median_time_to_reply,
    {{ json_extract_scalar('statistics', ['last_contact_reply_at'], ['last_contact_reply_at']) }} as last_contact_reply_at,
    {{ json_extract_scalar('statistics', ['first_contact_reply_at'], ['first_contact_reply_at']) }} as first_contact_reply_at,
    {{ json_extract_scalar('statistics', ['count_conversation_parts'], ['count_conversation_parts']) }} as count_conversation_parts,
    {{ json_extract_scalar('statistics', ['last_assignment_admin_reply_at'], ['last_assignment_admin_reply_at']) }} as last_assignment_admin_reply_at,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_ab3') }} as table_alias
where statistics is not null
-- statistics at intercom_conversations/statistics