{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_intercom_conversations_hashid,
    id,
    name,
    type,
    email,
    _airbyte_emitted_at,
    _airbyte_assignee_hashid
from {{ ref('intercom_conversations_assignee_ab3') }}
-- assignee at intercom_conversations/assignee from {{ ref('intercom_conversations') }}

