{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_intercom_conversations_hashid,
    id,
    url,
    body,
    type,
    author,
    subject,
    redacted,
    attachments,
    delivered_as,
    _airbyte_emitted_at,
    _airbyte_source_hashid
from {{ ref('intercom_conversations_source_ab3') }}
-- source at intercom_conversations/source from {{ ref('intercom_conversations') }}

