{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_intercom_conversations_hashid,
    url,
    type,
    created_at,
    _airbyte_emitted_at,
    _airbyte_customer_first_reply_hashid
from {{ ref('intercom_conversations_customer_first_reply_ab3') }}
-- customer_first_reply at intercom_conversations/customer_first_reply from {{ ref('intercom_conversations') }}

