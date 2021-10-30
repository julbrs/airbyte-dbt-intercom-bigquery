{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_intercom_conversations_hashid,
    id,
    type,
    _airbyte_emitted_at,
    _airbyte_contacts_hashid
from {{ ref('intercom_conversations_contacts_ab3') }}
-- contacts at intercom_conversations/contacts from {{ ref('intercom_conversations') }}

