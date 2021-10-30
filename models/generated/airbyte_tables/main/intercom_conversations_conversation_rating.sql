{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_intercom_conversations_hashid,
    rating,
    remark,
    customer,
    teammate,
    created_at,
    _airbyte_emitted_at,
    _airbyte_conversation_rating_hashid
from {{ ref('intercom_conversations_conversation_rating_ab3') }}
-- conversation_rating at intercom_conversations/conversation_rating from {{ ref('intercom_conversations') }}

