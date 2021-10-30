{{ config(schema="main", tags=["top-level"]) }}
-- Final base SQL model
select
    'intercom' as source,
    id,
    state,
    created_at,
    updated_at,
    _airbyte_emitted_at,
    _airbyte_intercom_conversations_hashid
from {{ ref('intercom_conversations_ab3') }}
-- intercom_conversations from {{ source('main', '_airbyte_raw_intercom_conversations') }}

