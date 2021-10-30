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
    attachments,
    delivered_as,
    _airbyte_emitted_at,
    _airbyte_conversation_message_hashid
from {{ ref('intercom_conversations_conversation_message_ab3') }}
-- conversation_message at intercom_conversations/conversation_message from {{ ref('intercom_conversations') }}

