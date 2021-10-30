{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_intercom_conversation_parts_hashid,
    id,
    name,
    type,
    email,
    _airbyte_emitted_at,
    _airbyte_author_hashid
from {{ ref('intercom_conversation_parts_author_ab3') }}
-- author at intercom_conversation_parts/author from {{ ref('intercom_conversation_parts') }}

