{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_intercom_conversations_hashid,
    id,
    name,
    type,
    applied_at,
    applied_by,
    _airbyte_emitted_at,
    _airbyte_tags_hashid
from {{ ref('intercom_conversations_tags_ab3') }}
-- tags at intercom_conversations/tags from {{ ref('intercom_conversations') }}

