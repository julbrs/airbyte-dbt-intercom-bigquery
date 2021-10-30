{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_conversation_rating_hashid,
    id,
    type,
    _airbyte_emitted_at,
    _airbyte_customer_hashid
from {{ ref('intercom_conversations_conversation_rating_customer_ab3') }}
-- customer at intercom_conversations/conversation_rating/customer from {{ ref('intercom_conversations_conversation_rating') }}

