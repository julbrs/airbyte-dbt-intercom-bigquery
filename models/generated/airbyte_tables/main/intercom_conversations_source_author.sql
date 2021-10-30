{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_source_hashid,
    id,
    name,
    type,
    email,
    _airbyte_emitted_at,
    _airbyte_author_hashid
from {{ ref('intercom_conversations_source_author_ab3') }}
-- author at intercom_conversations/source/author from {{ ref('intercom_conversations_source') }}

