{{ config(schema="main", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_tags_hashid,
    id,
    type,
    _airbyte_emitted_at,
    _airbyte_applied_by_hashid
from {{ ref('intercom_conversations_tags_applied_by_ab3') }}
-- applied_by at intercom_conversations/tags/applied_by from {{ ref('intercom_conversations_tags') }}

