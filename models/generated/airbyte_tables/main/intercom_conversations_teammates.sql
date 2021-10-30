{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_intercom_conversations_hashid,
    type,
    admins,
    _airbyte_emitted_at,
    _airbyte_teammates_hashid
from {{ ref('intercom_conversations_teammates_ab3') }}
-- teammates at intercom_conversations/teammates from {{ ref('intercom_conversations') }}

