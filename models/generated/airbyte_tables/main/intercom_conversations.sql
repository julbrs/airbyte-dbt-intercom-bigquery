{{ config(schema="main", tags=["top-level"]) }}
-- Final base SQL model
select
    id,
    open,
    read,
    tags,
    type,
    user,
    state,
    title,
    source,
    sent_at,
    assignee,
    contacts,
    priority,
    redacted,
    customers,
    teammates,
    created_at,
    statistics,
    updated_at,
    sla_applied,
    snoozed_until,
    waiting_since,
    team_assignee_id,
    admin_assignee_id,
    conversation_rating,
    first_contact_reply,
    conversation_message,
    customer_first_reply,
    _airbyte_emitted_at,
    _airbyte_intercom_conversations_hashid
from {{ ref('intercom_conversations_ab3') }}
-- intercom_conversations from {{ source('main', '_airbyte_raw_intercom_conversations') }}

