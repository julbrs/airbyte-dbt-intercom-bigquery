{{ config(schema="main", tags=["top-level"]) }}
-- Final base SQL model
select
    id,
    body,
    type,
    author,
    redacted,
    part_type,
    created_at,
    updated_at,
    assigned_to,
    attachments,
    external_id,
    notified_at,
    conversation_id,
    conversation_created_at,
    conversation_updated_at,
    conversation_total_parts,
    _airbyte_emitted_at,
    _airbyte_intercom_conversation_parts_hashid
from {{ ref('intercom_conversation_parts_ab3') }}
-- intercom_conversation_parts from {{ source('main', '_airbyte_raw_intercom_conversation_parts') }}

