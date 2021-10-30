{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_teammates_hashid,
    id,
    type,
    _airbyte_emitted_at,
    _airbyte_admins_hashid
from {{ ref('intercom_conversations_teammates_admins_ab3') }}
-- admins at intercom_conversations/teammates/admins from {{ ref('intercom_conversations_teammates') }}

