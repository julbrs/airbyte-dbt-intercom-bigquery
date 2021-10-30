{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_intercom_conversations_hashid,
    sla_name,
    sla_status,
    _airbyte_emitted_at,
    _airbyte_sla_applied_hashid
from {{ ref('intercom_conversations_sla_applied_ab3') }}
-- sla_applied at intercom_conversations/sla_applied from {{ ref('intercom_conversations') }}

