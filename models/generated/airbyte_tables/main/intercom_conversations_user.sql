{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_intercom_conversations_hashid,
    id,
    type,
    _airbyte_emitted_at,
    _airbyte_user_hashid
from {{ ref('intercom_conversations_user_ab3') }}
-- user at intercom_conversations/user from {{ ref('intercom_conversations') }}

