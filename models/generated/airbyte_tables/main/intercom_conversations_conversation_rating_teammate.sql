{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_conversation_rating_hashid,
    id,
    type,
    _airbyte_emitted_at,
    _airbyte_teammate_hashid
from {{ ref('intercom_conversations_conversation_rating_teammate_ab3') }}
-- teammate at intercom_conversations/conversation_rating/teammate from {{ ref('intercom_conversations_conversation_rating') }}

