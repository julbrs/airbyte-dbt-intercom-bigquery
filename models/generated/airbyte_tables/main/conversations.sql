{{ config(schema="main", tags=["top-level"]) }}
-- Final base SQL model
select
    'intercom' as source,
    id,
    created_at,
    conversation_id as ticket_id,
    _airbyte_emitted_at,
    _airbyte_intercom_conversation_parts_hashid
from {{ ref('intercom_conversation_parts_ab3') }}
-- intercom_conversation_parts from {{ source('main', '_airbyte_raw_intercom_conversation_parts') }}

