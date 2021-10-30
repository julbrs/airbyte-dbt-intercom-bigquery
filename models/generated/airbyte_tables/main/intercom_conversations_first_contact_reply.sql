{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_intercom_conversations_hashid,
    url,
    type,
    created_at,
    _airbyte_emitted_at,
    _airbyte_first_contact_reply_hashid
from {{ ref('intercom_conversations_first_contact_reply_ab3') }}
-- first_contact_reply at intercom_conversations/first_contact_reply from {{ ref('intercom_conversations') }}

